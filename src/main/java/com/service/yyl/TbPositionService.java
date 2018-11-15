package com.service.yyl;

import com.entity.yyl.TbPosition;

import java.util.List;
import java.util.Map;

public interface TbPositionService {
    List<Map> TbPositionQuery(TbPosition tp);
}
