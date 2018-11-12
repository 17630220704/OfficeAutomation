package com.controller.lqp;


import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;
import com.services.lqp.APlanImp;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/Plan")
public class APlanController {
    @Autowired
    private APlanImp aplanImp;
    @ResponseBody
    @RequestMapping(value="/selectAll")
    public Map<String,Object> select(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = aplanImp.findplanall();
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selecthirepeople")
    public Map<String,Object> selecthirepeople(TbHirefile tbHirefile){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = aplanImp.findhirepeople(tbHirefile);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selecthirepeople1")
    public Map<String,Object> selecthirepeople1(TbHirefile tbHirefile, String people){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = aplanImp.findhirepeople1(tbHirefile, people);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selectpeople")
    public Map<String,Object> selectpeople(String people){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = aplanImp.findpeople(people);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selectPlan")
    public List<Map<String,Object>> select2(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =aplanImp.findplanbyname();
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/selectThem")
    public Map<String,Object> selectThem(TbRecruitmentplan tbRecruitmentplan){
        System.out.println(tbRecruitmentplan);
        Map<String,Object> map = new HashMap<String,Object>();
     List<Map> list =aplanImp.findplanthem(tbRecruitmentplan);
        System.out.println(list);
     map.put("list",list);
     return map;
    }
    @ResponseBody
    @RequestMapping(value="/insertPlan")
    public String insertPlan(TbRecruitmentplan tbRecruitmentplan){
        Map<String, Object> map = new HashMap<String, Object>();
        int a = aplanImp.insertplan(tbRecruitmentplan);
        System.out.println("影响行数"+a);
        System.out.println(map);
        map.put("a", a);
        return "redirect:/selectAll";
    }

    @ResponseBody
    @RequestMapping(value="/deletePlan")
    public String deletePlan(TbRecruitmentplan tbRecruitmentplan){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = aplanImp.deleteplan(tbRecruitmentplan);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updatePlan")
    public String updatePlan(TbRecruitmentplan tbRecruitmentplan){
        Map<String,Object> map = new HashMap<String, Object>();
        aplanImp.updateplan(tbRecruitmentplan);
        System.out.println(tbRecruitmentplan);
        return "redirect:/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updatethem")
    public String updatethem(TbRecruitmentplan tbRecruitmentplan){
        Map<String,Object> map = new HashMap<String, Object>();
        aplanImp.updatethem(tbRecruitmentplan);
        System.out.println(tbRecruitmentplan);
        return "redirect:/Plan/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updatepeople")
    public String updatepeople(TbRecruitmentplan tbRecruitmentplan){
        Map<String,Object> map = new HashMap<String, Object>();
        aplanImp.updatepeople(tbRecruitmentplan);
        System.out.println(tbRecruitmentplan);
        return "redirect:/Plan/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updatepeople1")
    public String updatepeople1(TbRecruitmentplan tbRecruitmentplan){
        Map<String,Object> map = new HashMap<String, Object>();
        aplanImp.updatepeople1(tbRecruitmentplan);
        System.out.println(tbRecruitmentplan);
        return "redirect:/Plan/selectAll";
    }
}
