package com.services.lqp;

import com.dao.lqp.TbHirefileDao;
import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentneed;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resources;
import java.util.List;
import java.util.Map;

@Service("tbHirefileServiceDaoImp")
public class TbHirefileServiceDaoImp implements TbHirefileServiceDao {
    @Autowired
    private TbHirefileDao dao;

    public List<Map> findbyhire() {
        // TODO Auto-generated method stub
        return dao.findbyhire();
    }

    @Override
    public int savebyhire(TbHirefile tbHirefile) {
        return dao.savebyhire(tbHirefile);
    }

    @Override
    public List<TbHirefile> findbyName(String empName) {
        return dao.findbyName(empName);
    }

    @Override
    public List<Map> findbyneed() {
        return dao.findbyneed();
    }

    @Override
    public int savebyneed(TbRecruitmentneed tbRecruitmentneed) {
        return dao.savebyneed(tbRecruitmentneed);
    }

    @Override
    public List<Map> findbyplan() {
        return dao.findbyplan();
    }

    @Override
    public List<Map> findbyemploy() {
        return dao.findbyemploy();
    }

    public PageInfo<TbHirefile> findUserByPage(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Map> list = dao.findbyhire();
        return new PageInfo(list);
    }
}
