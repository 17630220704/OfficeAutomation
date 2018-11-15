package com.dao.yyl;

import com.entity.yyl.TbLacklist;
import com.entity.yyl.TbPersoninfo;
import com.service.yyl.TbLacklistServiceImp;
import com.service.yyl.TbPersoninfoServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbPersoninfoController")
public class TbPersoninfoController {
    @Resource
    private TbPersoninfoServiceImp tpdao;
    @Resource
    private TbLacklistServiceImp tldao;
    @ResponseBody
    @RequestMapping(value="tpquery.do")
    public List<Map>  TbPersoninfoQuery(TbPersoninfo tp){
        List<Map> list = tpdao.TbPersoninfoQuery(tp);
        return list;
    }
    @RequestMapping(value="tpadd.do")
    public void TbPersoninfoAdd(TbPersoninfo tp){
        tpdao.TbPersoninfoAdd(tp);
    }
    @RequestMapping(value="tpupdate.do")
    public void TbPersoninfoUpdate(TbPersoninfo tp, TbLacklist tl){
        if (tl.getUId() !=0 ){
            tldao.TbLacklistAdd(tl);
        }
        System.out.println(tp);
        tpdao.TbPersoninfoUpdate(tp);
    }
    @RequestMapping(value="tpupdate2.do")
    public void TbPersoninfoUpdate2(TbPersoninfo tp, int lId){
        tldao.TbLacklistDelete(lId);
        System.out.println(tp);
        tpdao.TbPersoninfoUpdate(tp);
    }
}
