package dash.dao;

import java.util.List;

import dash.pojo.Group;
import dash.pojo.Post;


/*
 * @Author tswensen
 */
public interface PostDao {
	
	public List<PostEntity> getPosts(int numberOfPosts, Long startIndex);
	
	public List<PostEntity> getPosts(int numberOfPosts, Long startIndex, Group group);

	public int getNumberOfPosts();

	/**
	 * Returns a post given its id
	 *
	 * @param id
	 * @return
	 */
	public PostEntity getPostById(Long id);
	
	public void deletePostById(Post post);

	public Long createPost(PostEntity post);

	public void updatePost(PostEntity post);

	/** removes all posts */
	public void deletePosts();

}
