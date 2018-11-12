package com.service.yyl;

import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TbPersoninfoBaseFake;
import com.entity.yyl.TpSalarySheet;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface TpSalarySheetService {
    Map<String,Object>TpSalarySheetQuery(String persoId1);
    void TpSalarySheetAdd(TpSalarySheet ts);
    //工资条
    void TpSalarySheetUpdate(TpSalarySheet tps,String sheetId1,String persoId1,TbPersoninfoBaseFake tpbf);
    void TpSalarySheetDelete(TpSalarySheet ts);
}
