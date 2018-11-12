package com.controller.lqp;


import com.entity.lqp.TbDeparment;
import com.entity.lqp.TbRecruitmentneed;
import com.services.lqp.ANeedImp;
import com.sun.org.glassfish.external.probe.provider.annotations.ProbeParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/aNeed")
public class ANeedController {
    @Autowired
    private ANeedImp aneedImp;
    @ResponseBody
    @RequestMapping(value="/selectAll")
    public Map<String,Object> select(TbRecruitmentneed tbRecruitmentneed, TbDeparment tbDeparment, @RequestParam(value="small",required=false) Date small, @RequestParam(value="big",required=false) Date big){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = aneedImp.findneedall(tbRecruitmentneed,tbDeparment,small, big);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selectName")
    public List<Map<String,Object>> select2(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =aneedImp.findneedbyname();
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/selectShenhe")
    public Map<String,Object> selectShenhe(TbRecruitmentneed tbRecruitmentneed, String shenpi){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map> list =aneedImp.findneedShenpi(tbRecruitmentneed, shenpi);
       map.put("list", list);
       return  map;
    }
    @ResponseBody
    @RequestMapping(value="/insertNeed")
    public String insertNeed(TbRecruitmentneed tbRecruitmentneed){
        Map<String, Object> map = new HashMap<String, Object>();
        int a = aneedImp.insertneed(tbRecruitmentneed);
        System.out.println("影响行数"+a);
        System.out.println(map);
        map.put("a", a);
        return "redirect:/selectAll";
    }

    @ResponseBody
    @RequestMapping(value="/deleteNeed")
    public String deleteNeed(TbRecruitmentneed tbRecruitmentneed){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = aneedImp.deleteneed(tbRecruitmentneed);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updateNeed")
    public String updateNeed(TbRecruitmentneed tbRecruitmentneed){
        Map<String,Object> map = new HashMap<String, Object>();
        aneedImp.updateneed(tbRecruitmentneed);
        System.out.println(tbRecruitmentneed);
        return "redirect:/selectAll";
    }
}
