package com.service.yyl;

import com.dao.yyl.*;
import com.entity.yyl.TbInsuranceBase;
import com.entity.yyl.TbPayrollprocess;
import com.entity.yyl.TbPersoninfoBase;
import com.entity.yyl.TpSalarySheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class TbPayrollprocessServiceImp implements TbPayrollprocessService{
    @Autowired
    private TbPayrollprocessDao tpldao;
    @Autowired
    private TpSalarySheetDao tsdao;//工资条
    @Autowired
    private TbInsuranceBaseDao tibdao;//保险基数
    @Autowired
    private TbPersoninfoBaseDao tpbdao;//员工保险
    @Autowired
    private TbPersoninfoDao tpdao;//员工
    @Override
    public List<Map> TbPayrollprocessQuery() {
        return tpldao.TbPayrollprocessQuery();
    }

    @Override
    public void TbPayrollprocessAdd(TbPayrollprocess tpl) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        String a = session.getAttribute("userid").toString();
        tpl.setOperator(a);
        System.out.println(tpl);
        tpldao.TbPayrollprocessAdd(tpl);//薪资流程
        System.out.println("完成");
        /*创建工资条*/
        List<Map> tp = tpdao.TbPersoninfoSelect();
        for (int i = 0; i < tp.size(); i++) {
            TpSalarySheet ts = new TpSalarySheet();//工资条
            TbPersoninfoBase tpb = new TbPersoninfoBase();//员工保险
            int persoId = (int)tp.get(i).get("persoId");
            String seet = tpl.getSeet();//创建时间
            ts.setPersoId(persoId);
            ts.setMonth(seet);//薪资标识
            tpb.setPersoId(persoId);
            tpb.setMonth(seet);//薪资标识
            tsdao.TpSalarySheetAdd(ts);//工资条
            tpbdao.TbPersoninfoBaseAdd(tpb);//员工保险
        }
    }

    @Override
    public void TbPayrollprocessUpdate(TbPayrollprocess tpl) {
        String seet = tpl.getSeet();
        TpSalarySheet ts = new TpSalarySheet();//工资条
        TbPersoninfoBase tpb = new TbPersoninfoBase();//员工保险

        tpldao.TbPayrollprocessUpdate(tpl);
        ts.setMonth(seet);//薪资标识
        tpb.setMonth(seet);//薪资标识
        tsdao.TpSalarySheetmonthUpdate(ts);//工资条
        tpbdao.TbPersoninfomonthBaseUpdate(tpb);//员工保险
    }

    @Override
    public void TbPayrollprocessDetle(TbPayrollprocess tpl) {
        String seet = tpl.getSeet();
        TpSalarySheet ts = new TpSalarySheet();//工资条
        TbPersoninfoBase tpb = new TbPersoninfoBase();//员工保险
        System.out.println(seet);
        ts.setMonth(seet);//薪资标识
        tpb.setMonth(seet);//薪资标识
        tpldao.TbPayrollprocessDetle(tpl);
        tsdao.TpSalarySheetDelete(ts);//工资条
        tpbdao.TbPersoninfoBaseDelete(tpb);//员工保险
    }
}
