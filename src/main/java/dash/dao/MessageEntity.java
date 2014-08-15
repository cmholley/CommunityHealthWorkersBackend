package dash.dao;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.commons.beanutils.BeanUtils;

import dash.pojo.Message;


/*
 * MessageEntity
 * @author CarlSteven
 * 
 */
@Entity
@Table(name="message")
public class MessageEntity implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7669829514182387313L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Long id;
	
	@Column(name="sender_uid")
	private Long sender_id;
	
	@Column(name="task_id")
	private Long task_id;
	
	@Column(name="content")
	private String content;
		
	@GeneratedValue
	@Column(name="time")
	private Date creation_timestamp;

	
	public MessageEntity(){}


	public MessageEntity(Long id, Long sender_id, Long task_id, String content, Date time) {
		super();
		this.id = id;
		this.sender_id = sender_id;
		this.task_id = task_id;
		this.content = content;
		this.creation_timestamp = time;
	}

	public MessageEntity(Message message){
		try {
			BeanUtils.copyProperties(this, message);
		} catch ( IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch ( InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getSender_id() {
		return sender_id;
	}


	public void setSender_id(Long sender_id) {
		this.sender_id = sender_id;
	}


	public Long getTask_id() {
		return task_id;
	}


	public void setTask_id(Long task_id) {
		this.task_id = task_id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getCreation_timestamp() {
		return creation_timestamp;
	}


	public void setCreation_timestamp(Date creation_timestamp) {
		this.creation_timestamp = creation_timestamp;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
}
