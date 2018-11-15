package com.service.yyl;

import com.entity.yyl.TdStaff;

import java.util.List;
import java.util.Map;

public interface TdStaffService {
    List<Map> TdStaffQuery(TdStaff ts);
    void TdStaffAdd(TdStaff ts);
    void TdStaffUpdate(TdStaff ts);
    void TdStaffDelete(TdStaff ts);
}
