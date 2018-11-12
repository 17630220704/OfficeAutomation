package com.services.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentneed;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;


import java.util.List;
import java.util.Map;

public interface TbHirefileServiceDao {
    /*人事档案*/
    List<Map> findbyhire();
    int savebyhire(TbHirefile tbHirefile);
    List<TbHirefile> findbyName(@Param("empName") String empName);
    /* 招聘需求*/
    List<Map> findbyneed();
    int savebyneed(TbRecruitmentneed tbRecruitmentneed);
    /*招聘计划*/
    List<Map> findbyplan();
    /*招聘录用*/
    List<Map> findbyemploy();

/*    PageInfo<TbHirefile> findUserByPage(int page, int pageSize);*/
}
