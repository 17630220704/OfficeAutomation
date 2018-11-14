package com.services.permit;

import com.dao.permit.scheduleManage;
import com.entity.schedule.TbScheduleDate;
import com.entity.schedule.TdSchedule;
import com.entity.schedule.upschedule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Service("scheduleManageServiceImp")
public class scheduleManageServiceImp implements scheduleManageService {

    @Autowired
    private scheduleManage scheduleManagedao;


    @Override
    public List<Map<String, Object>> listscheduledate() {
        List<Map<String,Object>> list = scheduleManagedao.listscheduledate();
        return list;
    }

    @Override
    public String savescheduledate(
            String sdName
            ,String sdAmstartdate
            ,String sdAmenddate
            ,String sdPmstartdate
            ,String sdPmenddate
            ,String sdNmstartdate
            ,String sdNmenddate
    )throws ParseException {
        System.out.println("sdName:"+sdName+" "+"sdAmstartdate:"+sdAmstartdate+" "+"sdAmenddate:"+sdAmenddate+" "+"sdPmstartdate:"+sdPmstartdate+" "+"sdPmenddate:"+sdPmenddate+" ");
        System.out.println("sdNmstartdate:"+sdNmstartdate+" "+"sdNmenddate:"+sdNmenddate);
        TbScheduleDate tbScheduleDate = new TbScheduleDate();
        SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");//小写的mm表示的是分钟
        Time sdAmstartdatetime = new Time(sdf.parse(sdAmstartdate).getTime());
        Time sdAmenddatetime = new Time(sdf.parse(sdAmenddate).getTime());
        Time sdPmstartdatetime = new Time(sdf.parse(sdPmstartdate).getTime());
        Time sdPmenddatetime = new Time(sdf.parse(sdPmenddate).getTime());
        Time sdNmstartdatetime = new Time(sdf.parse(sdNmstartdate).getTime());
        Time sdNmenddatetime = new Time(sdf.parse(sdNmenddate).getTime());
        tbScheduleDate.setSdName(sdName);
        tbScheduleDate.setSdAmstartdate(sdAmstartdatetime);
        tbScheduleDate.setSdAmenddate(sdAmenddatetime);
        tbScheduleDate.setSdPmstartdate(sdPmstartdatetime);
        tbScheduleDate.setSdPmenddate(sdPmenddatetime);
        tbScheduleDate.setSdNmstartdate(sdNmstartdatetime);
        tbScheduleDate.setSdNmenddate(sdNmenddatetime);
        System.out.println(tbScheduleDate);
        Integer result = scheduleManagedao.savescheduledate(tbScheduleDate);
        if (result==1){
            return "添加成功";
        }
        if (result==null){
            return "添加失败";
        }
        return "添加失败";
    }

    @Override
    public String deletescheduledate(Integer sdid) {
        Integer result = scheduleManagedao.deletescheduledate(sdid);
        if (result==1){
            return "删除成功";
        }
        if (result==null){
            return "删除失败";
        }
        return "删除失败";
    }

    @Override
    public String updatescheduledate(int sdId, String sdName, String sdAmstartdate, String sdAmenddate, String sdPmstartdate, String sdPmenddate, String sdNmstartdate, String sdNmenddate) throws ParseException {
        System.out.println("sdName:"+sdName+" "+"sdAmstartdate:"+sdAmstartdate+" "+"sdAmenddate:"+sdAmenddate+" "+"sdPmstartdate:"+sdPmstartdate+" "+"sdPmenddate:"+sdPmenddate+" ");
        System.out.println("sdNmstartdate:"+sdNmstartdate+" "+"sdNmenddate:"+sdNmenddate);
        TbScheduleDate tbScheduleDate = new TbScheduleDate();
        SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");//小写的mm表示的是分钟
        Time sdAmstartdatetime = new Time(sdf.parse(sdAmstartdate).getTime());
        Time sdAmenddatetime = new Time(sdf.parse(sdAmenddate).getTime());
        Time sdPmstartdatetime = new Time(sdf.parse(sdPmstartdate).getTime());
        Time sdPmenddatetime = new Time(sdf.parse(sdPmenddate).getTime());
        Time sdNmstartdatetime = new Time(sdf.parse(sdNmstartdate).getTime());
        Time sdNmenddatetime = new Time(sdf.parse(sdNmenddate).getTime());
        tbScheduleDate.setSdId(sdId);
        tbScheduleDate.setSdName(sdName);
        tbScheduleDate.setSdAmstartdate(sdAmstartdatetime);
        tbScheduleDate.setSdAmenddate(sdAmenddatetime);
        tbScheduleDate.setSdPmstartdate(sdPmstartdatetime);
        tbScheduleDate.setSdPmenddate(sdPmenddatetime);
        tbScheduleDate.setSdNmstartdate(sdNmstartdatetime);
        tbScheduleDate.setSdNmenddate(sdNmenddatetime);
        System.out.println(tbScheduleDate);
        Integer result = scheduleManagedao.updatescheduledate(tbScheduleDate);
        if (result==1){
            return "更新成功";
        }
        if (result==null){
            return "更新失败";
        }
        return "更新失败";
    }
    @Override
    public List<Map<String, Object>> listschedule() {
        List<Map<String, Object>> list = scheduleManagedao.listschedule();
        return list;
    }

    @Override
    public List<Map<String, Object>> scheduleType() {
        List<Map<String, Object>> list = scheduleManagedao.scheduleType();
        return list;
    }

    @Override
    public String updateschedule(upschedule upschedule) {
        if (upschedule.getScheduleState()==null){
            upschedule.setScheduleState("0");
        }
        System.out.println(upschedule);
        Integer result = scheduleManagedao.updateschedule(upschedule);
        if (result==1){
            return "更新成功";
        }
        if (result==null){
            return "更新失败";
        }
        return "更新失败";
    }

    @Override
    public List<Map<String, Object>> listpersoninfo() {
        List<Map<String, Object>> list =  scheduleManagedao.listpersoninfo();
        return list;
    }

    @Override
    @Transactional
    public String saveschedule(TdSchedule tdSchedule) {
        /*班次类型格式转换*/
        int scheduleId = 0;
        scheduleId = Integer.valueOf(tdSchedule.getScheduleType());
        /*获取合并时间*/
        List<Map<String,Object>> savetype = scheduleManagedao.getscheduletypedate(scheduleId);
        String sd_amstartdate = savetype.get(0).get("sd_amstartdate").toString();
        String sd_amenddate = savetype.get(0).get("sd_amenddate").toString();
        String sd_pmstartdate = savetype.get(0).get("sd_pmstartdate").toString();
        String sd_pmenddate = savetype.get(0).get("sd_pmenddate").toString();
        String am = sd_amstartdate+"-"+sd_amenddate;
        String pm = sd_pmstartdate+"-"+sd_pmenddate;
        /*实体设置合并时间*/
        tdSchedule.setMonday(am+","+pm);
        tdSchedule.setTuesday(am+","+pm);
        tdSchedule.setWednesday(am+","+pm);
        tdSchedule.setThursday(am+","+pm);
        tdSchedule.setFriday(am+","+pm);
        tdSchedule.setSaturday(am+","+pm);
        tdSchedule.setSunday(am+","+pm);
        tdSchedule.setScheduleState("1");
        /*添加排班*/
        Integer result = scheduleManagedao.saveschedule(tdSchedule);
        int getsdid = 0;
        Integer saveresult = null;
        /*获取排班添加人员排班*/
        String personid = tdSchedule.getPersoId();
        getsdid = (int)tdSchedule.getScheduleId();
        if(personid!= null&&personid!=""){
            String[] arr =personid.split(",");
            for(int i=0;i<arr.length;i++){
                int getpersonid = Integer.valueOf(arr[i]);
                saveresult= scheduleManagedao.savepersoninfo_schedule(getpersonid,getsdid);
            }
        }
        if (result==1&&saveresult ==1){
            return "添加成功";
        }
        if (result==null){
            return "添加失败";
        }
        return "添加失败";
    }
}
