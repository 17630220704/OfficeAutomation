package com.controller.lqp;


import com.services.lqp.NeedfeneImp;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NeedfenyeController {
    @Resource(name = "needfeneImp")
    private NeedfeneImp needfeneImp;

    public NeedfeneImp getNeedfeneImp() {
        return needfeneImp;
    }

    public void setNeedfeneImp(NeedfeneImp needfeneImp) {
        this.needfeneImp = needfeneImp;
    }

    @ResponseBody
    @RequestMapping("/showDataneed")
    public Map<String,Object> methodxTbRecruitmentneed(
            @RequestParam(required=false,defaultValue="1") int pageneed,
            @RequestParam(required=false,defaultValue="15") int limitneed,
            String keyWordneed
    ){
        List<Map> datasneed=needfeneImp.queryAlltbRecruitmentneed(pageneed, limitneed, keyWordneed);
        int countxneed=needfeneImp.queryAlltbRecruitmentneedCount(keyWordneed);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("countneed",countxneed);
        map.put("dataneed",datasneed);
        System.out.println(map.toString());
        return map;
    }

}
