package dash.service;

import java.util.List;





import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

import dash.errorhandling.AppException;
import dash.pojo.Group;
import dash.pojo.Post;
import dash.pojo.User;

public interface PostService {
	/*
	 * ******************** Create related methods **********************
	 *
	 *Create a new post and set the current user as owner and manager.
	 */
	@PreAuthorize("hasPermission(#group, 'member')")
	public Long createPost(Post post, Group group) throws AppException;

	/*
	 * Create multiple posts as ROOT, testing purposes only.
	 */
	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void createPosts(List<Post> posts) throws AppException;

	/*
	 * ******************* Read related methods ********************
	 */
	/**
	 *
	 * @param orderByInsertionDate
	 *            - if set, it represents the order by criteria (ASC or DESC)
	 *            for displaying posts
	 * @param numberDaysToLookBack
	 *            - if set, it represents number of days to look back for posts,
	 *            null
	 * @return list with posts corresponding to search criteria
	 * @throws AppException
	 */
	
	public List<Post> getPosts(int numberOfPosts, Long startIndex) throws AppException;
	
	public List<Post> getPostsByMyGroups(int numberOfPosts, Long startIndex) throws AppException;
	
	public List<Post> getPostsByGroup(int numberOfPosts, Long startIndex, Group group) throws AppException;
	/**
	 * Returns a post given its id
	 *
	 * @param id
	 * @return
	 * @throws AppException
	 */
	
	
	
	public Post getPostById(Long id) throws AppException;

	/*
	 * ******************** Update related methods **********************
	 */
	@PreAuthorize("hasPermission(#post, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void updateFullyPost(Post post) throws AppException;

	@PreAuthorize("hasPermission(#post, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void updatePartiallyPost(Post post) throws AppException;

	/*
	 * ******************** Delete related methods **********************
	 */


	@PreAuthorize("hasPermission(#post, 'MANAGER') or hasRole('ROLE_MODERATOR')")
	public void deletePost(Post post);
	/** removes all posts
	 * DO NOT USE, IMPROPERLY UPDATES ACL_OBJECT table
	 * Functional but does not destroy old acl's which doesnt hurt anything
	 * but they will take up space if this is commonly used */
	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void deletePosts();
	
	/**
	 * ACL related methods
	 */
	// Adds an additional manager to the post
	@PreAuthorize("hasPermission(#post, 'MANAGER') or hasRole('ROLE_ADMIN')")
	public void addManager(User user, Post post);
	
	//Removes all managers and sets new manager to user
	@PreAuthorize("hasRole('ROLE_MODERATOR')")
	public void resetManager(User user, Post post);
	
	//Removes a single manager from a post
	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_MODERATOR')")
	public void deleteManager(User user, Post post);
	
	//Adds a member to the post
	@PreAuthorize("hasRole('ROLE_USER')")
	public void addMember(User user, Post post);
	
	//Removes memeber
	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_MODERATOR') or hasPermission(#post, 'MANAGER')")
	public void deleteMember(User user, Post post);
	

	/*
	 * ******************** Helper methods **********************
	 */
	// TODO: This also should not exist, or it should be changed to
	// private/protected. Redundant
	// Could be made a boolean so it was not a security vulnerability
	public Post verifyPostExistenceById(Long id);

	public int getNumberOfPosts();

}
