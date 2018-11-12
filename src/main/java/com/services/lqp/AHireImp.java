package com.services.lqp;

import com.dao.lqp.AHire;
import com.entity.lqp.TbHirefile;
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
    public int inserthire(TbHirefile tbHirefile) {
        return hire.inserthire(tbHirefile);
    }

    @Override
    public int deletehire(TbHirefile tbHirefile) {
        return hire.deletehire(tbHirefile);
    }

    @Override
    public int updatehire(TbHirefile tbHirefile) {
        return hire.updatehire(tbHirefile);
    }
}
