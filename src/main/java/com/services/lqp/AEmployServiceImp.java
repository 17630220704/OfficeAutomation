package com.services.lqp;

import com.dao.lqp.AEmploy;
import com.entity.lqp.TbRecruitmentemployed;
import com.entity.lqp.TbRecruitmentplan;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class AEmployServiceImp implements  AEmployService{
    @Autowired
    private AEmploy aEmploy;
    @Override
    public List<Map> findemployall(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.findemployall(tbRecruitmentemployed);
    }

    @Override
    public List<Map> findemployallshaixuan(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.findemployallshaixuan(tbRecruitmentemployed);
    }

    @Override
    public List<Map<String, Object>> findemploybynamep() {
        return aEmploy.findemploybynamep();
    }

    @Override
    public List<Map<String, Object>> findemploybyname() {
        return aEmploy.findemploybyname();
    }

    @Override
    public int insertemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.insertemploy(tbRecruitmentemployed);
    }

    @Override
    public int insertemployAdd(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.insertemployAdd(tbRecruitmentemployed);
    }

    @Override
    public int deleteemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.deleteemploy(tbRecruitmentemployed);
    }

    @Override
    public int updateemploy(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updateemploy(tbRecruitmentemployed);
    }

    @Override
    public List<Map<String, Object>> findShaixuan(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.findShaixuan(tbRecruitmentemployed);
    }

    @Override
    public List<Map<String, Object>> findShaixuan2(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.findShaixuan2(tbRecruitmentemployed);
    }


    @Override
    public int updateShaixuan(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updateShaixuan(tbRecruitmentemployed);
    }

    @Override
    public int updateShaixuanluyong(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updateShaixuanluyong(tbRecruitmentemployed);
    }

    @Override
    public int updatehire(TbRecruitmentemployed tbRecruitmentemployed) {
        return aEmploy.updatehire(tbRecruitmentemployed);
    }
}
