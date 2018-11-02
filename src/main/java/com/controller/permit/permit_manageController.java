package com.controller.permit;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.services.permit.permitManageService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    /*Get&&Set*/
    public permitManageService getPermitManageServicedao() {
        return permitManageServicedao;
    }
    public void setPermitManageServicedao(permitManageService permitManageServicedao) {
        this.permitManageServicedao = permitManageServicedao;
    }
}
