package com.service.yyl;

import com.entity.yyl.TbDeparment;
import com.entity.yyl.TbPosition;

import java.util.List;
import java.util.Map;

public interface TbDeparmentService {
    //部门查询
    List<Map> TbDeparmentQuery(TbDeparment td);
    //查询部门下人员
    List<Map> TbDeparmentpersonfoQuery(TbDeparment td);
    List<Map> TbDeparmentpersonfoQuery2(TbDeparment td);
    //查询未签合同人员
    List<Map> TbDeparmentpersonfo_StaffQuery(TbDeparment td);
    List<Map> TbDeparmentpersonfo_StaffQuery2(TbDeparment td);
}
