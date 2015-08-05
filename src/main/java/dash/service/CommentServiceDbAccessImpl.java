package dash.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dash.dao.CommentDao;
import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.helpers.NullAwareBeanUtilsBean;
import dash.pojo.Comment;
import dash.pojo.Group;
import dash.pojo.Post;
import dash.security.CustomPermission;
import dash.security.GenericAclController;

@Component
public class CommentServiceDbAccessImpl extends ApplicationObjectSupport implements
CommentService {

	@Autowired
	CommentDao commentDao;

	@Autowired
	private MutableAclService mutableAclService;
	
	@Autowired
	private GroupService groupService;

	@Autowired
	private GenericAclController<Comment> aclController;

	/********************* Create related methods implementation ***********************/
	@Override
	@Transactional
	public Long createComment(Comment comment, Group group) throws AppException {
		long commentId = commentDao.createComment(comment);
		comment.setId(commentId);
		aclController.createACL(comment);
		aclController.createAce(comment, CustomPermission.READ);
		aclController.createAce(comment, CustomPermission.WRITE);
		aclController.createAce(comment, CustomPermission.DELETE);
		return commentId;
	}

	

	//Inactive
	@Override
	@Transactional
	public void createComments(List<Comment> comments) throws AppException {
		
	}


	// ******************** Read related methods implementation **********************
	@Override
	public List<Comment> getCommentsByPost(int numberOfComments, Long startIndex, Post post) throws AppException {
		//verify optional parameter numberDaysToLookBack first
		List<Comment> postComments = commentDao.getComments(numberOfComments, startIndex, post);
		return getCommentsFromEntities(postComments);
	}

	@Override
	public Comment getCommentById(Long id) throws AppException {
		Comment commentById = commentDao.getCommentById(id);
		if (commentById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The post you requested with id " + id
					+ " was not found in the database",
					"Verify the existence of the post with the id " + id
					+ " in the database", AppConstants.DASH_POST_URL);
		}

		return commentDao.getCommentById(id);
	}

	private List<Comment> getCommentsFromEntities(List<Comment> commentEntities) {
		List<Comment> response = new ArrayList<Comment>();
		for (Comment comment : commentEntities) {
			response.add(comment);
		}

		return response;
	}
	

	
	

//	public List<Post> getRecentPosts(int numberOfDaysToLookBack) {
//		List<Post> recentPosts = commentDao
//				.getRecentPosts(numberOfDaysToLookBack);
//
//		return getPostsFromEntities(recentPosts);
//	}

	@Override
	public int getNumberOfPosts() {
		int totalNumber = commentDao.getNumberOfComments();

		return totalNumber;

	}



	/********************* UPDATE-related methods implementation ***********************/
	@Override
	@Transactional
	public void updateFullyComment(Comment comment) throws AppException {
		//do a validation to verify FULL update with PUT
		if (isFullUpdate(comment)) {
			throw new AppException(Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Please specify all properties for Full UPDATE",
					"required properties - name, description",
					AppConstants.DASH_POST_URL);
		}
		
		try {
			//do a validation whether comment exists
			getCommentById(comment.getId());
			commentDao.updateComment(comment);
		} catch (AppException ex) {
	
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ comment.getId(),
							AppConstants.DASH_POST_URL);
		}		
	}

	/**
	 * Verifies the "completeness" of post resource sent over the wire
	 *
	 * @param Post
	 * @return
	 */
	private boolean isFullUpdate(Comment comment) {
		return comment.getId() == null
				|| comment.getContent() == null
				|| comment.getImage() == null;
	}

	/********************* DELETE-related methods implementation ***********************/

	@Override
	@Transactional
	public void deleteComment(Comment comment) {
		commentDao.deleteCommentById(comment);
		aclController.deleteACL(comment);

	}

	@Override
	@Transactional
	public void updatePartiallyComment(Comment comment) throws AppException {
		
		try {
			Comment verifyCommentExistenceById = getCommentById(comment.getId());
			copyPartialProperties(verifyCommentExistenceById, comment);
			commentDao.updateComment(verifyCommentExistenceById);
		} catch (AppException ex) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ comment.getId(), AppConstants.DASH_POST_URL);
		}
	}

	private void copyPartialProperties(Comment verifyCommentExistenceById, Comment comment) {

		BeanUtilsBean notNull=new NullAwareBeanUtilsBean();
		try {
			notNull.copyProperties(verifyCommentExistenceById, comment);
		} catch (IllegalAccessException e) {
			logger.debug("debugging info for exception: ", e); 
		} catch (InvocationTargetException e) {
			logger.debug("debugging info for exception: ", e); 
		}
	}


}
