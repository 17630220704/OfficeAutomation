package com.services.lqp;



import com.dao.lqp.PlanDao;
import com.entity.lqp.PageBean;
import com.entity.lqp.PageResult;
import com.entity.lqp.QueryObject;
import com.entity.lqp.TbRecruitmentplan;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("planServiceImp")
public class PlanServiceImp implements  PlanService {
@Autowired
    private PlanDao dao;
    @Override
    public int addTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan) {
        return dao.addTbRecruitmentplan(tbRecruitmentplan);
    }

    @Override
    public int deleteTbRecruitmentplanById(long planId) {
        return dao.deleteTbRecruitmentplanById(planId);
    }

    @Override
    public int updateTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan) {
        return dao.updateTbRecruitmentplan(tbRecruitmentplan);
    }

    @Override
    public TbRecruitmentplan TbRecruitmentplanById(long planId) {
        return dao.TbRecruitmentplanById(planId);
    }

    @Override
    public List<TbRecruitmentplan> queryAllTbRecruitmentplan() {
        return dao.queryAllTbRecruitmentplan();
    }
/*分页查询*/
  @Override
    public List<TbRecruitmentplan> findAllPlan() {
        return dao.findAllPlan();
    }

   /* @Override
    public PageBean getplanList(int pageCode, int sizePage) {
        System.out.println("service"+pageCode);

        PageHelper.startPage(pageCode,sizePage);
        List<TbRecruitmentplan> list1 = dao.findAllPlan();//调用dao进行查询
        //创建返回结果集
        PageBean bean=new PageBean();
        bean.setLists(list1);//将结果封装
        System.out.println("GO");
        System.out.println(list1);


        //获取总记录数
        PageInfo<TbRecruitmentplan> pageInfo=new PageInfo<TbRecruitmentplan>(list1);
        bean.setTotalCount((int)pageInfo.getTotal());//返回总条数
        bean.setPageSize(sizePage);
        *//*bean.setSizePage(sizePage);*//*//设置每页条数
        *//*bean.setPageCode(pageCode);*//*//设置第几页
        bean.setCurrPage(pageCode);
        return bean;

    }*/

    @Override
    public int deleteByPlan(Long planId) {
        return dao.deleteByPlan(planId);
    }

    @Override
    public int insertPlan(TbRecruitmentplan tbRecruitmentplan) {
        return dao.insertPlan(tbRecruitmentplan);
    }

    @Override
    public TbRecruitmentplan selectByPlan(Long planId) {
        return dao.selectByPlan(planId);
    }

    @Override
    public List<TbRecruitmentplan> selectPlanAll() {
        return dao.selectPlanAll();
    }

    @Override
    public int updateByPlan(TbRecruitmentplan tbRecruitmentplan) {
        return dao.updateByPlan(tbRecruitmentplan);
    }

 /*   @Override
    public PageResult query(QueryObject qo) {
        int totalCount =  dao.queryPlanForCount(qo);

        if(totalCount == 0){
            return PageResult.EMPTY_PAGE_RESULT;
        }

        List<TbRecruitmentplan> list = dao.queryPlanForList(qo);
        *//*return new PageResult(list, totalCount, qo.getCurrentPage(), qo.getPageSize());*//*
        return  new PageResult(list,totalCount,qo.getCurrentPage(), qo.getPageSize());
    }*/
}
