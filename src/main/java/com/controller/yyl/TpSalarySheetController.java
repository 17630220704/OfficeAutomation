package com.controller.yyl;

import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TbPersoninfoBaseFake;
import com.entity.yyl.TpSalarySheet;
import com.service.yyl.TpPaymentServiceImp;
import com.service.yyl.TpSalarySheetServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping(value = "/TpSalarySheetController")
public class TpSalarySheetController {
    @Resource
    private TpSalarySheetServiceImp tsdao;
    @Resource
    private TpPaymentServiceImp tppdao;
    @ResponseBody
    @RequestMapping(value="td_squery.do")
    public Map<String,Object> TpSalarySheetQuery(String persoId1,String month){
        Map<String,Object> TpSalarySheetlist = tsdao.TpSalarySheetQuery(persoId1,month);
        return TpSalarySheetlist;
    }
    @RequestMapping(value="td_sadd.do")
    public void TpSalarySheetAdd(TpSalarySheet ts){
        System.out.println(ts);
        tsdao.TpSalarySheetAdd(ts);
    }

    @RequestMapping(value="td_update.do")
    public void TpSalarySheetUpdate(TpSalarySheet tps, String sheetId1, String persoId1, TbPersoninfoBaseFake tpbf){
        tsdao.TpSalarySheetUpdate(tps,sheetId1,persoId1,tpbf);
    }
    @ResponseBody
    @RequestMapping(value="gzt_query.do")
    public Map<String,Object> gongzitiao(String month){
        Map<String,Object> gongzitiaolist = tsdao.gongzitiao(month);
        return gongzitiaolist;
    }
    @RequestMapping(value="td_delete.do")
    public void TpSalarySheetDelete(TpSalarySheet ts){
        tsdao.TpSalarySheetDelete(ts);
    }
}
