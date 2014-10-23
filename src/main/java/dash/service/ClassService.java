package dash.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import dash.errorhandling.AppException;
import dash.pojo.Location;
import dash.pojo.Class;

public interface ClassService {
	/*
	 * ******************** Create related methods **********************
	 *
	 *Create a new class and set the current user as owner and manager.
	 */
	@PreAuthorize("hasPermission(#location, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public Long createClass(Class clas) throws AppException;

	/*
	 * ******************* Read related methods ********************
	 */
	/**
	 *
	 * @param orderByInsertionDate
	 *            - if set, it represents the order by criteria (ASC or DESC)
	 *            for displaying classes
	 * @param numberDaysToLookBack
	 *            - if set, it represents number of days to look back for classes,
	 *            null
	 * @return list with classes corresponding to search criteria
	 * @throws AppException
	 */
	
	public List<Class> getClasses(String orderByInsertionDate,
			Integer numberDaysToLookBack) throws AppException;

	public List<Class> getClassesByLocation(Location location) throws AppException;
	
	public Class getClassById(Long id) throws AppException;

	/*
	 * ******************** Update related methods **********************
	 */
	@PreAuthorize("hasPermission(#class, 'MANAGER')"
			+ "or hasRole('ROLE_MODERATOR')")
	public void updateFullyClass(Class clas, Location location) throws AppException;

	@PreAuthorize("hasPermission(#class, 'MANAGER')"
			+ "or hasRole('ROLE_MODERATOR')")
	public void updatePartiallyClass(Class clas, Location location) throws AppException;

	/*
	 * ******************** Delete related methods **********************
	 */
	@PreAuthorize("hasPermission(#class, 'MANAGER')"
			+ "or hasRole('ROLE_MODERATOR')")
	public void deleteClass(Class clas, Location location) throws AppException;
	/** removes all classes
	 * DO NOT USE, IMPROPERLY UPDATES ACL_OBJECT table
	 * Functional but does not destroy old acl's which doesnt hurt anything
	 * but they will take up space if this is commonly used */
	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void deleteClasses();
		
	/*
	 * ******************** Helper methods **********************
	 */
	public Class verifyClassExistenceById(Long id);

}
