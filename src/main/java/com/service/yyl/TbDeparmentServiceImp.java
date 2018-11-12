package com.service.yyl;

import com.dao.yyl.TbDeparmentDao;
import com.entity.yyl.TbDeparment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TbDeparmentServiceImp implements TbDeparmentService {

    @Autowired
    private TbDeparmentDao tdDao;

    @Override
    public List<Map> TbDeparmentQuery(TbDeparment td) {
        return tdDao.TbDeparmentQuery(td);
    }

    @Override
    public List<Map> TbDeparmentpersonfoQuery(TbDeparment td) {
        return tdDao.TbDeparmentpersonfoQuery(td);
    }

    @Override
    public List<Map> TbDeparmentpersonfoQuery2(TbDeparment td) {
        return tdDao.TbDeparmentpersonfoQuery2(td);
    }

    @Override
    public List<Map> TbDeparmentpersonfo_StaffQuery(TbDeparment td) {
        return tdDao.TbDeparmentpersonfo_StaffQuery(td);
    }

    @Override
    public List<Map> TbDeparmentpersonfo_StaffQuery2(TbDeparment td) {
        return tdDao.TbDeparmentpersonfo_StaffQuery2(td);
    }

}
