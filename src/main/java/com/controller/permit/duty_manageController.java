package com.controller.permit;

import com.entity.schedule.TbScheduleDate;
import com.services.permit.scheduleManageService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            @RequestParam("sdAmstartdate") String sdAmstartdate
            ,@RequestParam("sdAmenddate") String sdAmenddate
            ,@RequestParam("sdPmstartdate") String sdPmstartdate
            ,@RequestParam("sdPmenddate") String sdPmenddate
            ,@RequestParam("sdNmstartdate") String sdNmstartdate
            ,@RequestParam("sdNmenddate") String sdNmenddate
    )throws ParseException {
        TbScheduleDate tbScheduleDate = new TbScheduleDate();
        SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");//小写的mm表示的是分钟
        Time sdAmstartdatetime = new Time(sdf.parse(sdAmstartdate).getTime());
        Time sdAmenddatetime = new Time(sdf.parse(sdAmenddate).getTime());
        Time sdPmstartdatetime = new Time(sdf.parse(sdPmstartdate).getTime());
        Time sdPmenddatetime = new Time(sdf.parse(sdPmenddate).getTime());
        Time sdNmstartdatetime = new Time(sdf.parse(sdNmstartdate).getTime());
        Time sdNmenddatetime = new Time(sdf.parse(sdNmenddate).getTime());
        tbScheduleDate.setSdAmstartdate(sdAmstartdatetime);
        tbScheduleDate.setSdAmenddate(sdAmenddatetime);
        tbScheduleDate.setSdPmstartdate(sdPmstartdatetime);
        tbScheduleDate.setSdPmenddate(sdPmenddatetime);
        tbScheduleDate.setSdNmstartdate(sdNmstartdatetime);
        tbScheduleDate.setSdNmenddate(sdNmenddatetime);
        System.out.println(tbScheduleDate);
        Map map = new HashMap();
        //scheduleManageServicedao.savescheduledate(tbScheduleDate);
        map.put("result","true");

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
