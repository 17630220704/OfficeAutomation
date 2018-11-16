package com.dao.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentemployed;
import com.entity.lqp.TbRecruitmentneed;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbHirefileDao {
/*人事档案*/
List<Map> findbyhire();
    int savebyhire(TbHirefile tbHirefile);
    List<TbHirefile> findbyName(@Param("empName") String empName);
   /* 招聘需求*/
   List<Map> findbyneed();
    int savebyneed(TbRecruitmentneed tbRecruitmentneed);
    /*招聘计划*/
    List<Map> findbyplan();
    int savebyplan(TbRecruitmentplan tbRecruitmentplan);
    /*招聘录用*/
    List<Map> findbyemploy();
    int savebyemploy(TbRecruitmentemployed tbRecruitmentemployed);
}
