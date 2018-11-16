package com.services.lqp;

import com.dao.lqp.AHire;
import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentplan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class AHireImp implements AHireService {
    @Autowired
    private AHire hire;

    @Override
    public List<Map> findhireall(TbHirefile tbHirefile) {
        return hire.findhireall(tbHirefile);
    }

    @Override
    public List<Map> findplanthem(TbRecruitmentplan tbRecruitmentplan) {
        return hire.findplanthem(tbRecruitmentplan);
    }


    @Override
    public int inserthire(TbHirefile tbHirefile) {
        return hire.inserthire(tbHirefile);
    }

    @Override
    public int inserthireAdd(TbHirefile tbHirefile) {
        return hire.inserthireAdd(tbHirefile);
    }

    @Override
    public int deletehire(TbHirefile tbHirefile) {
        return hire.deletehire(tbHirefile);
    }

    @Override
    public int updatehire(TbHirefile tbHirefile) {
        return hire.updatehire(tbHirefile);
    }

    @Override
    public int updatehireAdd(TbHirefile tbHirefile) {
        return hire.updatehireAdd(tbHirefile);
    }
}
