package com.dao.yyl;

import com.entity.yyl.TbPosition;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbPositionDao {
    List<Map> TbPositionQuery(TbPosition tp);
}
