package com.service.yyl;

import com.dao.yyl.TdStaffDao;
import com.entity.yyl.TdStaff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class TdStaffServiceImp implements TdStaffService{
    @Autowired
    private TdStaffDao tdStaffDao;
    @Override
    public List<Map> TdStaffQuery(TdStaff ts) {
        return tdStaffDao.TdStaffQuery(ts);
    }

    @Override
    public void TdStaffAdd(TdStaff ts) {
        tdStaffDao.TdStaffAdd(ts);
    }

    @Override
    public void TdStaffUpdate(TdStaff ts) {
        tdStaffDao.TdStaffUpdate(ts);
    }

    @Override
    public void TdStaffDelete(TdStaff ts) {
        tdStaffDao.TdStaffDelete(ts);
    }
}
