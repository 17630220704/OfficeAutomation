package com.dao.yyl;

import com.entity.yyl.TpSalarySheet;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TpSalarySheetDao {
    List<Map> TpSalarySheetQuery(TpSalarySheet ts);
    List<Map> TpSalarySheetQuery1(String persoId);
    void TpSalarySheetAdd(TpSalarySheet ts);
    void TpSalarySheetUpdate(TpSalarySheet ts);
    void TpSalarySheetUpdateBatch(TpSalarySheet ts);
    void TpSalarySheetDelete(TpSalarySheet ts);
}
