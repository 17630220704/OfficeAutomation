package com.service.yyl;

import com.dao.yyl.TbPositionDao;
import com.entity.yyl.TbPosition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TbPositionServiceImp implements TbPositionService {

    @Autowired
    private TbPositionDao tbdao;

    @Override
    public List<Map> TbPositionQuery(TbPosition tp) {
        return tbdao.TbPositionQuery(tp);
    }
}
