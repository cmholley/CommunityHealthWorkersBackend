package dash.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import dash.pojo.Location;
import dash.pojo.Class;

public class ClassDaoJPA2Impl implements ClassDao {
	@PersistenceContext(unitName = "dashPersistence")
	private EntityManager entityManager;


	@Override
	public List<ClassEntity> getClasses(String orderByInsertionDate) {
		String sqlString = null;
		if(orderByInsertionDate != null){
			sqlString = "SELECT u FROM ClassEntity u"
					+ " ORDER BY u.creation_timestamp " + orderByInsertionDate;
		} else {
			sqlString = "SELECT u FROM ClassEntity u";
		}
		TypedQuery<ClassEntity> query = entityManager.createQuery(sqlString,
				ClassEntity.class);

		return query.getResultList();
	}

	@Override
	public List<ClassEntity> getRecentClasses(int numberOfDaysToLookBack) {

		Calendar calendar = new GregorianCalendar();
		calendar.setTimeZone(TimeZone.getTimeZone("UTC+6"));
		calendar.setTime(new Date());
		calendar.add(Calendar.DATE, -numberOfDaysToLookBack);//substract the number of days to look back
		Date dateToLookBackAfter = calendar.getTime();

		String qlString = "SELECT u FROM ClassEntity u where u.creation_timestamp > :dateToLookBackAfter ORDER BY u.creation_timestamp DESC";
		TypedQuery<ClassEntity> query = entityManager.createQuery(qlString,
				ClassEntity.class);
		query.setParameter("dateToLookBackAfter", dateToLookBackAfter, TemporalType.DATE);

		return query.getResultList();
	}

	@Override
	public ClassEntity getClassById(Long id) {

		try {
			String qlString = "SELECT u FROM ClassEntity u WHERE u.id = ?1";
			TypedQuery<ClassEntity> query = entityManager.createQuery(qlString,
					ClassEntity.class);
			query.setParameter(1, id);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public ClassEntity getClassByName(String name) {

		try {
			String qlString = "SELECT u FROM ClassEntity u WHERE u.name = ?1";
			TypedQuery<ClassEntity> query = entityManager.createQuery(qlString,
					ClassEntity.class);
			query.setParameter(1, name);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public List<ClassEntity> getClassesByLocation(Location location) {
		
		String qlString = "SELECT u FROM ClassEntity u where u.location_id = ?1";
		TypedQuery<ClassEntity> query = entityManager.createQuery(qlString,
				ClassEntity.class);
		query.setParameter(1, location.getId() );

		return query.getResultList();
	}


	@Override
	public void deleteClass(Class classPojo) {

		ClassEntity classEntity = entityManager
				.find(ClassEntity.class, classPojo.getId());
		entityManager.remove(classEntity);

	}

	@Override
	public Long createClass(ClassEntity classEntity) {

		classEntity.setCreation_timestamp(new Date());
		entityManager.persist(classEntity);
		entityManager.flush();// force insert to receive the id of the group

		// Give admin over new group to the new group

		return classEntity.getId();
	}

	@Override
	public void updateClass(ClassEntity classEntity) {
		//TODO think about partial update and full update
		entityManager.merge(classEntity);
	}

	@Override
	public void deleteClasses() {
		Query query = entityManager.createNativeQuery("TRUNCATE TABLE classes");
		query.executeUpdate();
	}		
}
