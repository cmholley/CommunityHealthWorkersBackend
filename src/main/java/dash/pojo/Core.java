package dash.pojo;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.beanutils.BeanUtils;

import dash.dao.CoreEntity;

/**
 * User resource placeholder for json/xml representation
 *
 * @author plindner
 *
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Core implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2634351209381642240L;

	@XmlElement(name = "id")
	private int id;
	
	@XmlElement(name = "class_id")
	private Long class_id;

	@XmlElement(name = "core_id")
	private Long core_id;

	/*public Core(CoreEntity core) {
		try {
			BeanUtils.copyProperties(this, core);
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (InvocationTargetException e) {

			e.printStackTrace();
		}
	}*/

	public Core() {
	}
	
	public Core(Long core_id, Long class_id) {
		super();
		this.core_id = core_id;
		this.class_id = class_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Long getClass_id() {
		return class_id;
	}

	public void setClass_id(Long class_id) {
		this.class_id = class_id;
	}

	public Long getCore_id() {
		return core_id;
	}

	public void setCore_id(Long core_id) {
		this.core_id = core_id;
	}

	
}