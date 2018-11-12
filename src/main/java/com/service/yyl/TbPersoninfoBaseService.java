package com.service.yyl;

import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TpSalarySheet;

import java.util.List;
import java.util.Map;

public interface TbPersoninfoBaseService {
    List<Map> TbPersoninfoBaseQuery(TbPersoninfoBase tpb);
    void TbPersoninfoBaseAdd(TbPersoninfoBase tpb);
    void TbPersoninfoBaseUpdate(TbPersoninfo tp, TbPersoninfoBase tpb, TpSalarySheet ts, String posiId1);
    void TbPersoninfoBaseDelete(TbPersoninfoBase tpb);
}
