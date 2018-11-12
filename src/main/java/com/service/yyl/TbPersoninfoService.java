package com.service.yyl;

import com.entity.yyl.TbPersoninfo;

import java.util.List;
import java.util.Map;

public interface TbPersoninfoService {
    /**
     * 查询排班类型
     * */
    List<Map> TbPersoninfoQuery(TbPersoninfo tp);
    void TbPersoninfoAdd(TbPersoninfo tp);
    void TbPersoninfoUpdate(TbPersoninfo tp);
}
