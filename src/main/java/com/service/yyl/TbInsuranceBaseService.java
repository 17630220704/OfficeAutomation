package com.service.yyl;

import com.entity.yyl.TbInsuranceBase;

import java.util.List;
import java.util.Map;

public interface TbInsuranceBaseService {
    List<Map> TbInsuranceBaseQuery();
    void TbInsuranceBaseAdd(TbInsuranceBase tib);
    void TbInsuranceBaseUpdate(TbInsuranceBase tib);
    void TbInsuranceBaseDelete(TbInsuranceBase tib);
}
