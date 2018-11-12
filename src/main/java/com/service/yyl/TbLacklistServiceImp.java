package com.service.yyl;

import com.dao.yyl.TbLacklistDao;
import com.entity.yyl.TbLacklist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TbLacklistServiceImp implements TbLacklistService {

    @Autowired
    private TbLacklistDao tdDao;


    @Override
    public List<Map> TbLacklistQuery() {
        return tdDao.TbLacklistQuery();
    }

    @Override
    public void TbLacklistUpdate(TbLacklist tl) {
        tdDao.TbLacklistUpdate(tl);
    }

    @Override
    public void TbLacklistAdd(TbLacklist tl) {
        tdDao.TbLacklistAdd(tl);
    }

    @Override
    public void TbLacklistDelete(Integer lId) {
        tdDao.TbLacklistDelete(lId);
    }
}
