package dash.dao;

/**
 *
 *
 * @see <a
 *      href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface CoreDao {
	
	public int getCoresByClassId(int class_id);
	
	public void createCore(CoreEntity coreentity);
	
}