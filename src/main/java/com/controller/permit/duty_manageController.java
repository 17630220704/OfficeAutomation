package com.controller.permit;

import com.entity.schedule.TbScheduleDate;
import com.entity.schedule.TdSchedule;
import com.entity.schedule.upschedule;
import com.services.permit.scheduleManageService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("singleton")
public class duty_manageController {

    @Resource(name = "scheduleManageServiceImp")
    private scheduleManageService scheduleManageServicedao;

    @ResponseBody
    @RequestMapping(value = "/listscheduledate.do")
    public Map listscheduledate(){
        Map map = new HashMap();
        List<Map<String,Object>> listscheduledate = scheduleManageServicedao.listscheduledate();
        map.put("code",0);
        map.put("msg","");
        map.put("data",listscheduledate);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/savescheduledate.do")
    public Map savescheduledate(
            @RequestParam("sdName") String sdName
            ,@RequestParam("sdAmstartdate") String sdAmstartdate
            ,@RequestParam("sdAmenddate") String sdAmenddate
            ,@RequestParam("sdPmstartdate") String sdPmstartdate
            ,@RequestParam("sdPmenddate") String sdPmenddate
            ,@RequestParam("sdNmstartdate") String sdNmstartdate
            ,@RequestParam("sdNmenddate") String sdNmenddate
    )throws ParseException {
        Map map = new HashMap();
        String result = scheduleManageServicedao.savescheduledate(sdName,sdAmstartdate,sdAmenddate,sdPmstartdate,sdPmenddate,sdNmstartdate,sdNmenddate);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deletescheduledate.do")
    public Map deletescheduledate(Integer sdid){
            Map map = new HashMap();
        if (sdid == null || sdid==0){
            map.put("result","参数错误，不能为空或0");
        }else {
            String result = scheduleManageServicedao.deletescheduledate(sdid);
            map.put("result",result);
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/updatescheduledate.do")
    public Map updatescheduledate(
            @RequestParam("sdId") int sdId
            ,@RequestParam("sdName") String sdName
            ,@RequestParam("sdAmstartdate") String sdAmstartdate
            ,@RequestParam("sdAmenddate") String sdAmenddate
            ,@RequestParam("sdPmstartdate") String sdPmstartdate
            ,@RequestParam("sdPmenddate") String sdPmenddate
            ,@RequestParam("sdNmstartdate") String sdNmstartdate
            ,@RequestParam("sdNmenddate") String sdNmenddate
    )throws ParseException {
        Map map = new HashMap();
        String result = scheduleManageServicedao.updatescheduledate(sdId,sdName,sdAmstartdate,sdAmenddate,sdPmstartdate,sdPmenddate,sdNmstartdate,sdNmenddate);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/listschedule.do")
    public Map listschedule(){
        Map map = new HashMap();
        List<Map<String,Object>> listscheduledate = scheduleManageServicedao.listschedule();
        map.put("code",0);
        map.put("msg","");
        map.put("data",listscheduledate);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/scheduleType.do")
    public Map scheduleType(){
        Map map = new HashMap();
        List<Map<String,Object>> scheduleType = scheduleManageServicedao.scheduleType();
        map.put("result",scheduleType);
        return map;
    }
    /*@RequestParam("scheduleId") Integer scheduleId
             ,@RequestParam("scheduleName") String scheduleName
             ,@RequestParam("scheduleType") String scheduleType
             ,@RequestParam("scheduleState") String scheduleState
             ,@RequestParam("dateStart") java.sql.Date dateStart
             ,@RequestParam("dateEnd") Date dateEnd
             ,@RequestParam("monday") String monday
             ,@RequestParam("tuesday") String tuesday
             ,@RequestParam("wednesday") String wednesday
             ,@RequestParam("thursday") String thursday
             ,@RequestParam("friday") String friday
             ,@RequestParam("saturday") String saturday
             ,@RequestParam("sunday") String sunday*/
    @ResponseBody
    @RequestMapping(value = "/updateschedule.do")
    public Map updateschedule(upschedule upschedule){
        Map map = new HashMap();
        String result = scheduleManageServicedao.updateschedule(upschedule);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/listpersoninfo.do")
    public Map listpersoninfo(){
        Map map = new HashMap();
        List<Map<String,Object>> result = scheduleManageServicedao.listpersoninfo();
        map.put("code",0);
        map.put("msg","success");
        map.put("data",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/saveschedule.do")
    public Map saveschedule(TdSchedule tdSchedule){
        Map map = new HashMap();
        String result = scheduleManageServicedao.saveschedule(tdSchedule);
        map.put("result",result);
        return map;
    }

    /*Get&&Set*/
    public scheduleManageService getScheduleManageServicedao() {
        return scheduleManageServicedao;
    }
    public void setScheduleManageServicedao(scheduleManageService scheduleManageServicedao) {
        this.scheduleManageServicedao = scheduleManageServicedao;
    }
}
