package com.service.yyl;

import com.entity.yyl.TpPayment;

import java.util.List;
import java.util.Map;

public interface TpPaymentService {
    List<Map> TpPaymentQuery();
    int TpPaymentCountQuery();
    void TpPaymentAdd(TpPayment tpp);
    void TpPaymentUpdate(TpPayment tpp);
    void TpPaymentDelete(TpPayment tpp);
}
