package dash.dao;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.beanutils.BeanUtils;

import dash.pojo.Core;

/**
 * Touch entity
 * @author plindner
 *
 */
@Entity
@Table(name="classes_core")
public class CoreEntity implements Serializable {

	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="class_id")
	private int class_id;

	@Column(name = "core_id")
	private int core_id;
	
	public CoreEntity(){}

	
	public CoreEntity(Core core) {
		try {
			BeanUtils.copyProperties(this, core);
		} catch ( IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch ( InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getClass_id() {
		return class_id;
	}


	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}


	public int getCore_id() {
		return core_id;
	}


	public void setCore_id(int core_id) {
		this.core_id = core_id;
	}

	
}