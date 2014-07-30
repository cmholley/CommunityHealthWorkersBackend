package dash.dao;

import java.util.List;

import dash.pojo.Group;
import dash.pojo.Task;


/*
 * @Author tswensen
 */
public interface TaskDao {
	public List<TaskEntity> getTasks(String orderByInsertionDate);

	public List<TaskEntity> getRecentTasks(int numberOfDaysToLookBack);

	public int getNumberOfTasks();

	/**
	 * Returns a task given its id
	 *
	 * @param id
	 * @return
	 */
	public TaskEntity getTaskById(Long id);

	/**
	 * Find task by name
	 *
	 * @param task
	 * @return the task with the name specified or null if not existent
	 */
	public TaskEntity getTaskByName(String name);
	
	/**
	 * Returns all of the taskes owned by a given group
	 * 
	 * @param group
	 * @return the list of tasks
	 * 
	 */
	public List<TaskEntity> getTasksByGroup(Group group);

	public void deleteTaskById(Task task);

	public Long createTask(TaskEntity task);

	public void updateTask(TaskEntity task);

	/** removes all tasks */
	public void deleteTasks();

}
