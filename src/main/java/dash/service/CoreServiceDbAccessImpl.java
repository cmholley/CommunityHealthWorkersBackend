package dash.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import dash.dao.CoreDao;
import dash.dao.CoreEntity;
import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.helpers.NullAwareBeanUtilsBean;
import dash.pojo.Core;

public class CoreServiceDbAccessImpl implements CoreService {

	@Autowired
	CoreDao coreDao;

	@Override
	@Transactional
	public void createCores(List<Core> listCores) throws AppException {
		for (Core core : listCores) {
			coreDao.createCore(new CoreEntity(core));
		}
	}

	@Override
	public List<CoreEntity> getCoreByClassId(Long class_id) {
		return coreDao.getCoresByClassId(class_id);
	}

}