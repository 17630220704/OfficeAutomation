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
    public List<Map> findbyhire();
    public int savebyhire(TbHirefile tbHirefile);
    List<TbHirefile> findbyName(@Param("empName") String empName);
   /* 招聘需求*/
   public List<Map> findbyneed();
    public int savebyneed(TbRecruitmentneed tbRecruitmentneed);
    /*招聘计划*/
    public List<Map> findbyplan();
    public int savebyplan(TbRecruitmentplan tbRecruitmentplan);
    /*招聘录用*/
    public List<Map> findbyemploy();
    public int savebyemploy(TbRecruitmentemployed tbRecruitmentemployed);
}
