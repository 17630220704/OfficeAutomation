package com.services.permit;

import com.entity.schedule.TdSchedule;
import com.entity.schedule.upschedule;
import org.apache.ibatis.annotations.Param;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface scheduleManageService {
    //查询排班时间
    List<Map<String,Object>> listscheduledate();
    //添加排班时间
    String savescheduledate(String sdName, String sdAmstartdate, String sdAmenddate, String sdPmstartdate, String sdPmenddate, String sdNmstartdate, String sdNmenddate) throws ParseException;
    //删除班次时间
    String deletescheduledate(Integer sdid);
    //修改班次时间
    String updatescheduledate(int sdId, String sdName, String sdAmstartdate, String sdAmenddate, String sdPmstartdate, String sdPmenddate, String sdNmstartdate, String sdNmenddate) throws ParseException;
    //查询班次
    List<Map<String,Object>> listschedule();
    //查询班次类型
    List<Map<String,Object>> scheduleType();
    //修改排班
    String updateschedule(upschedule upschedule);
    //查询员工
    List<Map<String,Object>> listpersoninfo();
    //添加排班
    String saveschedule(TdSchedule tdSchedule);
    //删除班次
    String deletescheduel(int scheduleId);
    //修改是否启用该排班
    Integer updatescheduelState(int scheduleId, String scheduelState);
    //根据id查询排班人员
    List<Map<String,Object>> getpersoninfo_schedule(int scheduleId);
}
