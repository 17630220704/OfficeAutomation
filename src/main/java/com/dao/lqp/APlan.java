package com.dao.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface APlan {
    List<Map> findplanall();
    List<Map> findplanSX();
    List<Map> findplanSX1();
    List<Map> findplanthem(TbRecruitmentplan tbRecruitmentplan);
    int updatethem(TbRecruitmentplan tbRecruitmentplan);
    List<Map<String,Object>> findplanbyname();
    List<Map<String,Object>> findplanbynameEnd();
    List<Map<String,Object>> findplanbypeople();
    int insertplan(TbRecruitmentplan tbRecruitmentplan);//增加数据
    int insertplanAdd(TbRecruitmentplan tbRecruitmentplan);//增加数据
    int deleteplan(TbRecruitmentplan tbRecruitmentplan);//删除数据
    int updateplan(TbRecruitmentplan tbRecruitmentplan);//更新数据
    int updateplanAdd(TbRecruitmentplan tbRecruitmentplan);//更新数据

    int updatehire(TbRecruitmentplan tbRecruitmentplan);//更新数据

    List<Map> findpeople(@Param("people") String people);//查询部门人员
    List<Map> findhirepeople(TbHirefile tbHirefile);
    List<Map> findhirepeople1(TbHirefile tbHirefile, @Param("people") String people);
    int updatepeople(TbRecruitmentplan tbRecruitmentplan);//招聘小组更新数据
    int updatepeople1(TbRecruitmentplan tbRecruitmentplan);//人才更新数据



}
