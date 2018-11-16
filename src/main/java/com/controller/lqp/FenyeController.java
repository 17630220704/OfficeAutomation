package com.controller.lqp;


import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbPersoninfo;
import com.entity.lqp.TbRecruitmentneed;
import com.entity.lqp.TbRecruitmentplan;
import com.services.lqp.FenyeServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/fenye")
public class FenyeController {
        @Autowired
        private FenyeServiceImp fenyeServiceImp;

    @ResponseBody
        @RequestMapping(value = "/showData")
        public Map<String,Object> methodx(
                @RequestParam(required=false,defaultValue="1") int page,
                @RequestParam(required=false,defaultValue="15") int limit,
                String keyWord
        ){
            List<TbHirefile> datas=fenyeServiceImp.queryAllDataFromTable(page,limit,keyWord);
            int countx=  fenyeServiceImp.queryAllCount(keyWord);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("code",0);
            map.put("msg","");
            map.put("count",countx);
            map.put("data",datas);
            System.out.println(map.toString());
            return map;
        }
       /* plan*/
       @ResponseBody
       @RequestMapping(value = "/showDataplan")
       public Map<String,Object> methodx1(
               @RequestParam(required=false,defaultValue="1") int page,
               @RequestParam(required=false,defaultValue="15") int limit,
               String keyWord2
       ){
           List<Map> datas1=fenyeServiceImp.queryAllplan(page, limit, keyWord2);
           int countx1=  fenyeServiceImp.queryplanCount(keyWord2);
           Map<String,Object> map=new HashMap<String,Object>();
           map.put("code",0);
           map.put("msg","");
           map.put("count",countx1);
           map.put("data",datas1);
           System.out.println(map.toString());
           return map;
       }
      /* need*/
      @ResponseBody
      @RequestMapping(value = "/showneedData")
      public Map<String,Object> methodx2(
              @RequestParam(required=false,defaultValue="1") int page,
              @RequestParam(required=false,defaultValue="15") int limit,
              String keyWord3
      ){
          List<Map> datas2=fenyeServiceImp.queryAllneed(page, limit, keyWord3);
          int countx2=  fenyeServiceImp.queryneedCount(keyWord3);
          Map<String,Object> map=new HashMap<String,Object>();
          map.put("code",0);
          map.put("msg","");
          map.put("count",countx2);
          map.put("data",datas2);
          System.out.println(map.toString());
          return map;
      }
     /* info*/
     @ResponseBody
     @RequestMapping(value = "/showDatainfo")
     public Map<String,Object> methodx3(
             @RequestParam(required=false,defaultValue="1") int page,
             @RequestParam(required=false,defaultValue="15") int limit,
             String keyWord1
     ){
         List<Map> datas3=fenyeServiceImp.queryAllinfo(page, limit, keyWord1);
         int countx3=  fenyeServiceImp.queryinfoCount(keyWord1);
         Map<String,Object> map=new HashMap<String,Object>();
         map.put("code",0);
         map.put("msg","");
         map.put("count",countx3);
         map.put("data",datas3);
         System.out.println(map.toString());
         return map;
     }


}
