package com.controller.lqp;

import com.entity.lqp.TbRecruitmentplan;
import com.github.pagehelper.PageHelper;
import com.services.lqp.PlanServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/TbRecruitmentplan")
public class PlanController {
    @Autowired
    private PlanServiceImp planServiceImp;

    @RequestMapping("/allTbRecruitmentplan")
    public String list(Model model) {
        List<TbRecruitmentplan> list = planServiceImp.queryAllTbRecruitmentplan();
        model.addAttribute("list", list);
        return "allTbRecruitmentplan";
    }

    @RequestMapping("toAddTbRecruitmentplan")
    public String toAddTbRecruitmentplan() {
        return "addTbRecruitmentplan";
    }

    @RequestMapping("/addTbRecruitmentplan")
    public String addTbRecruitmentplan(TbRecruitmentplan tbRecruitmentplan) {
        planServiceImp.addTbRecruitmentplan(tbRecruitmentplan);
        return "redirect:/TbRecruitmentplan/allTbRecruitmentplan";
    }

    @RequestMapping("/del/{planId}")
    public String deleteTbRecruitmentplan(@PathVariable("planId") Long planId) {
        planServiceImp.deleteTbRecruitmentplanById(planId);
        return "redirect:/TbRecruitmentplan/allTbRecruitmentplan";
    }

    @RequestMapping("toUpdatePaperRecruitmentplan")
    public String toUpdateRecruitmentplan(Model model, Long planId) {
        model.addAttribute("paper", planServiceImp.TbRecruitmentplanById(planId));
        return "updateTbRecruitmentplan";
    }

    @RequestMapping("/updateRecruitmentplan")
    public String updatePaper(Model model, TbRecruitmentplan TbRecruitmentplan) {
        planServiceImp.updateTbRecruitmentplan(TbRecruitmentplan);
        TbRecruitmentplan = planServiceImp.TbRecruitmentplanById(TbRecruitmentplan.getPlanId());
        model.addAttribute("TbRecruitmentplan", TbRecruitmentplan);
        return "redirect:/TbRecruitmentplan/allTbRecruitmentplan";
    }
    /*分页查询*/
   @RequestMapping("/getAllUser")
    @ResponseBody
    public Map getAllPlan(@RequestParam(required = false, defaultValue = "1") Integer startPage,
                                 @RequestParam(required = false, defaultValue = "2") Integer PageSize) {
        PageHelper.startPage(2, 2);
       Map map=new HashMap();

        List<TbRecruitmentplan> plans = new ArrayList<>();

        plans = planServiceImp.findAllPlan();
       map.put("plans",plans);
       map.put("startPage",startPage);
       map.put("PageSize",PageSize);

        return map;
    }
  /*  @RequestMapping(value = "/planlist")
    public String list(@RequestParam(required = false, defaultValue = "1") int pageCode,
                       @RequestParam(required = false, defaultValue = "2") int sizePage,
                       ModelMap model){
        //创建一个传递参数的对象
        TbRecruitmentplan planbrand = new TbRecruitmentplan();//这个是一个查询返回的对象
        //设置显示或不显示的查询条件   1:显示 0: 不显示
      *//*  brand.setName("name");//通过name查询*//*
        planbrand.setPlanName("planName");
        System.out.println("controller"+planbrand.getPlanName());
        System.out.println(planbrand);
        //service层方法处理,分页进行查询
        PageBean page = planServiceImp.getplanList(pageCode, sizePage);
        model.addAttribute("page",page);
        //将结果返回页面 ,并取名 brands
        //model.addAttribute("brands", brands);
        return "list";
    }*/



   /* @RequestMapping("list")
    public String list(Model model, @ModelAttribute("qo") QueryObject qo) throws  Exception{

        model.addAttribute("result", planServiceImp.query(qo));
        model.addAttribute("currentMenu", "department");
        return "TbRecruitmentplan/list";
    }*/

    @RequestMapping("input")
    public String input(Long planId, Model model) {

        if(planId != null){
            model.addAttribute("entity", planServiceImp.getClass());
        }
        model.addAttribute("currentMenu", "department");
        return "TbRecruitmentplan/input";
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(TbRecruitmentplan tbRecruitmentplan) {
        Long planId=tbRecruitmentplan.getPlanId();
        if(planId!= null){
            planServiceImp.updateByPlan(tbRecruitmentplan);
        }else{
            planServiceImp.insertPlan(tbRecruitmentplan);
        }
        return "redirect:/TbRecruitmentplan/list.do";
    }

    @RequestMapping("delete")
    public String input(Long planId) {
        if(planId != null){
            planServiceImp.deleteByPlan(planId);
        }
        return "redirect:/TbRecruitmentplan/list.do";
    }
}
