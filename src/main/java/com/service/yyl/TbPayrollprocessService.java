package com.service.yyl;

import com.entity.yyl.TbPayrollprocess;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface TbPayrollprocessService {
    List<Map> TbPayrollprocessQuery();
    void TbPayrollprocessAdd(TbPayrollprocess tpl);
    void TbPayrollprocessUpdate(TbPayrollprocess tpl);
    void TbPayrollprocessDetle(TbPayrollprocess tpl);
}
