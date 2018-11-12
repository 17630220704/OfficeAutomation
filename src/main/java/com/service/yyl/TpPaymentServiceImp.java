package com.service.yyl;

import com.dao.yyl.TdTransferDao;
import com.dao.yyl.TpPaymentDao;
import com.entity.yyl.TdTransfer;
import com.entity.yyl.TpPayment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TpPaymentServiceImp implements TpPaymentService{
    @Autowired
    private TpPaymentDao tppdao;

    @Override
    public List<Map> TpPaymentQuery() {
        return tppdao.TpPaymentQuery();
    }

    @Override
    public int TpPaymentCountQuery() {
        return tppdao.TpPaymentCountQuery();
    }

    @Override
    public void TpPaymentAdd(TpPayment tpp) {
        tppdao.TpPaymentAdd(tpp);
    }

    @Override
    public void TpPaymentUpdate(TpPayment tpp) {
        tppdao.TpPaymentUpdate(tpp);
    }

    @Override
    public void TpPaymentDelete(TpPayment tpp) {
        tppdao.TpPaymentDelete(tpp);
    }
}
