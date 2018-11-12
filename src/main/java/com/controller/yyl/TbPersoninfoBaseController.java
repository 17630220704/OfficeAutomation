package com.controller.yyl;

import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TpSalarySheet;
import com.service.yyl.TbInsuranceBaseServiceImp;
import com.service.yyl.TbPersoninfoBaseServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbPersoninfoBaseController")
public class TbPersoninfoBaseController {
    @Resource
    private TbPersoninfoBaseServiceImp tpbdao;
    @ResponseBody
    @RequestMapping(value="tp_bquery.do")
    public List TbPersoninfoBaseQuery(TbPersoninfoBase tpb){
        List<Map> list = tpbdao.TbPersoninfoBaseQuery(tpb);
        return list;
    }
    @RequestMapping(value="tp_badd.do")
    public void TbPersoninfoBaseAdd(TbPersoninfoBase tpb){
        tpbdao.TbPersoninfoBaseAdd(tpb);
    }
    @RequestMapping(value="tp_bupdate.do")
    public void TbPersoninfoBaseUpdate(TbPersoninfo tp, TbPersoninfoBase tpb, TpSalarySheet ts, String posiId1){
        tpbdao.TbPersoninfoBaseUpdate(tp,tpb,ts,posiId1);
    }
    @RequestMapping(value="tp_bdelete.do")
    public void TbPersoninfoBaseDelete(TbPersoninfoBase tpb){
        tpbdao.TbPersoninfoBaseDelete(tpb);
    }
}
