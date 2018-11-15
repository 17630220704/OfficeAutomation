package com.dao.yyl;

import com.entity.yyl.TpPayment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TpPaymentDao {
    List<Map> TpPaymentQuery();
    int TpPaymentCountQuery();
    void TpPaymentAdd(TpPayment tpp);
    void TpPaymentUpdate(TpPayment tpp);
    void TpPaymentDelete(TpPayment tpp);
}
