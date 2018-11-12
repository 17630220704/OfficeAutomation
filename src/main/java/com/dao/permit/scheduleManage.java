package com.dao.permit;

import com.entity.schedule.TbScheduleDate;

import java.util.List;
import java.util.Map;

public interface scheduleManage {
    //查询班次
    List<Map<String,Object>> listschedule();
    //查询排班时间
    List<Map<String,Object>> listscheduledate();
    //添加排班时间
    Integer savescheduledate(TbScheduleDate tbsd);

}
