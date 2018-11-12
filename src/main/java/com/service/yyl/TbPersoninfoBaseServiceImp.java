package com.service.yyl;

import com.dao.yyl.*;
import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TpSalarySheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbPersoninfoBaseServiceImp implements TbPersoninfoBaseService{
    @Autowired
    private TbPersoninfoBaseDao tpbdao;//职员保险
    @Autowired
    private TpSalarySheetDao tsdao;//工资条
    @Autowired
    private TbPersoninfoDao tbpersoninfodao;//职员
    @Autowired
    private TpPaymentDao tppdao;
    @Autowired
    private TbInsuranceBaseDao tibdao;
    @Override
    public Map<String,Object> TbPersoninfoBaseQuery(TbPersoninfoBase tpb) {
        Map<String,Object> map = new HashMap();
        List<Map> TbInsuranceBaselist = tibdao.TbInsuranceBaseQuery();//保险基数
        List<Map> TpPaymentlist = tppdao.TpPaymentQuery();//薪酬项目
        List<Map> TbPersoninfoBaselist = tpbdao.TbPersoninfoBaseQuery(tpb);//薪酬项目
        int a = tppdao.TpPaymentCountQuery();//薪酬项目数
        map.put("TbInsuranceBaselist",TbInsuranceBaselist);
        map.put("TpPaymentlist",TpPaymentlist);
        map.put("TbPersoninfoBaselist",TbPersoninfoBaselist);
        map.put("a",a);
        return map;
    }

    @Override
    public void TbPersoninfoBaseAdd(TbPersoninfoBase tpb) {
        tpbdao.TbPersoninfoBaseAdd(tpb);
    }

    @Override
    public void TbPersoninfoBaseUpdate(TbPersoninfo tp, TbPersoninfoBase tpb, TpSalarySheet ts, String posiId1) {
        String[] posiId = posiId1.split(",");
        for (int i = 0; i < posiId.length; i++) {
            tp.setPosiId(Integer.parseInt(posiId[i]));
            List<Map> list = tbpersoninfodao.TbPersoninfoQuery(tp);
            for (int j = 0; j < list.size(); j++) {
                Object a = list.get(j).get("persoId");
                ts.setPersoId(Integer.parseInt(a.toString()));
                tpb.setPersoId(Integer.parseInt(a.toString()));
                tsdao.TpSalarySheetUpdateBatch(ts);
                tpbdao.TbPersoninfoBaseUpdateBatch(tpb);
            }
        }
    }

    @Override
    public void TbPersoninfoBaseDelete(TbPersoninfoBase tpb) {
        tpbdao.TbPersoninfoBaseDelete(tpb);
    }
}
