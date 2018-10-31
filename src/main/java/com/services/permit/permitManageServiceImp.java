package com.services.permit;

import com.dao.permit.permitManage;
import com.factory.permit.treefactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("permitManageServiceImp")
public class permitManageServiceImp implements permitManageService {

    @Autowired
    private permitManage permitManagedao;

    @Override
    public List<Map> listRole() {
        List<Map> list = permitManagedao.listRole();
        return list;
    }

    @Override
    public List<Map> getRolePermit(Integer rid) {
        List<Map> list = permitManagedao.getRolePermit(rid);
        return list;
    }

    @Override
    public List<Map<String,Object>> getModulTrees(String rid) {
        treefactory tfy = new treefactory();
        List<Map<String,Object>> list = permitManagedao.getModulTrees(rid);
        List<Map<String,Object>> getModulTrees = tfy.deptList(list);
        return getModulTrees;
    }
}
