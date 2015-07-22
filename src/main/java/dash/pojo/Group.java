package dash.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import dash.security.IAclObject;

@Entity
@Table(name="group_data")
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Group implements  IAclObject{

	


	private static final long serialVersionUID = -1126021260367221880L;

	@Id
	@GeneratedValue
	@XmlElement(name = "id")
    @Column(name = "id")
	private Long id;
	

	@XmlElement(name = "name")
    @Column(name = "name")
	private String name;
	
	@XmlElement(name = "description")
    @Column(name = "description")
	private String description;
	
	@XmlElement(name = "creation_timestamp")
    @Column(name = "creation_timestamp")
	private Date creation_timestamp;
	
	@Override
	public Long getId() {
		return id;
	}

	
	
	public Group(Long id, String name, String description,
			Date creation_timestamp) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.creation_timestamp = creation_timestamp;
	}

	

	
	public Group(){}

	@Override
	public String toString() {
		return "Group ["
				+ (id != null ? "id=" + id + ", " : "")
				+ (name != null ? "name=" + name + ", " : "")
				+ (description != null ? "description=" + description + ", "
						: "")
				+ (creation_timestamp != null ? "creation_timestamp="
						+ creation_timestamp : "") + "]";
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
