package com.service.yyl;

import com.dao.yyl.TdConfigDao;
import com.entity.yyl.TdConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("tdConfigServiceImp")
public class TdConfigServiceImp implements TdConfigService {

    @Autowired
    private TdConfigDao tdConfigDao;
    @Override
    public List<Map> tdConfigQuery() {
        return tdConfigDao.tdConfigQuery();
    }

    @Override
    public void tdConfigAdd(TdConfig tc) {
        tdConfigDao.tdConfigAdd(tc);
    }

    @Override
    public void tdConfigUpdate(TdConfig tc) {

    }

    @Override
    public void tdConfigDelete(int tc_id) {
        tdConfigDao.tdConfigDelete(tc_id);
    }
}
