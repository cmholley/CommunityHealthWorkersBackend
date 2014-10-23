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

import dash.pojo.Location;


/**
 * Location entity
 * @author plindner
 * 
 */
@Entity
@Table(name="location")
public class LocationEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8428075114498454902L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@GeneratedValue
	@Column(name="creation_timestamp")
	private Date creation_timestamp;
	
	public LocationEntity(){}

	public LocationEntity(Long id, String name, String description,
			Date creation_timestamp) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.creation_timestamp = creation_timestamp;
	}
	
	public LocationEntity(Location location){
		try {
			BeanUtils.copyProperties(this, location);
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
