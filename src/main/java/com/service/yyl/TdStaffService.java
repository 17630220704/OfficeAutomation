package com.service.yyl;

import com.entity.yyl.TdStaff;

import java.util.List;
import java.util.Map;

public interface TdStaffService {
    public List<Map> TdStaffQuery(TdStaff ts);
    public void TdStaffAdd(TdStaff ts);
    public void TdStaffUpdate(TdStaff ts);
    public void TdStaffDelete(TdStaff ts);
}
