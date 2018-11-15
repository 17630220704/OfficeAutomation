package com.dao.yyl;

import com.entity.yyl.TbInsuranceBase;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbInsuranceBaseDao {
    List<Map> TbInsuranceBaseQuery();
    void TbInsuranceBaseAdd(TbInsuranceBase tib);
    void TbInsuranceBaseUpdate(TbInsuranceBase tib);
    void TbInsuranceBaseDelete(TbInsuranceBase tib);
}
