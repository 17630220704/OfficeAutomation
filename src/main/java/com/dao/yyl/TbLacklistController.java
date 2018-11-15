package com.dao.yyl;

import com.entity.yyl.TbLacklist;
import com.entity.yyl.TbPersoninfo;
import com.service.yyl.TbLacklistServiceImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/TbLacklistController")
public class TbLacklistController {
    @Resource
    private TbLacklistServiceImp tldao;
    @ResponseBody
    @RequestMapping(value="tlquery.do")
    public List<Map>  TbLacklistQuery(TbLacklist tl){
        List<Map> list = tldao.TbLacklistQuery();
        System.out.println(list);
        return list;
    }
    @RequestMapping(value="tladd.do")
    public void TbLacklistAdd(TbLacklist tl){
        tldao.TbLacklistAdd(tl);
    }
    @RequestMapping(value="tlupdate.do")
    public void TbLacklistUpdate(TbLacklist tl){
        tldao.TbLacklistUpdate(tl);
    }
    @RequestMapping(value="tlDelete.do")
    public void TbLacklistDelete(int lId){
        tldao.TbLacklistDelete(lId);
    }
}
