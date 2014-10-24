package dash.pojo;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.beanutils.BeanUtils;

import dash.dao.ClassEntity;
import dash.security.IAclObject;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Class implements  IAclObject{
	
	@XmlElement(name="id")
	private Long id;
	
	@XmlElement(name="location_id")
	private Long location_id;
	
	@XmlElement(name="name")
	private String name;
	
	@XmlElement(name="description")
	private String description;
	
	@XmlElement(name="time")
	private Date time;
	
	@XmlElement(name="duration")
	private int duration;
	
	@XmlElement(name="room")
	private String room;
	
	@XmlElement(name="creation_timestamp")
	private Date creation_timestamp;
	
	@XmlElement(name="finished")
	private int finished;
	
	@XmlElement(name="core_id")
	private Long core_id;
	
	public Class(ClassEntity classEntity) {
		try {
			BeanUtils.copyProperties(this, classEntity);
		} catch ( IllegalAccessException e) {

			e.printStackTrace();
		} catch ( InvocationTargetException e) {

			e.printStackTrace();
		}
	}
	
	public Class(){}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public Long getLocation_id() {
		return location_id;
	}

	public void setLocation_id(Long location_id) {
		this.location_id = location_id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public Date getCreation_timestamp() {
		return creation_timestamp;
	}

	public void setCreation_timestamp(Date creation_timestamp) {
		this.creation_timestamp = creation_timestamp;
	}

	public int getFinished() {
		return finished;
	}

	public void setFinished(int finished) {
		this.finished = finished;
	}

	public Long getCore_id() {
		return core_id;
	}

	public void setCore_id(Long core_id) {
		this.core_id = core_id;
	}
}
