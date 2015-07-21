package dash.service;

import java.util.List;

import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

import dash.errorhandling.AppException;
import dash.pojo.Class;
import dash.pojo.Location;
import dash.pojo.User;

public interface ClassService {
	/*
	 * ******************** Create related methods **********************
	 * 
	 * Create a new class and set the current user as owner and manager.
	 */
	@PreAuthorize("hasPermission(#loc, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public Long createClass(Class clas, Location loc) throws AppException;

	/*
	 * Create multiple groups as MANAGER.
	 */
	@PreAuthorize("hasPermission(#location, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public void createClasses(List<Class> classes, Location location)
			throws AppException;

	/*
	 * ******************* Read related methods ********************
	 */
	/**
	 *
	 * @param orderByInsertionDate
	 *            - if set, it represents the order by criteria (ASC or DESC)
	 *            for displaying classes
	 * @param numberDaysToLookBack
	 *            - if set, it represents number of days to look back for
	 *            classes, null
	 * @return list with classes corresponding to search criteria
	 * @throws AppException
	 */

	public List<Class> getClasses(String orderByInsertionDate,
			Integer numberDaysToLookBack) throws AppException;

	public List<Class> getClassesByLocation(Location location)
			throws AppException;

	public Class getClassById(Long id) throws AppException;

	@PostFilter("hasPermission(filterObject, 'MEMBER')")
	public List<Class> getClassesByMembership(String orderByInsertionDate,
			Integer numberDaysToLookBack) throws AppException;

	/*
	 * ******************** Update related methods **********************
	 */
	@PreAuthorize("hasPermission(#clas, 'MANAGER') or hasPermission(#loc, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void updateFullyClass(Class clas, Location loc) throws AppException;

	@PreAuthorize("hasPermission(#clas, 'MANAGER') or hasPermission(#loc, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void updatePartiallyClass(Class clas, Location loc)
			throws AppException;

	/*
	 * ******************** Delete related methods **********************
	 */
	@PreAuthorize("hasPermission(#clas, 'MANAGER') or hasPermission(#loc, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void deleteClass(Class clas, Location loc) throws AppException;

	/**
	 * removes all classes DO NOT USE, IMPROPERLY UPDATES ACL_OBJECT table
	 * Functional but does not destroy old acl's which doesnt hurt anything but
	 * they will take up space if this is commonly used
	 */
	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void deleteClasses();

	/*
	 * ******************** Membership related methods **********************
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	public void addMember(User user, Class clas) throws AppException;

	// Removes member
	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_MODERATOR') or hasPermission(#group, 'MANAGER')")
	public void deleteMember(User user, Class clas) throws AppException;

	/*
	 * ******************** Helper methods **********************
	 */
	public Class verifyClassExistenceById(Long id);
	
	public void sendAlertEmail(List<String> membersForClass, Class clas);

	public List<String> getMembersForClass(Class clas);

	public List<Class> getTodaysClasses();

}
