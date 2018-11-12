package com.controller.yyl;

import com.entity.yyl.TdStaff;
import com.entity.yyl.TpPayment;
import com.service.yyl.TdStaffServiceImp;
import com.service.yyl.TpPaymentServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TpPaymentController")
public class TpPaymentController {
    @Resource
    private TpPaymentServiceImp tppdao;
    @ResponseBody
    @RequestMapping(value="tp_pquery.do")
    public List TpPaymentQuery(TpPayment tpp){
        List<Map> list = tppdao.TpPaymentQuery();
        return list;
    }
    @RequestMapping(value="tp_padd.do")
    public void TpPaymentAdd(TpPayment tpp){
        tppdao.TpPaymentAdd(tpp);
    }
    @RequestMapping(value="tp_pupdate.do")
    public void TpPaymentUpdate(TpPayment tpp){
        tppdao.TpPaymentUpdate(tpp);
    }
    @RequestMapping(value="tp_pdelete.do")
    public void TpPaymentDelete(TpPayment tpp){
        tppdao.TpPaymentDelete(tpp);
    }
}
