package com.controller.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.tb_PersonInfo;
import com.entity.knowledge.time;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.services.knowledge.meetser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/meet")
public class meetcontroller {

    @Autowired
    private meetser ser;

    @RequestMapping("/query4")
    @ResponseBody
    public Map<String, Object> query4(time ti) {
        Map<String, Object> map = new HashMap<String, Object>();
        if(ti.getTiid()==1){
           List<time> list= ser.querytimorning(ti);
            if(null == list || list.size() ==0 ){
                map.put("time","该时间段不可用");
                return map;
            }else{
                map.put("time","该时间段可以用");
                return map;
            }
        }else if (ti.getTiid()==2){
            List<time> list= ser.querytiupper(ti);
            if(null == list || list.size() ==0 ){
                map.put("time","该时间段不可用");
                return map;
            }else{
                map.put("time","该时间段可以用");
                return map;
            }
        }else if(ti.getTiid()==3){
            List<time> list= ser.querytilower(ti);
            if(null == list || list.size() ==0 ){
                map.put("time","该时间段不可用");
                return map;
            }else{
                map.put("time","该时间段可以用");
                return map;
            }
        }else{
            List<time> list= ser.querytinight(ti);
            if(null == list || list.size() ==0 ){
                map.put("time","该时间段不可用");
                return map;
            }else{
                map.put("time","该时间段可以用");
                return map;
            }
        }
    }
    @RequestMapping("/query")
    @ResponseBody
    public Map<String, Object> query() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<conferenceroom> list = ser.query();
        map.put("co", list);
        return map;
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map<String, Object> save(HttpServletRequest session, String mename, String mevalue, int menumber, String tidate, int coid, int tiid) {
        Map<String, Object> map = new HashMap<String, Object>();
        session.getSession().setAttribute("userid",1);
        int b = (int) session.getSession().getAttribute("userid");
        meeting me = new meeting();
        me.setMename(mename);
        me.setMenumber(menumber);
        me.setMevalue(mevalue);
        me.setMedate(tidate);
        tb_PersonInfo a = new tb_PersonInfo();
        a.setPersoId(b);
        me.setTb_PersonInfo(a);
        me.setMestate("待审核");
        me.setMeremarks("无");
        time ti = new time();
        ti.setTidate(tidate);
        conferenceroom co = new conferenceroom();
        co.setCoid(coid);
        ti.setConferenceroom(co);
        me.setConferenceroom(co);
        if(me.getMename()==null){}
        if(tiid==1){
            List<time> list= ser.querytimorning(ti);
            if(null == list || list.size() ==0 ){
                map.put("mee","该时间段不可用");
                return map;
            }else{
                me.setMetime("上午8-10时");
                ser.save(me);
                map.put("mee","保存成功");
                return map;
            }
        }else if(tiid==2){
            List<time> list= ser.querytiupper(ti);
            if(null == list || list.size() ==0 ){
                map.put("mee","该时间段不可用");
                return map;
            }else{
                me.setMetime("上午10-12时");
                ser.save(me);
                map.put("mee","保存成功");
                return map;
            }
        }else if(tiid==3){
            List<time> list= ser.querytilower(ti);
            if(null == list || list.size() ==0 ){
                map.put("mee","该时间段不可用");
                return map;
            }else{
                me.setMetime("下午14-16时");
                ser.save(me);
                map.put("mee","保存成功");
                return map;
            }
        }else if(tiid==4){
            List<time> list= ser.querytinight(ti);
            if(null == list || list.size() ==0 ){
                map.put("mee","该时间段不可用");
                return map;
            }else{
                me.setMetime("下午16-18时");
                ser.save(me);
                map.put("mee","保存成功");
                return map;
            }
        }else{
            map.put("mee","时间选择错误");
            return map;
        }
    }

    @RequestMapping("/query1")
    @ResponseBody
    public Map<String, Object> query1(@RequestParam(required = false, defaultValue = "8") int PageSize , @RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        List<meeting> list = ser.query1(1);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("me", list);
        return map;
    }
    @RequestMapping("/query2")
    @ResponseBody
    public Map<String, Object> query1(int id) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<meeting> list = ser.query2(id);
        map.put("query", list);
        return map;
    }
    @RequestMapping("/query3")
    @ResponseBody
    public Map<String, Object> query3(time ti) throws ParseException {
       Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        int result=df.format(new Date()).compareTo(ti.getTidate());
        List<time> list = ser.query3(ti);
        if (result==0)
            if (list.size()==1){
                map.put("sj", list);
                return map;
            }else{
                ser.save1(ti);
                List<time> rlist =ser.query3(ti);
                map.put("sj",rlist);
                return map;
            }
        else if (result < 0 )
            if (list.size()==1){
                map.put("sj", list);
                return map;
            }else{
                ser.save1(ti);
                List<time> rlist =ser.query3(ti);
                map.put("sj",rlist);
                return map;
            }
        else{
          map.put("sj",1);
          return map;
        }
    }
    @RequestMapping("/query5")
    @ResponseBody
    public  Map<String, Object> query4(int meid,int coid) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<meeting> list= ser.query4(meid);
        time ti = new time();
        ti.setTidate(list.get(0).getMedate());
        conferenceroom co = new conferenceroom();
        co.setCoid(coid);
        ti.setConferenceroom(co);
        if(list.get(0).getMetime().equals("上午8-10时")){
            List<time> rlist= ser.querytimorning(ti);
            if(null == rlist || rlist.size() ==0 ){
                 map.put("sh","时间被占用");
            }else{
                ser.updatetimorning(rlist.get(0).getTiid());
                ser.updateid(meid);
                map.put("sh","审核成功");
            }
        }else if (list.get(0).getMetime().equals("上午10-12时")){
            List<time> rlist= ser.querytiupper(ti);
            if(null == rlist || rlist.size() ==0 ){
                map.put("sh","时间被占用");
            }else{
                ser.updatetiupper(rlist.get(0).getTiid());
                ser.updateid(meid);
                map.put("sh","审核成功");
            }
        }else if(list.get(0).getMetime().equals("下午14-16时")){
            List<time> rlist= ser.querytilower(ti);
            if(null == rlist || rlist.size() ==0 ){
                map.put("sh","时间被占用");
            }else{
                ser.updatetilower(rlist.get(0).getTiid());
                ser.updateid(meid);
                map.put("sh","审核成功");
            }
        }else if(list.get(0).getMetime().equals("下午16-18时")){
            List<time> rlist= ser.querytinight(ti);
            if(null == rlist || rlist.size() ==0 ){
                map.put("sh","时间被占用");
            }else{
                ser.updatetinight(rlist.get(0).getTiid());
                ser.updateid(meid);
                map.put("sh","审核成功");
            }
        }else {
            map.put("sh","数据错误");
        }
        return map;
    }

    @RequestMapping("/updateth")
    @ResponseBody
    public Map<String, Object> updateth(int meid,String bz) {
        Map<String, Object> map = new HashMap<String, Object>();
        meeting me = new meeting();
        me.setMeid(meid);
        me.setMeremarks(bz);
        ser.updatebz(me);
        ser.updateth(meid);
        map.put("th", "退回成功");
        return map;
    }
   /* @RequestMapping("/query6")
    @ResponseBody
    public Map<String, Object> query6() {
        Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(df.format(new Date()));
        map.put("th", df.format(new Date()));
        return map;
    }*/
    @RequestMapping("/query7")
    @ResponseBody
    public Map<String, Object> query7(@RequestParam(required = false, defaultValue = "8") int PageSize ,@RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        List<meeting> list = ser.query5();
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("meeting",list);
        map.put("pi",pi);
        return map;
    }
    @RequestMapping("/query8")
    @ResponseBody
    public Map<String, Object> query8( String lx,@RequestParam(required = false, defaultValue = "8") int PageSize ,@RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        List<meeting> list = ser.queryme1(lx);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("meeting1",list);
        return map;
    }
    @RequestMapping("/query9")
    @ResponseBody
    public Map<String, Object> query9( String date,String date1,@RequestParam(required = false, defaultValue = "8") int PageSize ,@RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        meeting me = new meeting();
        me.setMedate(date);
        me.setMestate(date1);
        List<meeting> list = ser.queryme2(me);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("meeting2",list);
        return map;
    }
    //模糊查询
    @RequestMapping("/query10")
    @ResponseBody
    public Map<String, Object> query10( String name,@RequestParam(required = false, defaultValue = "8") int PageSize ,@RequestParam(required = false, defaultValue = "1") int startPage) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(startPage, PageSize);
        List<meeting> list = ser.queryme3(name);
        PageInfo<meeting> pi = new PageInfo<>(list);
        map.put("pi",pi);
        map.put("meeting3",list);
        return map;
    }
    //状态修改已结束会议
    @RequestMapping("updatestate")
    @ResponseBody
    public void updatestate() {
       ser.updatestate();
    }

}

