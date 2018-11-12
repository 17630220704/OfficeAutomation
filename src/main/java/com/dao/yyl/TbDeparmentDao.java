package com.dao.yyl;

import com.entity.yyl.TbDeparment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbDeparmentDao {
    //部门查询
    List<Map> TbDeparmentQuery(TbDeparment td);
    //查询部门下人员
    List<Map> TbDeparmentpersonfoQuery(TbDeparment td);
    List<Map> TbDeparmentpersonfoQuery2(TbDeparment td);
}
