package com.controller.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.tb_PersonInfo;
import com.entity.knowledge.meeting;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.services.knowledge.knowser;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/know")
public class knowcontroller {
     @Autowired
    private knowser ser;

    @RequestMapping("/query")
    @ResponseBody
    public Map<String, Object> query(@RequestParam(required = false, defaultValue = "8") int PageSize , @RequestParam(required = false, defaultValue = "1") int startPage){
        Map<String, Object> map= new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        List<conferenceroom> list =ser.query();
        PageInfo<conferenceroom> pi = new PageInfo<>(list);
        map.put("conferenceroom", list);
        map.put("pi",pi);
        return map;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public void delete(int deletecoid){
        ser.delete(deletecoid);
    }
    @RequestMapping("/update")
    @ResponseBody
    public void update(int coid,String coname,String costate,String covalue,int perid) {
        conferenceroom co = new conferenceroom();
        co.setCoid(coid);
        co.setCovalue(covalue);
        co.setCostate(costate);
        co.setConame(coname);
        tb_PersonInfo p = new tb_PersonInfo();
        p.setPersoId(perid);
        co.setTb_personInfo(p);
        ser.update(co);
        System.out.println(co.getTb_personInfo().getPersoId());
    }
    @RequestMapping("/save")
    @ResponseBody
    public void save(int perid,String coname,String costate,String covalue){
        conferenceroom co = new conferenceroom();
        co.setConame(coname);
        co.setCostate(costate);
        co.setCovalue(covalue);
        tb_PersonInfo aa = new tb_PersonInfo();
        aa.setPersoId(perid);
        co.setTb_personInfo(aa);
        ser.save(co);
    }
    @RequestMapping("/query1")
    @ResponseBody
    public Map<String, Object> query1(HttpServletRequest session,@RequestParam(required = false, defaultValue = "8") int PageSize , @RequestParam(required = false, defaultValue = "1") int startPage){
        Map<String, Object> map= new HashMap<String, Object>();
        int b = (int) session.getSession().getAttribute("userid");
        PageHelper.startPage(startPage, PageSize);
        List<meeting> list =ser.query1(b);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("me", list);
        return map;
    }
    @RequestMapping("/query2")
    @ResponseBody
    public Map<String, Object> query2(int meid){
        Map<String, Object> map= new HashMap<String, Object>();
        List<meeting> list =ser.query3(meid);
        if(list.get(0).getMestate().equals("已批准")){
            ser.ch1(meid);
            if(list.get(0).getMetime().equals("上午8-10时")){
                ser.cha(list.get(0).getMedate());
            }else if(list.get(0).getMetime().equals("上午10-12时")){
                ser.chb(list.get(0).getMedate());
            }else if(list.get(0).getMetime().equals("下午14-16时")){
                ser.chc(list.get(0).getMedate());
            }else if(list.get(0).getMetime().equals("下午16-18时")){
                ser.chd(list.get(0).getMedate());
            }
        }else if(list.get(0).getMestate().equals("待审核")){
            ser.ch1(meid);
        }
        map.put("me","取消会议成功");
        return map;
    }
    @RequestMapping("/gly")
    @ResponseBody
    public Map<String, Object> gly(){
        Map<String, Object> map= new HashMap<String, Object>();
        List<tb_PersonInfo> list =ser.gly();
        map.put("tb", list);
        return map;
    }
    @RequestMapping("/grhy")
    @ResponseBody
    public Map<String, Object> grhy(HttpServletRequest session,@RequestParam(required = false, defaultValue = "5") int PageSize , @RequestParam(required = false, defaultValue = "1") int startPage){
        PageHelper.startPage(startPage, PageSize);
        Map<String, Object> map= new HashMap<String, Object>();
        int b = (int) session.getSession().getAttribute("userid");
        List<meeting> list =ser.grhy(b);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("me", list);
        return map;
    }
    @RequestMapping("/query11")
    @ResponseBody
    public Map<String, Object> query9( HttpServletRequest session,String date,String date1,@RequestParam(required = false, defaultValue = "8") int PageSize ,@RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        int b = (int) session.getSession().getAttribute("userid");
        meeting me = new meeting();
        me.setMedate(date);
        me.setMeid(b);
        me.setMestate(date1);
        List<meeting> list = ser.query11(me);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("meet11",list);
        return map;
    }

}
