package com.controller.yyl;

import com.entity.yyl.TdConfig;
import com.service.yyl.TdConfigServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TdConfigController")
public class TdConfigController {
    @Resource(name="tdConfigServiceImp")
    private TdConfigServiceImp tcdao;
    @ResponseBody
    @RequestMapping(value="tdquery.do")
    public List tdConfigQuery(){
        List<Map> list = tcdao.tdConfigQuery();
        return list;
    }
    @RequestMapping(value="tdadd.do")
    public void tdConfigAdd(TdConfig tc){
        tcdao.tdConfigAdd(tc);
    }
    @RequestMapping(value="tdupdate.do")
    public void tdConfigUpdate(TdConfig tc){
        tcdao.tdConfigUpdate(tc);
    }
    @RequestMapping(value="tddelete.do")
    public void tdConfigDelete(int tc_id){
        tcdao.tdConfigDelete(tc_id);
    }
}
