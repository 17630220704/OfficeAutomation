package com.controller.adinistration;

import com.entity.adinistration.Apply;
import com.entity.adinistration.Bank;
import com.entity.adinistration.Sort;
import com.github.pagehelper.PageInfo;
import com.services.adinistration.worksurfaceServicesDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.entity.adinistration.Worksurface;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/worksurface")
public class WorksurfaceController {
    @Resource(name = "worksurfaceServicesImp")
    private worksurfaceServicesDao worksurfaceservicesdao;
    /*private  int woid;*/

    Map<String,Object> map=new HashMap<String,Object>();
    /*
     * 办公用品
     * */
    //条件查询
    @RequestMapping(value = "/query_worksurface")
    @ResponseBody
    public List<Map<String,Object>> query_worksurface(String workName){
        return worksurfaceservicesdao.query_worksurface(workName);
    }
    //查询
    @RequestMapping(value = "/query_worksurface1")
    @ResponseBody
    public List<Map<String,Object>> query_worksurface1(){
        return worksurfaceservicesdao.query_worksurface1();
    }

    //办公用品--增加
    @RequestMapping(value="/save_worksurface")
    @ResponseBody
    public Map<String,Object> save_worksurface(Worksurface worksurface){
        int a=worksurfaceservicesdao.save_worksurface(worksurface);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //办公用品--修改
    @RequestMapping(value="/update_worksurface")
    @ResponseBody
    public Map<String,Object> update_worksurface(Worksurface worksurface){
        int a=worksurfaceservicesdao.update_worksurface(worksurface);
        System.out.println(worksurface);
            if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }

        return map;
    }

    //办公用品--删除
    @RequestMapping(value="/delete_worksurface")
    @ResponseBody
    public Map<String,Object> delete_worksurface(Worksurface worksurface){
        int a=worksurfaceservicesdao.delete_worksurface(worksurface);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //条件查询
   /* @RequestMapping(value = "/query1")
    @ResponseBody
    public List<Worksurface> query1(String workName){
        return worksurfaceservicesdao.query1(workName);
    }*/
    //分页
   /* @ResponseBody
    @RequestMapping(value="/queryPage")
    public PageInfo<Map> queryPage(Integer pageNum){
        return worksurfaceservicesdao.queryPage(pageNum);
    }*/
    /*
     * 办公用品类别
     * */
    //办公用品类别..条件查询
    @RequestMapping(value = "/query_sort")
    @ResponseBody
    public List<Map<String,Object>> query_sort(String sortStyle){
        return worksurfaceservicesdao.query_sort(sortStyle);
    }
    //办公用品类别..删除
    @RequestMapping(value = "/delete_sort")
    @ResponseBody
    public Map<String,Object> delete_sort(Sort s){
        /*System.out.println("jinijnijinnk");*/
        int a=worksurfaceservicesdao.delete_sort(s);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }

    //办公用品类别..增加
    @RequestMapping(value="/save_sort")
    @ResponseBody
    public Map<String,Object> save_sort(Sort s){
        int a=worksurfaceservicesdao.save_sort(s);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //办公用品类别..修改
    @RequestMapping(value="/update_sort")
    @ResponseBody
    public Map<String,Object> update_sort(Sort s){
        int a=worksurfaceservicesdao.update_sort(s);
        System.out.println(s);
        if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }

    /*
    * 办公用品库
    * */
    //办公用品库查询(类型用)
    @RequestMapping(value = "/query_bank")
    @ResponseBody
    public List<Map<String,Object>> query_bank(){
        return worksurfaceservicesdao.query_bank();
    }

    //办公用品库查询
    @RequestMapping(value = "/query_bank1")
    @ResponseBody
    public List<Map<String,Object>> query_bank1(String bBankname){
        return worksurfaceservicesdao.query_bank1(bBankname);
    }

    //办公用品库..删除
    @RequestMapping(value = "/delete_bank")
    @ResponseBody
    public Map<String,Object> delete_bank(Bank b){
        int a=worksurfaceservicesdao.delete_bank(b);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //职员--查询(库用)
    @RequestMapping(value = "/query_tbPersoninfo")
    @ResponseBody
    public List<Map<String,Object>> query_tbPersoninfo(){
        return worksurfaceservicesdao.query_tbPersoninfo();
    }

    //办公用品库..增加
    @RequestMapping(value="/save_bank")
    @ResponseBody
    public Map<String,Object> save_bank(Bank b){
        int a=worksurfaceservicesdao.save_bank(b);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //办公用品库..修改
    @RequestMapping(value="/update_bank")
    @ResponseBody
    public Map<String,Object> update_bank(Bank b){
        System.out.println(b);
        int a=worksurfaceservicesdao.update_bank(b);
        if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }

        return map;
    }


    //申请用品--记录
    //用品申请--查询
    @RequestMapping(value = "/query_apply")
    @ResponseBody
    public List<Map<String,Object>> query_apply(){
        System.out.println("ssss");
        return worksurfaceservicesdao.query_apply();
    }
    //根据状态查询
    @RequestMapping(value = "/query_apply1")
    @ResponseBody
    public List<Map<String,Object>> query_apply1(){
        return worksurfaceservicesdao.query_apply1();
    }
    //用品申请--增加
    @RequestMapping(value="/save_apply")
    @ResponseBody
    public Map<String,Object> save_apply(Apply ap){
        //获取系统当前时间
        Date date=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String day=df.format(date);
        ap.setApplyTime(day);

        int a=worksurfaceservicesdao.save_apply(ap);
        /*System.out.println(a);*/
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //用品申请--删除
    @RequestMapping(value = "/delete_apply")
    @ResponseBody
    public Map<String,Object> delete_apply(Apply ap){
        int a=worksurfaceservicesdao.delete_apply(ap);
        if (a>0) {
            map.put("message","执行成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }

    //申请--修改
    @RequestMapping(value="/update_apply")
    @ResponseBody
    public Map<String,Object> update_apply(Apply ap){
        System.out.println(ap);
        int a=worksurfaceservicesdao.update_apply(ap);
        if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }
    //库存修改
    @RequestMapping(value="/update_kucun")
    @ResponseBody
    public Map<String,Object> update_kucun(int applyId){
        /*System.out.println(workId+workRepertory);*/
        System.out.println(applyId);
        int a=worksurfaceservicesdao.update_kucun(applyId);
        if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }

    /*
    * 修改状态(1)
    * */
/* @RequestMapping(value="/updateState")
 @ResponseBody
 public Map<String,Object> updateState(Apply ap){
     int a=worksurfaceservicesdao.updateState(ap);
     if (a>0) {
         map.put("message","修改成功");
     } else {
         map.put("message","执行失败");
     }
     return map;
 }*/
 //修改状态(2)
    @RequestMapping(value="/updateStat")
    @ResponseBody
    public Map<String,Object> updateStat(Apply ap){
        int a=worksurfaceservicesdao.updateStat(ap);
        if (a>0) {
            map.put("message","修改成功");
        } else {
            map.put("message","执行失败");
        }
        return map;
    }






    /*
    * 分页模糊查询
    * */
    /*@RequestMapping("/pageWorksurface.do")
    @ResponseBody
    public Map pageWorksurface(@RequestParam(required = false, defaultValue = "1") int page,
                                              @RequestParam(required = false, defaultValue = "10") int limit, String name){
        Page<Map<String,Object>> pages=PageHelper.startPage(page,limit);
        List<Map<String,Object>> list=worksurfaceservicesdao.pageWorksurface(name);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        *//*System.out.println(map);*//*
        return map;

    }*/

}
