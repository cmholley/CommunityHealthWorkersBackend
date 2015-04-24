package dash.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.security.acls.domain.PrincipalSid;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.transaction.annotation.Transactional;
import dash.dao.ClassDao;
import dash.dao.ClassEntity;
import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.helpers.NullAwareBeanUtilsBean;
import dash.pojo.Core;
import dash.pojo.Location;
import dash.pojo.Class;
import dash.pojo.User;
import dash.security.CustomPermission;
import dash.security.GenericAclController;

public class ClassServiceDbAccessImpl extends ApplicationObjectSupport
		implements ClassService {

	@Autowired
	ClassDao classDao;

	@Autowired
	private MutableAclService mutableAclService;

	@Autowired
	private GenericAclController<Class> aclController;

	@Autowired
	private CoreService coreService;

	/********************* Create related methods implementation ***********************/
	@Override
	@Transactional
	public Long createClass(Class clas, Location location) throws AppException {

		validateInputForCreation(clas);

		ClassEntity newEnt = new ClassEntity(clas);
		long classId = classDao.createClass(newEnt);
		clas.setId(classId);
		aclController.createACL(clas);
		aclController.createAce(clas, CustomPermission.MANAGER);

		// add cores to intersection table
		List<Core> listCores = new ArrayList<Core>();
		for (Long core_id : clas.getCores()) {
			listCores.add(new Core(core_id, classId));
		}
		coreService.createCores(listCores);

		return classId;
	}

	@Override
	@Transactional
	public void createClasses(List<Class> classes, Location location)
			throws AppException {
		for (Class clas : classes) {
			createClass(clas, location);
		}
	}

	private void validateInputForCreation(Class clas) throws AppException {
		if (clas.getName() == null) {
			throw new AppException(
					Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Provided data not sufficient for insertion",
					"Please verify that the classname is properly generated/set",
					AppConstants.DASH_POST_URL);
		}
	}

	// ******************** Read related methods implementation
	// **********************
	@Override
	public List<Class> getClasses(String orderByInsertionDate,
			Integer numberDaysToLookBack) throws AppException {

		// verify optional parameter numberDaysToLookBack first
		if (numberDaysToLookBack != null) {
			List<ClassEntity> recentClasses = classDao
					.getRecentClasses(numberDaysToLookBack);
			return getClassesFromEntities(recentClasses);
		}

		if (isOrderByInsertionDateParameterValid(orderByInsertionDate)) {
			throw new AppException(
					Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Please set either ASC or DESC for the orderByInsertionDate parameter",
					null, AppConstants.DASH_POST_URL);
		}
		List<ClassEntity> classes = classDao.getClasses(orderByInsertionDate);

		return getClassesFromEntities(classes);
	}

	@Override
	public List<Class> getClassesByLocation(Location location) {

		List<ClassEntity> classes = classDao.getClassesByLocation(location);
		return getClassesFromEntities(classes);

	}

	private boolean isOrderByInsertionDateParameterValid(
			String orderByInsertionDate) {
		return orderByInsertionDate != null
				&& !("ASC".equalsIgnoreCase(orderByInsertionDate) || "DESC"
						.equalsIgnoreCase(orderByInsertionDate));
	}

	@Override
	public Class verifyClassExistenceById(Long id) {
		ClassEntity classById = classDao.getClassById(id);
		if (classById == null) {
			return null;
		} else {
			return new Class(classById);
		}
	}

	@Override
	public Class getClassById(Long id) throws AppException {
		ClassEntity classById = classDao.getClassById(id);
		if (classById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404, "The class you requested with id " + id
							+ " was not found in the database",
					"Verify the existence of the class with the id " + id
							+ " in the database", AppConstants.DASH_POST_URL);
		}

		return new Class(classDao.getClassById(id));
	}

	@Override
	public List<Class> getClassesByMembership(String orderByInsertionDate,
			Integer numberDaysToLookBack) throws AppException {

		return getClasses(orderByInsertionDate, numberDaysToLookBack);
	}

	private List<Class> getClassesFromEntities(List<ClassEntity> classEntities) {
		List<Class> response = new ArrayList<Class>();
		for (ClassEntity classEntity : classEntities) {
			response.add(new Class(classEntity));
		}

		return response;
	}

	public List<Class> getRecentClasses(int numberOfDaysToLookBack) {
		List<ClassEntity> recentClasses = classDao
				.getRecentClasses(numberOfDaysToLookBack);

		return getClassesFromEntities(recentClasses);
	}

	/********************* UPDATE-related methods implementation ***********************/
	@Override
	@Transactional
	public void updateFullyClass(Class clas) throws AppException {
		// do a validation to verify FULL update with PUT

		Class verifyClassExistenceById = verifyClassExistenceById(clas.getId());
		if (verifyClassExistenceById == null) {
			throw new AppException(
					Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ clas.getId(), AppConstants.DASH_POST_URL);
		}
		copyAllProperties(verifyClassExistenceById, clas);
		classDao.updateClass(new ClassEntity(verifyClassExistenceById));

	}

	private void copyAllProperties(Class verifyClassExistenceById, Class clas) {

		BeanUtilsBean withNull = new BeanUtilsBean();
		try {
			withNull.copyProperty(verifyClassExistenceById, "description",
					clas.getDescription());
			withNull.copyProperty(verifyClassExistenceById, "name",
					clas.getName());
			withNull.copyProperty(verifyClassExistenceById, "time",
					clas.getTime());
			withNull.copyProperty(verifyClassExistenceById, "duration",
					clas.getDuration());
			withNull.copyProperty(verifyClassExistenceById, "room",
					clas.getRoom());
			withNull.copyProperty(verifyClassExistenceById, "address",
					clas.getAddress());
			withNull.copyProperty(verifyClassExistenceById, "finished",
					clas.getFinished());

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/********************* DELETE-related methods implementation ***********************/

	@Override
	@Transactional
	public void deleteClass(Class clas) throws AppException {

		classDao.deleteClass(clas);
		aclController.deleteACL(clas);

	}

	@Override
	@Transactional
	// TODO: This shouldn't exist? If it must, then it needs to accept a list of
	// Classes to delete
	public void deleteClasses() {
		classDao.deleteClasses();
	}

	/****************** Update Related Methods ***********************/
	@Override
	@Transactional
	public void updatePartiallyClass(Class clas) throws AppException {
		// do a validation to verify existence of the resource
		Class verifyClassExistenceById = verifyClassExistenceById(clas.getId());
		if (verifyClassExistenceById == null) {
			throw new AppException(
					Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ clas.getId(), AppConstants.DASH_POST_URL);
		}
		copyPartialProperties(verifyClassExistenceById, clas);
		classDao.updateClass(new ClassEntity(verifyClassExistenceById));

	}

	private void copyPartialProperties(Class verifyClassExistenceById,
			Class clas) {

		BeanUtilsBean notNull = new NullAwareBeanUtilsBean();
		try {
			notNull.copyProperties(verifyClassExistenceById, clas);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	@Transactional
	public void addMember(User user, Class clas) throws AppException {
		aclController.createAce(clas, CustomPermission.MEMBER,
				new PrincipalSid(user.getUsername()));
	}

	@Override
	@Transactional
	public void deleteMember(User user, Class clas) throws AppException {
		aclController.deleteACE(clas, CustomPermission.MEMBER,
				new PrincipalSid(user.getUsername()));
	}
}
