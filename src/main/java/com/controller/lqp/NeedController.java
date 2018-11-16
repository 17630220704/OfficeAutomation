package com.controller.lqp;


import com.entity.lqp.TbRecruitmentneed;
import com.services.lqp.NeedServiceDaoImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NeedController {
    @Autowired
    private NeedServiceDaoImp needService;
    //异步增删改查开始
    //查询

    @ResponseBody
    @RequestMapping(value="/select")
    public Map<String,Object> select(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = needService.findall();
        map.put("list", list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/select2")
    public List<Map<String,Object>> select2(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list =needService.findbyname();

        return list;
    }
    @ResponseBody
    @RequestMapping(value="/insert1",method= RequestMethod.POST)
    public String insert1(TbRecruitmentneed tbRecruitmentneed){
        Map<String, Object> map = new HashMap<String, Object>();
      int a = needService.insert(tbRecruitmentneed);
    System.out.println("影响行数"+a);
        System.out.println(map);
        map.put("a", a);
        return "redirect:/select";
    }

    @ResponseBody
    @RequestMapping(value="/delete1")
    public String delete1(TbRecruitmentneed tbRecruitmentneed){
        Map<String,Object> map = new HashMap<String, Object>();
        int delete = needService.delete(tbRecruitmentneed);
        map.put("delete", delete);
        System.out.println("删除");
        return "redirect:/select";
    }
    @ResponseBody
    @RequestMapping(value="/update1")
    public String update1(TbRecruitmentneed tbRecruitmentneed){
        Map<String,Object> map = new HashMap<String, Object>();
       needService.update(tbRecruitmentneed);
        System.out.println(tbRecruitmentneed);
        return "redirect:/select";
    }
/*new*//*

    @RequestMapping("list")
    public String list(Model model, @ModelAttribute("qo") EmployeeQueryObject qo) throws  Exception{

        model.addAttribute("result", needService.query(qo));
        model.addAttribute("currentMenu", "employee");
        model.addAttribute("depts", needService.findall());

        return "list";
    }

    @RequestMapping("input")
    public String input(Long id, Model model) throws  Exception{

        if(id != null){
            model.addAttribute("entity", employeeService.get(id));
        }

        model.addAttribute("depts", departmentService.list());
        model.addAttribute("currentMenu", "employee");
        return "input";
    }

    @RequestMapping("saveOrUpdate")
    public String saveOrUpdate(Employee entity) throws  Exception{

        if(entity.getId() != null){
            employeeService.update(entity);
        }else{
            employeeService.save(entity);
        }
        return "redirect:/list.do";
    }

    @RequestMapping("delete")
    public String input(Long id) throws  Exception{
        if(id != null){
            employeeService.delete(id);
        }
        return "redirect:/list.do";
         }
*/

}
