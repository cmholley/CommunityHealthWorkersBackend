package dash.pojo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.beanutils.BeanUtils;

import dash.dao.LocationEntity;
import dash.security.IAclObject;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * Location Pojo
 * @Author plindner
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Location implements  IAclObject {

	@XmlElement(name = "id")
	private Long id;
	
	@XmlElement(name = "name")
	private String name;
	
	@XmlElement(name = "description")
	private String description;
	
	@XmlElement(name = "creation_timestamp")
	private Date creation_timestamp;
	
	public Location(Long id, String name, String description,
			Date creation_timestamp) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.creation_timestamp = creation_timestamp;
	}
	
	public Location(LocationEntity locationEntity) {
		try {
			BeanUtils.copyProperties(this, locationEntity);
		} catch ( IllegalAccessException e) {

			e.printStackTrace();
		} catch ( InvocationTargetException e) {

			e.printStackTrace();
		}
	}
	
	public Location(){}
	
	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Date getCreation_timestamp() {
		return creation_timestamp;
	}

	public void setCreation_timestamp(Date creation_timestamp) {
		this.creation_timestamp = creation_timestamp;
	}
}
