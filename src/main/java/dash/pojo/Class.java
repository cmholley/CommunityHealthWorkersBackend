package dash.pojo;


import java.util.Date;
import java.util.Set;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import dash.helpers.SimpleDateAdapter;
import dash.security.IAclObject;


@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Class implements  IAclObject{
	
	public static enum Cores{
		Advocacy,
		Capacity_Building, 
		Communication_Skills, 
		Community_Service,
		Coordination,
		Interpersonal_Communication, 
		Knowledge_Base, 
		Organizational, 
		Service_Coordination,
		Skills,
		Teaching_Skills;
	}
	
	
	@XmlElement(name="id")
	private Long id;
	
	@XmlElement(name="location_id")
	private Long location_id;
	
	@XmlElement(name="name")
	private String name;
	
	@XmlElement(name="description")
	private String description;
	
	@XmlElement(name="time")
	@XmlJavaTypeAdapter(SimpleDateAdapter.class)
	private Date time;
	
	@XmlElement(name="duration")
	private int duration;
	
	@XmlElement(name="room")
	private String room;
	
	@XmlElement(name="address")
	private String address;
	
	@XmlElement(name="creation_timestamp")
	private Date creation_timestamp;
	
	@XmlElement(name="finished")
	private int finished;
	
	@XmlElement(name="cores")
	private Set<Cores> cores; //enum
	
	@XmlElement(name="forCHW")
	private int forCHW;
	
	@XmlElement(name="forCredit")
	private int forCredit;
	
	@XmlElement(name="active")
	private int active;
	
	
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
	
	
	public int getForCHW() {
		return forCHW;
	}

	public int getForCredit() {
		return forCredit;
	}

	public int getActive() {
		return active;
	}

	public void setForCHW(int forCHW) {
		this.forCHW = forCHW;
	}

	public void setForCredit(int forCredit) {
		this.forCredit = forCredit;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Set<Cores> getCores() {
		return cores;
	}

	public void setCores(Set<Cores> cores) {
		this.cores = cores;
	}
}
