package dash.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import dash.errorhandling.AppException;
import dash.pojo.Core;

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
	public List<Core> getCore(Long class_id);
	
	/*
	 * ******************** Create related methods **********************
	 *
	 *Create a new class and set the current user as owner and manager.
	 */
	@PreAuthorize("hasPermission(#location, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public void createCores(List<Core> cores) throws AppException;

}