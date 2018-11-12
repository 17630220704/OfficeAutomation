package com.services.lqp;

import com.dao.lqp.APersoninfo;
import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRoleUser;
import com.entity.lqp.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class APersoninfoServiceImp implements  APersoninfoService {
    @Autowired
    private APersoninfo aPersoninfo;
    @Override
    public List<Map> findinfoall() {
        return aPersoninfo.findinfoall();
    }

    @Override
    public List<Map<String, Object>> findinfobyname() {
        return aPersoninfo.findinfobyname();
    }

    @Override
    public int insertinfo(TbPersoninfo tbPersoninfo) {
        return aPersoninfo.insertinfo(tbPersoninfo);
    }

    @Override
    public int deleteinfo(TbPersoninfo tbPersoninfo) {
        return aPersoninfo.deleteinfo(tbPersoninfo);
    }

    @Override
    public int updateinfo(TbPersoninfo tbPersoninfo) {
        return aPersoninfo.updateinfo(tbPersoninfo);
    }

    @Override
    public List<Map<String, Object>> findShaixuan(TbPersoninfo tbPersoninfo) {
        return aPersoninfo.findShaixuan(tbPersoninfo);
    }

    @Override
    public int updateShaixuan(TbPersoninfo tbPersoninfo) {
        return aPersoninfo.updateShaixuan(tbPersoninfo);
    }

    @Override
    public int insertuser(TbUser tbUser) {
        return aPersoninfo.insertuser(tbUser);
    }

    @Override
    public List<Map<String, Object>> findinfobydept() {
        return aPersoninfo.findinfobydept();
    }

    @Override
    public int insertRoleUser(TbRoleUser tbRoleUser) {
        return aPersoninfo.insertRoleUser(tbRoleUser);
    }

    @Override
    public List<Map<String, Object>> findinfobyrole() {
        return aPersoninfo.findinfobyrole();
    }
}
