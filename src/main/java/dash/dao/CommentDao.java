package dash.dao;

import java.util.List;

import dash.pojo.Comment;
import dash.pojo.Post;


/*
 * @Author CarlSteven
 */
public interface CommentDao {
	
	public List<CommentEntity> getComments(int numberOfPosts, Long startIndex);
	
	public List<CommentEntity> getComments(int numberOfPosts, Long startIndex, Post post);

	public int getNumberOfComments();

	/**
	 * Returns a post given its id
	 *
	 * @param id
	 * @return
	 */
	public CommentEntity getCommentById(Long id);
	
	public void deleteCommentById(Comment comment);

	public Long createComment(CommentEntity comment);

	public void updateComment(CommentEntity comment);

	/** removes all posts */
	public void deleteComments();

}
