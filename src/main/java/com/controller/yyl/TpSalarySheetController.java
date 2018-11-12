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
    public Map<String,Object> TpSalarySheetQuery(String persoId1){
        Map<String,Object> TpSalarySheetlist = tsdao.TpSalarySheetQuery(persoId1);
        return TpSalarySheetlist;
    }
    @RequestMapping(value="td_sadd.do")
    public void TpSalarySheetAdd(TpSalarySheet ts){
        System.out.println(ts);
        tsdao.TpSalarySheetAdd(ts);
    }
    @RequestMapping(value="td_update.do")
    public void TpSalarySheetUpdate(TpSalarySheet tps, String sheetId1, String persoId1, TbPersoninfoBaseFake tpbf){
        System.out.println(tpbf);
        tsdao.TpSalarySheetUpdate(tps,sheetId1,persoId1,tpbf);
    }
    @RequestMapping(value="td_delete.do")
    public void TpSalarySheetDelete(TpSalarySheet ts){
        tsdao.TpSalarySheetDelete(ts);
    }
}
