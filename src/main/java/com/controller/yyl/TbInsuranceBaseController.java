package com.controller.yyl;

import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TpPayment;
import com.service.yyl.TbInsuranceBaseServiceImp;
import com.service.yyl.TpPaymentServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbInsuranceBaseController")
public class TbInsuranceBaseController {
    @Resource
    private TbInsuranceBaseServiceImp tibdao;
    @ResponseBody
    @RequestMapping(value="ti_bquery.do")
    public List TbInsuranceBaseQuery(){
        List<Map> list = tibdao.TbInsuranceBaseQuery();
        return list;
    }
    @RequestMapping(value="ti_badd.do")
    public void TbInsuranceBaseAdd(TbInsuranceBase tib){
        tibdao.TbInsuranceBaseAdd(tib);
    }
    @RequestMapping(value="ti_bupdate.do")
    public void TbInsuranceBaseUpdate(TbInsuranceBase tib){
        System.out.println(tib);
        tibdao.TbInsuranceBaseUpdate(tib);
    }
    @RequestMapping(value="ti_bdelete.do")
    public void TbInsuranceBaseDelete(TbInsuranceBase tib){
        tibdao.TbInsuranceBaseDelete(tib);
    }
}
