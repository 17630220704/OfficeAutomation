package com.services.lqp;

import com.entity.lqp.TbRecruitmentneed;

import java.util.List;
import java.util.Map;

public interface NeedServiceDao {
    public List<Map> findall();
    public List<Map<String,Object>> findbyname();
    public int insert(TbRecruitmentneed tbRecruitmentneed);//增加数据
    public int delete(TbRecruitmentneed tbRecruitmentneed);//删除数据
    public int update(TbRecruitmentneed tbRecruitmentneed);//更新数据
    int deleteByneed(Long needId);

    int insertneed(TbRecruitmentneed tbRecruitmentneed);

    TbRecruitmentneed selectByneed(Long needId);

    List<TbRecruitmentneed> selectAll();

    int updateByneed(TbRecruitmentneed tbRecruitmentneed);
/*    PageResult query(EmployeeQueryObject qo);*/
}
