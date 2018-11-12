package com.services.lqp;

import com.entity.lqp.TbRecruitmentneed;

import java.util.List;
import java.util.Map;

public interface NeedServiceDao {
    List<Map> findall();
    List<Map<String,Object>> findbyname();
    int insert(TbRecruitmentneed tbRecruitmentneed);//增加数据
    int delete(TbRecruitmentneed tbRecruitmentneed);//删除数据
    int update(TbRecruitmentneed tbRecruitmentneed);//更新数据
    int deleteByneed(Long needId);

    int insertneed(TbRecruitmentneed tbRecruitmentneed);

    TbRecruitmentneed selectByneed(Long needId);

    List<TbRecruitmentneed> selectAll();

    int updateByneed(TbRecruitmentneed tbRecruitmentneed);
/*    PageResult query(EmployeeQueryObject qo);*/
}
