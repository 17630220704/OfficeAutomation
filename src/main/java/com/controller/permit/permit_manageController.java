package com.controller.permit;

import com.entity.permit.TbUser;
import com.entity.permit.upRoleUser;
import com.services.permit.permitManageService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("singleton")
public class permit_manageController {

    @Resource(name="permitManageServiceImp")
    private permitManageService permitManageServicedao;

    @ResponseBody
    @RequestMapping(value = "/listRole.do")
    public Map listRole(){
        Map map = new HashMap();
        List<Map> listRole = new ArrayList<Map>();
        listRole = permitManageServicedao.listRole();
        map.put("listRole",listRole);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/getModulTrees.do")
    public Map getModulTrees(Integer rid){
        Map map = new HashMap();
        List<Map<String,Object>> getmodulTrees = permitManageServicedao.getModulTrees(rid);
        map.put("getmodulTrees",getmodulTrees);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/updatepermit.do")
    public Map updatepermit(String mid,Integer rid){
        Map map = new HashMap();
        Boolean result = permitManageServicedao.updatePermit(mid,rid);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/saveRole.do")
    public Map saveRole(String rname){
        Map map = new HashMap();
        Boolean result = permitManageServicedao.saveRole(rname);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteRole.do")
    public Map deleteRole(int rid){
        Map map = new HashMap();
        Boolean result = permitManageServicedao.deleteRole(rid);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/listDept.do")
    public Map listDept(){
        Map map = new HashMap();
        List<Map<String,Object>> result = permitManageServicedao.listDept();
        map.put("code",0);
        map.put("msg","");
        map.put("data",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/getDept.do")
    public Map getDept(){
        Map map = new HashMap();
        List<Map<String,Object>> result = permitManageServicedao.getDept();
        map.put("getDept",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteDept.do")
    public Map deleteDept(int deptid){
        Map map = new HashMap();
        boolean result = permitManageServicedao.deleteDept(deptid);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/updateDept.do")
    public Map updateDept(Integer DeptId,String DeptName,String DeptType){
        Map map = new HashMap();
        boolean result = permitManageServicedao.updateDept(DeptId,DeptType,DeptName);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/saveDept.do")
    public Map saveDept(Integer DeptNumber, String DeptName){
        Map map = new HashMap();
        boolean result = permitManageServicedao.saveDept(DeptNumber,DeptName);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/listRoleUser.do")
    public Map listRoleUser(String personname){
        Map map = new HashMap();
        List<Map<String,Object>> result = permitManageServicedao.listRoleUser(personname);
        map.put("code",0);
        map.put("msg","");
        map.put("data",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/updateRole.do")
    public Map updateRole(upRoleUser upru){
        Map map = new HashMap();
        boolean result =  permitManageServicedao.updateRole(upru);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/updatelocking.do")
    public Map updatelocking(int uid,int ulocking){
        Map map = new HashMap();
        String result =  permitManageServicedao.updatelocking(uid,ulocking);
        map.put("result",result);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/delRoleUser.do")
    public Map delRoleUser(int uid){
        Map map = new HashMap();
        Integer result =  permitManageServicedao.delRoleUser(uid);
        map.put("result",result);
        return map;
    }

    /*Get&&Set*/
    public permitManageService getPermitManageServicedao() {
        return permitManageServicedao;
    }
    public void setPermitManageServicedao(permitManageService permitManageServicedao) {
        this.permitManageServicedao = permitManageServicedao;
    }
}
