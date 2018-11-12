package com.services.lqp;

import com.entity.lqp.TbRecruitmentplan;

import java.util.List;

public interface PlanService {
    int addTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan);

    int deleteTbRecruitmentplanById(long planId);

    int updateTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan);

    TbRecruitmentplan TbRecruitmentplanById(long planId);

    List<TbRecruitmentplan> queryAllTbRecruitmentplan();
    //分页查询
   public List<TbRecruitmentplan> findAllPlan();
  /*  public PageBean getplanList(int pageCode, int sizePage);*/

    /*new*/

    int deleteByPlan(Long planId);

    int insertPlan(TbRecruitmentplan tbRecruitmentplan);

    TbRecruitmentplan selectByPlan(Long planId);

    List<TbRecruitmentplan> selectPlanAll();

    int updateByPlan(TbRecruitmentplan tbRecruitmentplan);

  /*  PageResult query(QueryObject qo);*/

}
