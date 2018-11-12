package com.service.yyl;

import com.dao.yyl.*;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TbPersoninfoBaseFake;
import com.entity.yyl.TpPayment;
import com.entity.yyl.TpSalarySheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TpSalarySheetServiceImp implements TpSalarySheetService{
    @Autowired
    private TpSalarySheetDao tsdao;
    @Autowired
    private TpPaymentDao tppdao;
    @Autowired
    private TbInsuranceBaseDao tibdao;
    @Autowired
    private TbPersoninfoBaseDao tpbdao;
    @Override
    public Map<String,Object> TpSalarySheetQuery(String persoId1) {
        String persoId = persoId1.substring(0,persoId1.length()-1);
        System.out.println(persoId);
        Map<String,Object> map = new HashMap();
        TpSalarySheet ts1 = new TpSalarySheet();
        TbPersoninfoBase tpb1 = new TbPersoninfoBase();
            List<Map> TpSalarySheet = tsdao.TpSalarySheetQuery1(persoId);//工资条
            List<Map> TbPersoninfoBase = tpbdao.TbPersoninfoBaseQuery1(persoId);//员工保险
        System.out.println(TpSalarySheet);
        System.out.println(TbPersoninfoBase);
        List<Map> TpSalarySheetlist = tsdao.TpSalarySheetQuery(ts1);//工资条
        List<Map> TbPersoninfoBaselist = tpbdao.TbPersoninfoBaseQuery(tpb1);//员工保险
        List<Map> TbInsuranceBaselist = tibdao.TbInsuranceBaseQuery();//保险基数
        List<Map> TpPaymentlist = tppdao.TpPaymentQuery();//薪酬项目
        int a = tppdao.TpPaymentCountQuery();//薪酬项目数
        map.put("TpSalarySheetlist",TpSalarySheetlist);
        map.put("TpPaymentlist",TpPaymentlist);
        map.put("TbPersoninfoBaselist",TbPersoninfoBaselist);
        map.put("TbInsuranceBaselist",TbInsuranceBaselist);
        map.put("a",a);
        return map;
    }

    @Override
    public void TpSalarySheetAdd(TpSalarySheet ts) {
        tsdao.TpSalarySheetAdd(ts);
    }

    @Override
    public void TpSalarySheetUpdate(TpSalarySheet tps,String sheetId1,String persoId1, TbPersoninfoBaseFake tpbf) {
        String[] sheetId = sheetId1.split(",");
        String[] persoId = persoId1.split(",");
        String a = "0";
        for (int i = 0; i < sheetId.length; i++) {
            a+=",0";
        }
        String[] b = a.split(",");
        String[] sheet0 = a.split(",");
        String[] sheet1 = a.split(",");
        String[] sheet2 = a.split(",");
        String[] sheet3 = a.split(",");
        String[] sheet4 = a.split(",");
        String[] sheet5 = a.split(",");
        String[] sheet6 = a.split(",");
        String[] sheet7 = a.split(",");
        String[] sheet8 = a.split(",");
        String[] sheet9 = a.split(",");
        String[] sheet10 = a.split(",");
        if (tps.getSheet0()!=null && tps.getSheet0().length() >=sheetId1.length()){sheet0 = tps.getSheet0().split(",");}
        if (tps.getSheet1()!=null && tps.getSheet1().length() >=sheetId1.length()){sheet1 = tps.getSheet1().split(",");}
        if (tps.getSheet2()!=null && tps.getSheet2().length() >=sheetId1.length()){sheet2 = tps.getSheet2().split(",");}
        if (tps.getSheet3()!=null && tps.getSheet3().length() >=sheetId1.length()){sheet3 = tps.getSheet3().split(",");}
        if (tps.getSheet4()!=null && tps.getSheet4().length() >=sheetId1.length()){sheet4 = tps.getSheet4().split(",");}
        if (tps.getSheet5()!=null && tps.getSheet5().length() >=sheetId1.length()){sheet5 = tps.getSheet5().split(",");}
        if (tps.getSheet6()!=null && tps.getSheet6().length() >=sheetId1.length()){sheet6 = tps.getSheet6().split(",");}
        if (tps.getSheet7()!=null && tps.getSheet7().length() >=sheetId1.length()){sheet7 = tps.getSheet7().split(",");}
        if (tps.getSheet8()!=null && tps.getSheet8().length() >=sheetId1.length()){sheet8 = tps.getSheet8().split(",");}
        if (tps.getSheet9()!=null && tps.getSheet9().length() >=sheetId1.length()){sheet9 = tps.getSheet9().split(",");}
        if (tps.getSheet10()!=null && tps.getSheet10().length() >=sheetId1.length()){sheet10 = tps.getSheet10().split(",");}
        for (int i = 0; i < sheetId.length; i++) {
            TpSalarySheet ts = new TpSalarySheet();
            ts.setSheet0(sheet0[i]);
            ts.setSheet1(sheet1[i]);
            ts.setSheet2(sheet2[i]);
            ts.setSheet3(sheet3[i]);
            ts.setSheet4(sheet4[i]);
            ts.setSheet5(sheet5[i]);
            ts.setSheet6(sheet6[i]);
            ts.setSheet7(sheet7[i]);
            ts.setSheet8(sheet8[i]);
            ts.setSheet9(sheet9[i]);
            ts.setSheet10(sheet10[i]);
            ts.setPersoId(Integer.parseInt(persoId[i]));
            ts.setSheetId(Integer.parseInt(sheetId[i]));
            tsdao.TpSalarySheetUpdate(ts);
        }
        String[] persbaseId = tpbf.getPersbaseId().split(",");
        String[] perSalary = tpbf.getPerSalary().split(",");
        String[] yanglaoPerson = tpbf.getYanglaoPerson().split(",");
        String[] yanglaoUnits = tpbf.getYanglaoUnits().split(",");
        String[] yiliaoPerson = tpbf.getYiliaoPerson().split(",");
        String[] yiliaoUnits = tpbf.getYiliaoUnits().split(",");
        String[] shiyePerson = tpbf.getShiyePerson().split(",");
        String[] shiyeUnits = tpbf.getShiyeUnits().split(",");
        String[] zhufangPerson = tpbf.getZhufangPerson().split(",");
        String[] zhufangUnits = tpbf.getZhufangUnits().split(",");
        String[] gongshangUnits = tpbf.getGongshangUnits().split(",");
        String[] shengyuUnits = tpbf.getShengyuUnits().split(",");
        String[] riskBack = tpbf.getRiskBack().split(",");
        for (int i = 0; i < persbaseId.length; i++) {
            TbPersoninfoBase tpb = new TbPersoninfoBase();
                tpb.setPersbaseId(Integer.parseInt(persbaseId[i]));
                tpb.setPerSalary(Double.parseDouble(perSalary[i]));
                tpb.setYanglaoPerson(Double.parseDouble(yanglaoPerson[i]));
                tpb.setYanglaoUnits(Double.parseDouble(yanglaoUnits[i]));
                tpb.setYiliaoPerson(Double.parseDouble(yiliaoPerson[i]));
                tpb.setYiliaoUnits(Double.parseDouble(yiliaoUnits[i]));
                tpb.setShiyePerson(Double.parseDouble(shiyePerson[i]));
                tpb.setShiyeUnits(Double.parseDouble(shiyeUnits[i]));
                tpb.setZhufangPerson(Double.parseDouble(zhufangPerson[i]));
                tpb.setZhufangUnits(Double.parseDouble(zhufangUnits[i]));
                tpb.setGongshangUnits(Double.parseDouble(gongshangUnits[i]));
                tpb.setShengyuUnits(Double.parseDouble(shengyuUnits[i]));
                tpb.setRiskBack(Double.parseDouble(riskBack[i]));
                tpbdao.TbPersoninfoBaseUpdate(tpb);
        }
    }

    @Override
    public void TpSalarySheetDelete(TpSalarySheet ts) {
        tsdao.TpSalarySheetDelete(ts);
    }
}
