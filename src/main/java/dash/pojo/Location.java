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
	
	/** path to stored images for this object */
	@XmlElement(name = "image_folder")
	private String image_folder;
	
	@XmlElement(name = "name")
	private String name;
	
	@XmlElement(name = "description")
	private String description;
	
	@XmlElement(name = "creation_timestamp")
	private Date creation_timestamp;
	
	@XmlElement(name="address")
	private String address;
	
	@XmlElement(name="city")
	private String city;
	
	@XmlElement(name="zip")
	private Long zip;
	
	@XmlElement(name="state")
	private String state;
	
	@XmlElement(name="county")
	private String county;
	
	@XmlElement(name="contact_name")
	private String contact_name;
	
	@XmlElement(name="phone_number")
	private String phone_number;
	
	@XmlElement(name="email")
	private String email;
	
	@XmlElement(name="website")
	private String website;
	
	public Location(){};
	
	public Location(LocationEntity locationEntity) {
		try {
			BeanUtils.copyProperties(this, locationEntity);
		} catch ( IllegalAccessException e) {

			e.printStackTrace();
		} catch ( InvocationTargetException e) {

			e.printStackTrace();
		}
	}
	
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

	public String getImage_folder() {
		return image_folder;
	}

	public void setImage_folder(String image_folder) {
		this.image_folder = image_folder;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Long getZip() {
		return zip;
	}

	public void setZip(Long zip) {
		this.zip = zip;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
}
