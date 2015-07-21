package dash.dao;

import java.util.List;

import dash.pojo.Class;
import dash.pojo.Location;


/*
 * @Author tswensen
 */
public interface ClassDao {
	public List<ClassEntity> getClasses(String orderByInsertionDate);

	public List<ClassEntity> getRecentClasses(int numberOfDaysToLookBack);

	public ClassEntity getClassById(Long id);

	/**
	 * Find class by name
	 *
	 * @param class
	 * @return the class with the name specified or null if not existent
	 */
	public ClassEntity getClassByName(String name);
	
	/**
	 * Returns all of the classes by a given location
	 * 
	 * @param location
	 * @return the list of classess
	 * 
	 */
	public List<ClassEntity> getClassesByLocation(Location location);

	public void deleteClass(Class clas);

	public Long createClass(ClassEntity classentity);

	public void updateClass(ClassEntity classentity);

	/** removes all classes */
	public void deleteClasses();

	public List<ClassEntity> getTodaysClasses();

	public List<String> getMembersForClass(ClassEntity classEntity);

}
