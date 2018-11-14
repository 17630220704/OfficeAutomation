package com.dao.permit;

import com.entity.schedule.TbScheduleDate;
import com.entity.schedule.TdSchedule;
import com.entity.schedule.upschedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface scheduleManage {
    //查询班次时间
    List<Map<String,Object>> listscheduledate();
    //添加班次时间
    Integer savescheduledate(TbScheduleDate tbsd);
    //删除班次时间
    Integer deletescheduledate(Integer sdid);
    //修改班次时间
    Integer updatescheduledate(TbScheduleDate tbsd);
    //查询排班
    List<Map<String,Object>> listschedule();
    //查询班次类型
    List<Map<String,Object>> scheduleType();
    //修改排班
    Integer updateschedule(upschedule upschedule);
    //查询员工
    List<Map<String,Object>> listpersoninfo();
    //添加排班
    Integer saveschedule(TdSchedule tdSchedule);
    //添加排班查询
    List<Map<String,Object>> getscheduletypedate(int sdid);
    //人员排班设置
    Integer savepersoninfo_schedule(@Param("personid") int personid, @Param("sdid") int sdid);
    //删除排班

}
