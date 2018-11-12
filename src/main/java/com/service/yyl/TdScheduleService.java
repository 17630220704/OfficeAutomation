package com.service.yyl;

import com.entity.yyl.TdSchedule;

import java.util.List;
import java.util.Map;

public interface TdScheduleService {
    public List<Map> TdScheduleQuery();
    public void TdScheduleAdd(TdSchedule ts);
    public void TdScheduleUpdate(TdSchedule ts);
    public void TdScheduleDelete(int ts_id);
}
