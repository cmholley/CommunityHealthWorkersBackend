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

import dash.pojo.Class;

/**
 * Class entity
 * @author plindner
 * 
 */
@Entity
@Table(name="classes")
public class ClassEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2594194624009518406L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Long id;
	
	@Column(name="location_id")
	private Long location_id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="time")
	private Date time;
	
	@Column(name="duration")
	private int duration;
	
	@Column(name="room")
	private String room;
	
	@GeneratedValue
	@Column(name="creation_timestamp")
	private Date creation_timestamp;
	
	@Column(name="finished")
	private int finished;
	
	@Column(name="core_id")
	private Long core_id;
	
	public ClassEntity(){}
	
	public ClassEntity(Class clas){
		try {
			BeanUtils.copyProperties(this, clas);
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

	public Long getLocation_id(){
		return location_id;
	}
	
	public void setLoction_id(Long group_id){
		this.location_id = group_id;
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

	public void setCore_id(Long badge_id) {
		this.core_id = badge_id;
	}
	
}
