package com.service.yyl;

import com.dao.yyl.TdConfigDao;
import com.entity.yyl.TdConfig;
import com.entity.yyl.TdSchedule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("tdScheduleServiceImp")
public class TdScheduleServiceImp implements TdScheduleService {

    @Autowired
    private TdScheduleDao tdScheduleDao;

    @Override
    public List<Map> TdScheduleQuery() {
        return tdScheduleDao.TdScheduleQuery();
    }

    @Override
    public void TdScheduleAdd(TdSchedule ts) {
        tdScheduleDao.TdScheduleAdd(ts);
    }

    @Override
    public void TdScheduleUpdate(TdSchedule ts) {
        tdScheduleDao.TdScheduleUpdate(ts);
    }

    @Override
    public void TdScheduleDelete(int ts_id) {
        tdScheduleDao.TdScheduleDelete(ts_id);
    }
}
