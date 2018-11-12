package com.controller.lqp;


import com.entity.lqp.TbHirefile;
import com.services.lqp.AHireImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/ahire")
public class AHireController {
    @Autowired
    private AHireImp ahireImp;
    @ResponseBody
    @RequestMapping(value="/selectAll")
    public Map<String,Object> select(TbHirefile tbHirefile){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = ahireImp.findhireall(tbHirefile);
        map.put("list", list);
        return map;
    }
    /*@ResponseBody
    @RequestMapping(value="/selectName")
    public List<Map<String,Object>> select2(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =aHireImp.findhirebyname();
        return list;
    }*/
    /*method= RequestMethod.POST*/
    @ResponseBody
    @RequestMapping(value="/insertHire")
    public String insertHire(TbHirefile tbHirefile){
        System.out.println("AHire：进入添加方法");
        Map<String, Object> map = new HashMap<String, Object>();
        int a = ahireImp.inserthire(tbHirefile);
        System.out.println("影响行数"+a);
        System.out.println(map);
        map.put("a", a);
        return "redirect:/selectAll";
    }

    @ResponseBody
    @RequestMapping(value="/deleteHire")
    public String deleteHire(TbHirefile tbHirefile){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = ahireImp.deletehire(tbHirefile);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/ahire/selectAll";
    }
    @ResponseBody
    @RequestMapping(value="/updateHire")
    public String updateHire(TbHirefile tbHirefile){
        Map<String,Object> map = new HashMap<String, Object>();
        ahireImp.updatehire(tbHirefile);
        System.out.println(tbHirefile);
        return "redirect:/selectAll";
    }
}
