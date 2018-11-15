package com.dao.yyl;

import com.entity.yyl.TbPersoninfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface TbPersoninfoDao {
    List<Map> TbPersoninfoQuery(TbPersoninfo tp);
    List<Map> TbPersoninfoSelect();
    void TbPersoninfoAdd(TbPersoninfo tp);
    void TbPersoninfoUpdate(TbPersoninfo tp);
}
