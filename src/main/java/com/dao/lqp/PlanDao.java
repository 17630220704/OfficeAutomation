package com.dao.lqp;

import com.entity.lqp.PageBean;
import com.entity.lqp.QueryObject;
import com.entity.lqp.TbRecruitmentplan;

import java.util.List;
import java.util.Map;
public interface PlanDao {

        int addTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan);

        int deleteTbRecruitmentplanById(long planId);

        int updateTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan);

        TbRecruitmentplan TbRecruitmentplanById(long planId);

        List<TbRecruitmentplan> queryAllTbRecruitmentplan();

//分页查询
        List<TbRecruitmentplan> findAllPlan();


        int deleteByPlan(Long planId);

        int insertPlan(TbRecruitmentplan tbRecruitmentplan);

        TbRecruitmentplan selectByPlan(Long planId);

        List<TbRecruitmentplan> selectPlanAll();

        int updateByPlan(TbRecruitmentplan tbRecruitmentplan);

        //分页查询：查总数
        int queryPlanForCount(QueryObject qo);

        //分页查询：查数据
        List<TbRecruitmentplan> queryPlanForList(QueryObject qo);

}
