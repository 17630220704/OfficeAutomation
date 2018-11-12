package com.dao.yyl;

import com.entity.yyl.TdSchedule;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TdScheduleDao {
     List<Map> TdScheduleQuery();
     void TdScheduleAdd(TdSchedule ts);
     void TdScheduleUpdate(TdSchedule ts);
     void TdScheduleDelete(int ts_id);
}
