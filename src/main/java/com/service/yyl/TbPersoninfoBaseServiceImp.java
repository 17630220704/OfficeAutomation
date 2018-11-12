package com.service.yyl;

import com.dao.yyl.TbInsuranceBaseDao;
import com.dao.yyl.TbPersoninfoBaseDao;
import com.dao.yyl.TbPersoninfoDao;
import com.dao.yyl.TpSalarySheetDao;
import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TpSalarySheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    @Override
    public List<Map> TbPersoninfoBaseQuery(TbPersoninfoBase tpb) {
        return tpbdao.TbPersoninfoBaseQuery(tpb);
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
