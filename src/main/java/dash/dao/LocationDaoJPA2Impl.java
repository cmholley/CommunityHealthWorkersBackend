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

/**
 * Location DAO implementation
 * @author plindner
 * 
 */
public class LocationDaoJPA2Impl implements LocationDao {
	@PersistenceContext(unitName = "dashPersistence")
	private EntityManager entityManager;

	@Override
	public List<LocationEntity> getLocations(String orderByInsertionDate) {
		String sqlString = null;
		if(orderByInsertionDate != null){
			sqlString = "SELECT u FROM LocationEntity u"
					+ " ORDER BY u.creation_timestamp " + orderByInsertionDate;
		} else {
			sqlString = "SELECT u FROM LocationEntity u";
		}
		TypedQuery<LocationEntity> query = entityManager.createQuery(sqlString,
				LocationEntity.class);

		return query.getResultList();
	}
	
	@Override
	public List<LocationEntity> getRecentLocations(int numberOfDaysToLookBack) {

		Calendar calendar = new GregorianCalendar();
		calendar.setTimeZone(TimeZone.getTimeZone("UTC+6"));
		calendar.setTime(new Date());
		calendar.add(Calendar.DATE, -numberOfDaysToLookBack);//substract the number of days to look back
		Date dateToLookBackAfter = calendar.getTime();

		String qlString = "SELECT u FROM LocationEntity u where u.creation_timestamp > :dateToLookBackAfter ORDER BY u.creation_timestamp DESC";
		TypedQuery<LocationEntity> query = entityManager.createQuery(qlString,
				LocationEntity.class);
		query.setParameter("dateToLookBackAfter", dateToLookBackAfter, TemporalType.DATE);

		return query.getResultList();
	}

	@Override
	public LocationEntity getLocationByName(String name) {

		try {
			String qlString = "SELECT u FROM LocationEntity u WHERE u.name = ?1";
			TypedQuery<LocationEntity> query = entityManager.createQuery(qlString,
					LocationEntity.class);
			query.setParameter(1, name);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public LocationEntity getLocationById(Long id) {

		try {
			String qlString = "SELECT u FROM LocationEntity u WHERE u.id = ?1";
			TypedQuery<LocationEntity> query = entityManager.createQuery(qlString,
					LocationEntity.class);
			query.setParameter(1, id);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Long createLocation(LocationEntity location) {

		location.setCreation_timestamp(new Date());
		entityManager.persist(location);
		entityManager.flush();// force insert to receive the id of the location

		return location.getId();
	}
	
	@Override
	public void deleteLocation(Location locationPojo) {

		LocationEntity location = entityManager
				.find(LocationEntity.class, locationPojo.getId());
		entityManager.remove(location);

	}

	@Override
	public void updateLocation(LocationEntity location) {
		//TODO think about partial update and full update
		entityManager.merge(location);
	}

	@Override
	public void deleteLocations() {
		Query query = entityManager.createNativeQuery("TRUNCATE TABLE location");
		query.executeUpdate();
	}
}
