package dash.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import dash.dao.CoreEntity;
import dash.errorhandling.AppException;
import dash.pojo.Core;
import dash.pojo.Class;
import dash.pojo.Location;

/**
 *
 * @author plindner
 * @see <a
 *      href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface CoreService {

	/*
	 * ******************** read related methods **********************
	 */
	public List<CoreEntity> getCoreByClassId(Long class_id);

	/*
	 * ******************** Create related methods **********************
	 * 
	 * Create a new class and set the current user as owner and manager.
	 */
	@PreAuthorize("hasPermission(#loc, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public void createCores(List<Core> cores, Location loc) throws AppException;

	@PreAuthorize("hasPermission(#loc, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public void deleteCores(Class clas, Location loc) throws AppException;
}