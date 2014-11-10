package dash.dao;

import java.util.List;

import dash.pojo.Core;

/**
 *
 *
 * @see <a
 *      href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface CoreDao {
	
	public List<CoreEntity> getCoresByClassId(Long class_id);
	
	public void createCore(CoreEntity coreentity);
	
}