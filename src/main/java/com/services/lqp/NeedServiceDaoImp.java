package com.services.lqp;

import com.dao.lqp.NeedDao;
import com.entity.lqp.TbRecruitmentneed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class NeedServiceDaoImp implements  NeedServiceDao {
@Autowired
    private NeedDao dao;
    @Override
    public List<Map> findall() {
        return dao.findall();
    }

    @Override
    public List<Map<String, Object>> findbyname() {
        return dao.findbyname();
    }

    @Override
    public int insert(TbRecruitmentneed tbRecruitmentneed) {
        return dao.insert(tbRecruitmentneed);
    }

    @Override
    public int delete(TbRecruitmentneed tbRecruitmentneed) {
        return dao.delete(tbRecruitmentneed);
    }

    @Override
    public int update(TbRecruitmentneed tbRecruitmentneed) {
        return dao.update(tbRecruitmentneed);
    }

    @Override
    public int deleteByneed(Long needId) {
        return dao.deleteByneed(needId);
    }

    @Override
    public int insertneed(TbRecruitmentneed tbRecruitmentneed) {
        return dao.insert(tbRecruitmentneed);
    }

    @Override
    public TbRecruitmentneed selectByneed(Long needId) {
        return dao.selectByneed(needId);
    }

    @Override
    public List<TbRecruitmentneed> selectAll() {
        return dao.selectAll();
    }

    @Override
    public int updateByneed(TbRecruitmentneed tbRecruitmentneed) {
        return dao.updateByneed(tbRecruitmentneed);
    }

   /* @Override
    public PageResult query(EmployeeQueryObject qo) {
        int totalCount =  dao.queryneedForCount(qo);

        if(totalCount == 0){
            return PageResult.EMPTY_PAGE_RESULT;
        }

        List<TbRecruitmentneed> list = dao.queryneedForList(qo);
        return new PageResult(list, totalCount, qo.getCurrentPage(), qo.getPageSize());
    }*/
}
