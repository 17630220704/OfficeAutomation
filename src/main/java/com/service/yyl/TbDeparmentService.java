package com.service.yyl;

import com.entity.yyl.TbDeparment;
import com.entity.yyl.TbPosition;

import java.util.List;
import java.util.Map;

public interface TbDeparmentService {
    List<Map> TbDeparmentQuery(TbDeparment td);
    List<Map> TbDeparmentpersonfoQuery(TbDeparment td);
    List<Map> TbDeparmentpersonfoQuery2(TbDeparment td);
}
