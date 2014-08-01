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

import dash.pojo.Group;
import dash.pojo.Post;

public class PostDaoJPA2Impl implements PostDao {
	@PersistenceContext(unitName = "dashPersistence")
	private EntityManager entityManager;


	@Override
	public List<PostEntity> getPosts(int numberOfPosts, Long startIndex) {
		String sqlString = null;
		
		sqlString = "SELECT u FROM PostEntity u"
				+ " ORDER BY u.creation_timestamp DESC LIMIT ?1,?2";
	
		TypedQuery<PostEntity> query = entityManager.createQuery(sqlString,
				PostEntity.class);
		query.setParameter(1, startIndex);
		query.setParameter(2, numberOfPosts);

		return query.getResultList();
	}

	@Override
	public List<PostEntity> getPosts(int numberOfPosts, Long startIndex, Group group) {
		
		String qlString = "SELECT u FROM PostEntity u where u.group_id = ?1"
				+ "ORDER BY u.creation_timestamp DESC LIMIT ?2,?3";
		TypedQuery<PostEntity> query = entityManager.createQuery(qlString,
				PostEntity.class);
		query.setParameter(1, group.getId() );
		query.setParameter(2, startIndex);
		query.setParameter(3, numberOfPosts);

		return query.getResultList();
	}

	@Override
	public PostEntity getPostById(Long id) {

		try {
			String qlString = "SELECT u FROM PostEntity u WHERE u.id = ?1";
			TypedQuery<PostEntity> query = entityManager.createQuery(qlString,
					PostEntity.class);
			query.setParameter(1, id);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}


	@Override
	public void deletePostById(Post groupPojo) {

		PostEntity group = entityManager
				.find(PostEntity.class, groupPojo.getId());
		entityManager.remove(group);

	}
	

	@Override
	public Long createPost(PostEntity group) {

		group.setCreation_timestamp(new Date());
		entityManager.persist(group);
		entityManager.flush();// force insert to receive the id of the group

		// Give admin over new group to the new group

		return group.getId();
	}

	@Override
	public void updatePost(PostEntity group) {
		//TODO think about partial update and full update
		entityManager.merge(group);
	}

	@Override
	public void deletePosts() {
		Query query = entityManager.createNativeQuery("TRUNCATE TABLE group");
		query.executeUpdate();
	}

	@Override
	public int getNumberOfPosts() {
		try {
			String qlString = "SELECT COUNT(*) FROM group";
			TypedQuery<PostEntity> query = entityManager.createQuery(qlString,
					PostEntity.class);

			return query.getFirstResult();
		} catch (NoResultException e) {
			return 0;
		}
	}
}
