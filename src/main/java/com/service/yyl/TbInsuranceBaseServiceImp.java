package com.service.yyl;

import com.dao.yyl.TbInsuranceBaseDao;
import com.dao.yyl.TpPaymentDao;
import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TpPayment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TbInsuranceBaseServiceImp implements TbInsuranceBaseService{
    @Autowired
    private TbInsuranceBaseDao tibdao;

    @Override
    public List<Map> TbInsuranceBaseQuery() {
        return tibdao.TbInsuranceBaseQuery();
    }

    @Override
    public void TbInsuranceBaseAdd(TbInsuranceBase tib) {
        tibdao.TbInsuranceBaseAdd(tib);
    }

    @Override
    public void TbInsuranceBaseUpdate(TbInsuranceBase tib) {
        tibdao.TbInsuranceBaseUpdate(tib);
    }

    @Override
    public void TbInsuranceBaseDelete(TbInsuranceBase tib) {
        tibdao.TbInsuranceBaseDelete(tib);
    }
}
