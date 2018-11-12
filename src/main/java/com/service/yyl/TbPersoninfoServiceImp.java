package com.service.yyl;

import com.dao.yyl.TbPersoninfoDao;
import com.entity.yyl.TbPersoninfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TbPersoninfoServiceImp implements TbPersoninfoService {

    @Autowired
    private TbPersoninfoDao tbpersoninfodao;

    @Override
    public List<Map> TbPersoninfoQuery(TbPersoninfo tp) {
        return tbpersoninfodao.TbPersoninfoQuery(tp);
    }

    @Override
    public void TbPersoninfoAdd(TbPersoninfo tp) {
        tbpersoninfodao.TbPersoninfoAdd(tp);
    }

    @Override
    public void TbPersoninfoUpdate(TbPersoninfo tp) {
        tbpersoninfodao.TbPersoninfoUpdate(tp);
    }
}
