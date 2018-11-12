package com.controller.lqp;


import com.entity.lqp.TbHirefile;
import com.entity.lqp.TbRecruitmentneed;
import com.github.pagehelper.PageInfo;
import com.services.lqp.TbHirefileServiceDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/hire")
public class TbHirefileController {
    @Resource(name = "tbHirefileServiceDaoImp")
    private TbHirefileServiceDao service;
/*人事档案*/
@ResponseBody
@RequestMapping(value = "/selectTbHirefile")
   public Map<String,Object> TbHirefileSelect(){
       Map<String,Object> map = new HashMap<String,Object>();
      List list =service.findbyhire();
       map.put("list",list);
       return map;
   }
    @ResponseBody
    @RequestMapping(value="/save")
    public Map<String, Object> savebyhire(TbHirefile tbHirefile){
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.savebyhire(tbHirefile);
        System.out.println("影响行数"+a);
        map.put("a", a);
        return  map;
    }
    /* @RequestMapping("/findByName")
    public String findByName(
       @RequestParam(defaultValue="1") Integer currentPage,
       HttpServletRequest request, Map<String,Object> map) {
        String username=request.getParameter("search");
        System.out.println(username);
        PageHelper.startPage(currentPage,8);
        List<TbHirefile> list=userService.findByName(username);
        PageInfo<TbHirefile> pageInfo=new PageInfo<TbHirefile>(list,8);
        map.put("pageInfo", pageInfo);
        return "userinfo";
    }*/
    @ResponseBody
    @RequestMapping(value="/findByName")
    public Map<String,Object> findbyname(String  empName){
        Map<String, Object> map = new HashMap<String, Object>();
        List<TbHirefile> list =service.findbyName(empName);
        map.put("list",list);
        return map;


    }

/*    招聘需求*/
@ResponseBody
@RequestMapping(value = "/selectTbRecruitmentneed")
public Map<String,Object> TbRecruitmentneed(){
    Map<String,Object> map = new HashMap<String,Object>();
    List list =service.findbyneed();
    map.put("list",list);
    return map;
}
@ResponseBody
@RequestMapping(value = "/saveTbRecruitmentneed")
public Map<String,Object> savebyneed(TbRecruitmentneed tbRecruitmentneed){
    Map<String,Object> map = new HashMap<String, Object>();
   int a= service.savebyneed(tbRecruitmentneed);
    System.out.println(a);
   map.put("a",a);
   return  map;
}
   /* 招聘计划*/
   @ResponseBody
   @RequestMapping(value = "/selectTbRecruitmentplan")
   public Map<String,Object> TbRecruitmentplan(){
       Map<String,Object> map = new HashMap<String,Object>();
       List list =service.findbyplan();
       map.put("list",list);
       return map;
   }
  /*  招聘录用*/
  @ResponseBody
  @RequestMapping(value = "/selectTbRecruitmentemployed")
  public Map<String,Object> TbRecruitmentemployed(){
      Map<String,Object> map = new HashMap<String,Object>();
      List list =service.findbyemploy();
      map.put("list",list);
      return map;
  }
  /*分页*/
  @RequestMapping(value="/user/list",method= RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findAllByPage(int page,int pageSize){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<TbHirefile> pager = service.findUserByPage(page,pageSize);
		//总条数
		resultMap.put("total", pager.getTotal());
		//获取每页数据
		resultMap.put("rows", pager.getList());
		return resultMap;

	}
}
