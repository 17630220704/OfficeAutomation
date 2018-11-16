package com.controller.lqp;

import com.entity.lqp.*;
import com.services.lqp.APersoninfoServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/info")
public class APersoninfoController {
    @Autowired
    private APersoninfoServiceImp info;
    @ResponseBody
    @RequestMapping(value="/selectinfo")
    public Map<String,Object> selectinfo(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = info.findinfoall();
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/selectinfoname")
    public List<Map<String,Object>> selectinfoname(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =info.findinfobyname();
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/selectinfodept")
    public List<Map<String,Object>> selectinfodept(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =info.findinfobydept();
        return list;
    }@ResponseBody
    @RequestMapping(value="/selectinforole")
    public List<Map<String,Object>> selectinforole(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =info.findinfobyrole();
        return list;
    }

    @ResponseBody
    @RequestMapping(value="/selectinfothem")
    public List<Map<String,Object>> selectinfothem(TbPersoninfo tbPersoninfo){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =info.findShaixuan(tbPersoninfo);
        return list;
    }
    @ResponseBody
    @RequestMapping(value="/insertinfo")
    public String insertinfo(TbPersoninfo tbPersoninfo,TbRoleUser tbRoleUser, TbUser tbUser, TbRole tbRole, TbDeparment tbDeparment){
        Map<String, Object> map = new HashMap<String, Object>();
        int a = info.insertinfo(tbPersoninfo);
        System.out.println(tbPersoninfo.getPersoId());

        if(a>0){
            tbUser.setPersoId(tbPersoninfo.getPersoId());
            tbUser.setULoginPassword(tbPersoninfo.getTelephone());
           System.out.println("getPersoId"+tbUser.getPersoId());
            int b=  info.insertuser(tbUser);
            System.out.println("tianjia"+tbUser);
            System.out.println(b);
            System.out.println(tbUser.getUId());
            if (b>0){
                tbRoleUser.setUId(tbUser.getUId());
                System.out.println(tbRoleUser.getUId());
                tbRoleUser.setRId(tbRoleUser.getRId());
                int c=info.insertRoleUser(tbRoleUser);
                System.out.println(c);
          if (c>0){
            int aaa=    info.updatehire(tbPersoninfo);
                System.out.println("这是修改的hire"+aaa);
            }}
       }else {
           System.out.println("添加失败");
       }
        map.put("a", a);
        return "redirect:/info/selectinfo";
    }
    @ResponseBody
    @RequestMapping(value="/insertinfoAdd")
    public String insertinfoAdd(TbPersoninfo tbPersoninfo,TbRoleUser tbRoleUser, TbUser tbUser, TbRole tbRole, TbDeparment tbDeparment){
        Map<String, Object> map = new HashMap<String, Object>();
        int a = info.insertinfoAdd(tbPersoninfo);
        System.out.println(tbPersoninfo.getPersoId());
        if(a>0){
            tbUser.setPersoId(tbPersoninfo.getPersoId());
            tbUser.setULoginPassword(tbPersoninfo.getTelephone());
            System.out.println("getPersoId"+tbUser.getPersoId());
            int b=  info.insertuser(tbUser);
            System.out.println("tianjia"+tbUser);
            System.out.println(b);
            System.out.println(tbUser.getUId());
            if (b>0){
                tbRoleUser.setUId(tbUser.getUId());
                System.out.println(tbRoleUser.getUId());
                tbRoleUser.setRId(tbRoleUser.getRId());
                int c=info.insertRoleUser(tbRoleUser);
                System.out.println(c);
            }
        }else {
            System.out.println("添加失败");
        }
        map.put("a", a);
        return "redirect:/info/selectinfo";
    }

    @ResponseBody
    @RequestMapping(value="/deleteinfo")
    public String deleteinfo(TbPersoninfo tbPersoninfo){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = info.deleteinfo(tbPersoninfo);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/info/selectinfo";
    }
    @ResponseBody
    @RequestMapping(value="/updateinfo")
    public String updateinfo(TbPersoninfo tbPersoninfo){
        Map<String,Object> map = new HashMap<String, Object>();
        info.updateinfo(tbPersoninfo);
        System.out.println(tbPersoninfo);
        return "redirect:/info/selectinfo";
    }
    @ResponseBody
    @RequestMapping(value="/updatethem")
    public String updateithem(TbPersoninfo tbPersoninfo){
        Map<String,Object> map = new HashMap<String, Object>();
     info.updateShaixuan(tbPersoninfo);
        System.out.println(tbPersoninfo);
        return "redirect:/info/selectinfo";
    }
}
