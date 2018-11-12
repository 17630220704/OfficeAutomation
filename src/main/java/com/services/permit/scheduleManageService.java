package com.services.permit;

import com.entity.schedule.TbScheduleDate;

import java.util.List;
import java.util.Map;

public interface scheduleManageService {
    //查询班次
    List<Map<String,Object>> listschedule();
    //查询排班时间
    List<Map<String,Object>> listscheduledate();
    //添加排班时间
    boolean savescheduledate(TbScheduleDate tbsd);
}
