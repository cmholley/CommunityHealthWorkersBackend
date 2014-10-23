package dash.dao;

import java.util.List;

import dash.pojo.Location;

/**
 * @Author plindner
 */
public interface LocationDao {
	public List<LocationEntity> getLocations(String orderByInsertionDate);
	public List<LocationEntity> getRecentLocations(int numberOfDaysToLookBack);

	public LocationEntity getLocationByName(String name);
	public LocationEntity getLocationById(Long id);

	public void deleteLocation(Location location);

	public Long createLocation(LocationEntity location);

	public void updateLocation(LocationEntity location);

	public void deleteLocations();
}
