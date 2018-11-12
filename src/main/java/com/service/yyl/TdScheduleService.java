package com.service.yyl;

import com.entity.yyl.TdSchedule;

import java.util.List;
import java.util.Map;

public interface TdScheduleService {
    List<Map> TdScheduleQuery();
    void TdScheduleAdd(TdSchedule ts);
    void TdScheduleUpdate(TdSchedule ts);
    void TdScheduleDelete(int ts_id);
}
