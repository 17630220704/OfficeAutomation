package com.dao.yyl;

import com.entity.yyl.TbPayrollprocess;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface TbPayrollprocessDao {
    List<Map> TbPayrollprocessQuery();
    void TbPayrollprocessAdd(TbPayrollprocess tpl);
    void TbPayrollprocessUpdate(TbPayrollprocess tpl);
    void TbPayrollprocessDetle(TbPayrollprocess tpl);
}
