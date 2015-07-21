package dash.pojo;

/*
 * Message POJO
 * @author CarlSteven
 */

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.persistence.Column;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.beanutils.BeanUtils;

import dash.dao.MessageEntity;
import dash.security.IAclObject;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Message implements IAclObject{

	
	@XmlElement(name="id")
	@Column(name="id")
	private Long id;
	
    @XmlElement(name="sender_id")
	@Column(name="sender_id")
	private Long sender_id;
	
	@XmlElement(name="task_id")
    @Column(name="task_id")
	private Long task_id;
	
	@XmlElement(name="time")
    @Column(name="time")
	private Date creation_timestamp;
	
	@XmlElement(name="content")
    @Column(name="content")
	private String content;

	public Message(Long id, Long sender_id, Long task_id, String content, Date time) {
		super();
		this.id = id;
		this.sender_id = sender_id;
		this.task_id = task_id;
		this.content = content;
		this.creation_timestamp = time;
	}

	public Message(MessageEntity messageEntity) {
		try {
			BeanUtils.copyProperties(this, messageEntity);
		} catch ( IllegalAccessException e) {

			e.printStackTrace();
		} catch ( InvocationTargetException e) {

			e.printStackTrace();
		}
	}
	
	public Message(){}

	@Override
	public Long getId() {
		return id;
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

	public Date getcreation_timestamp() {
		return creation_timestamp;
	}

	public void setcreation_timestamp(Date time) {
		this.creation_timestamp = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(Long id) {
		this.id = id;
	}

}