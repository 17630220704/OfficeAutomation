package com.services.lqp;

import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface APlanService {
    public List<Map> findplanall();
    public List<Map> findplanthem(TbRecruitmentplan tbRecruitmentplan);
    public int updatethem(TbRecruitmentplan tbRecruitmentplan);
    public List<Map<String,Object>> findplanbyname();
    public int insertplan(TbRecruitmentplan tbRecruitmentplan);//增加数据
    public int deleteplan(TbRecruitmentplan tbRecruitmentplan);//删除数据
    public int updateplan(TbRecruitmentplan tbRecruitmentplan);//更新数据
    public List<Map> findpeople(@Param("people") String people);//查询部门人员
    public List<Map> findhirepeople(TbHirefile tbHirefile);
    public List<Map> findhirepeople1(TbHirefile tbHirefile,@Param("people") String people);
    public int updatepeople(TbRecruitmentplan tbRecruitmentplan);//招聘小组更新数据
    public int updatepeople1(TbRecruitmentplan tbRecruitmentplan);//人才更新数据
}
