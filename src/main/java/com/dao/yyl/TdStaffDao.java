package com.dao.yyl;

import com.entity.yyl.TdStaff;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TdStaffDao {
     List<Map> TdStaffQuery(TdStaff ts);
     void TdStaffAdd(TdStaff ts);
     void TdStaffUpdate(TdStaff ts);
     void TdStaffDelete(TdStaff ts);
}
