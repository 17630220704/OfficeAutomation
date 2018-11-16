package com.controller.lqp;

import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentemployed;
import com.entity.lqp.TbRecruitmentneed;
import com.entity.lqp.TbRecruitmentplan;
import com.services.lqp.AEmployServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/employ")
public class AEmployController {
    @Autowired
    private AEmployServiceImp employ;

    @ResponseBody
    @RequestMapping(value="/selectAllemploy")
    public Map<String,Object> select(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = employ.findemployall(tbRecruitmentemployed);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selectAllemployshaixuan")
    public Map<String,Object> selectshaixuan99(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = employ.findemployallshaixuan(tbRecruitmentemployed);
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/employname")
    public List<Map<String,Object>> selectemploy(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =employ.findemploybyname();
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/employnamep")
    public List<Map<String,Object>> selectemployp(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =employ.findemploybynamep();

        return list;
    }
    @ResponseBody
    @RequestMapping(value="/findbyShaixuan")
    public List<Map<String,Object>> findbyShaixuan(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =employ.findShaixuan(tbRecruitmentemployed);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/findbyShaixuan2")
    public List<Map<String,Object>> findbyShaixuan2(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =employ.findShaixuan2(tbRecruitmentemployed);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/insertemploy")
    public String insertemploy(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String, Object> map = new HashMap<String, Object>();
        int a =employ.insertemploy(tbRecruitmentemployed);
        System.out.println("影响行数"+a);
        System.out.println(map);
        map.put("a", a);
        return "redirect:/employ/selectAllemploy";
    }
    @ResponseBody
    @RequestMapping(value="/insertemployAdd")
    public String insertemployAdd(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String, Object> map = new HashMap<String, Object>();
        int a =employ.insertemployAdd(tbRecruitmentemployed);
        System.out.println("新添加id"+tbRecruitmentemployed.getEmployedId());
        System.out.println("影响行数"+a);
if (a>0){
    employ.updatehire(tbRecruitmentemployed);
}
        System.out.println(map);
        map.put("a", a);
        return "redirect:/employ/selectAllemploy";
    }

    @ResponseBody
    @RequestMapping(value="/deleteemploy")
    public String deleteemploy(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = employ.deleteemploy(tbRecruitmentemployed);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/employ/selectAllemploy";
    }
    @ResponseBody
    @RequestMapping(value="/updateemploy")
    public String updateemploy(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        employ.updateemploy(tbRecruitmentemployed);
        System.out.println(tbRecruitmentemployed);
        return "redirect:/employ/selectAllemploy";
    }
    @ResponseBody
    @RequestMapping(value="/updatbyShaixuan")
    public String updatbyShaixuan(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        employ.updateShaixuan(tbRecruitmentemployed);
        System.out.println(tbRecruitmentemployed);
        return "redirect:/employ/findbyShaixuan";
    }
    @ResponseBody
    @RequestMapping(value="/updatbyShaixuanluyong")
    public String updatbyShaixuanluyong(TbRecruitmentemployed tbRecruitmentemployed){
        Map<String,Object> map = new HashMap<String, Object>();
        employ.updateShaixuanluyong(tbRecruitmentemployed);
        System.out.println(tbRecruitmentemployed);
        return "redirect:/employ/findbyShaixuan";
    }
}
