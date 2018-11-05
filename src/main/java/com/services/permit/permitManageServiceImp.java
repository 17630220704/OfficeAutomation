package com.services.permit;

import com.dao.permit.permitManage;
import com.factory.permit.treefactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    public List<Map<String,Object>> getModulTrees(Integer rid) {
        treefactory tfy = new treefactory();
        List<Map<String,Object>> getModulTrees = new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> list = permitManagedao.getModulTrees(rid);
        getModulTrees = tfy.deptList(list);
        return getModulTrees;
    }

    @Override
    @Transactional
    public boolean updatePermit(String mid,int rid) {
        int mid2 = 0;
        Integer saveresult=null;
        Integer deleteresult=null;
        boolean result = false;
        if (rid!=1){
            if(mid==null||mid==""){
                deleteresult =  permitManagedao.deletePermit(rid);
                result = true;
            }
            if (mid!=null&&mid!=""&&rid>0){
                deleteresult =  permitManagedao.deletePermit(rid);
                String [] arr = mid.split(",");
                for(int i=0;i<arr.length;i++){
                    mid2 = Integer.valueOf(arr[i]);
                    saveresult= permitManagedao.savePermit(rid,mid2);
                }
                result = true;
            }
        }
        return result;
    }

    @Override
    @Transactional
    public boolean saveRole(String rname) {
        Integer result = permitManagedao.saveRole(rname);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }

    @Override
    public boolean deleteRole(int rid) {
        Integer result = permitManagedao.deleteRole(rid);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> listDept() {
        List<Map<String,Object>> list = permitManagedao.listDept();
        return list;
    }

    @Override
    public List<Map<String, Object>> getDept() {
        List<Map<String,Object>> list = permitManagedao.getDept();
        return list;
    }

    @Override
    public boolean deleteDept(int deptid) {
        Integer result = permitManagedao.deleteDept(deptid);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }

    @Override
    public boolean updateDept(int DeptId,String DeptType,String DeptName) {
        Integer result = permitManagedao.updateDept(DeptId,DeptType,DeptName);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }

    @Override
    public boolean saveDept(int DeptNumber, String DeptName) {
        Integer result = permitManagedao.saveDept(DeptNumber,DeptName);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }
}
