package dash.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import dash.dao.CoreDao;
import dash.dao.CoreEntity;
import dash.errorhandling.AppException;
import dash.pojo.Core;
import dash.pojo.Class;
import dash.pojo.Location;

public class CoreServiceDbAccessImpl implements CoreService {

	@Autowired
	CoreDao coreDao;

	@Override
	@Transactional
	public void createCores(List<Core> listCores, Location loc)
			throws AppException {
		for (Core core : listCores) {
			coreDao.createCore(new CoreEntity(core));
		}
	}

	@Override
	public List<CoreEntity> getCoreByClassId(Long class_id) {
		return coreDao.getCoresByClassId(class_id);
	}

	@Override
	public void deleteCores(Class clas, Location loc) throws AppException {
		coreDao.deleteCoresByClassId(clas.getId());
	}
}