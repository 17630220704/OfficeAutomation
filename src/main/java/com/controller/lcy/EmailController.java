package com.controller.lcy;

import com.entity.lcy.Email;
import com.entity.lcy.Mailboxinfo2;
import com.entity.lcy.TbPersoninfo;
import com.entity.lcy.TbUser;
import com.services.lcy.servicesEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmailController {
    @Autowired
    private servicesEmail mail;

    @RequestMapping(value = "/mailAdd", method = RequestMethod.POST)
    @ResponseBody
    public Map mailAdd(HttpServletResponse response, Mailboxinfo2 mailboxinfo2) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(mailboxinfo2);
        mailboxinfo2.setSendTime(df.format(new Date()));
        Map<String, Object> map = new HashMap<String, Object>();
        int a = mail.mailAdd(mailboxinfo2);
        System.out.println("插入后主键为：" + mailboxinfo2.getBodyId());
        System.out.println(a);
        if (a > 0) {
            map.put("message", "发送成功");
        } else {
            map.put("message", "发送失败");
        }

        String toId2 = mailboxinfo2.getToId2();
        String[] sourceStrArray = toId2.split(",");
        for (int i = 0; i < sourceStrArray.length; i++) {
            System.out.println(sourceStrArray[i]);
            Email e = new Email();
            e.setEmailBoxid(1);
            e.setBodyId(mailboxinfo2.getBodyId());
            e.setPosiId(Integer.valueOf(sourceStrArray[i].toString()));
            e.setReadFlag(0);
            e.setDeleteFlag(0);
            e.setReceipt(0);
            e.setIsF(0);
            e.setIsR(0);
            e.setSign(0);
            mail.mailAdd1(e);
        }
        return map;
    }

    @RequestMapping(value = "/emailQuery")
    @ResponseBody
    public List<TbPersoninfo> emailQuery(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        List<TbPersoninfo> query = mail.emailQuery();
        //map.addAttribute("list",query);
        System.out.println(query);
        return query;
    }

    @RequestMapping(value = "/mailAddBox", method = RequestMethod.POST)
    @ResponseBody
    public Map mailAddBox(HttpServletResponse response, Mailboxinfo2 mailboxinfo2) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(mailboxinfo2);
        mailboxinfo2.setSendTime(df.format(new Date()));
        Map<String, Object> map = new HashMap<String, Object>();
        int a = mail.mailAddBox(mailboxinfo2);
        System.out.println("插入后主键为：" + mailboxinfo2.getBodyId());
        if (a > 0) {
            map.put("message", "保存成功");
        } else {
            map.put("message", "保存失败");
        }
        String toId2 = mailboxinfo2.getToId2();
        String[] sourceStrArray = toId2.split(",");
        for (int i = 0; i < sourceStrArray.length; i++) {

            Email e = new Email();
            e.setEmailBoxid(4);
            e.setBodyId(mailboxinfo2.getBodyId());
            e.setPosiId(Integer.valueOf(sourceStrArray[i].toString()));
            e.setReadFlag(0);
            e.setDeleteFlag(0);
            e.setReceipt(0);
            e.setIsF(0);
            e.setIsR(0);
            e.setSign(0);
            mail.mailAddBox1(e);
        }
        return map;
    }

    @RequestMapping(value = "/mailQuery")
    @ResponseBody
    public List<Map<String, Object>> mailQuery(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int posiId = 1;
        int emailBoxid = 1;
        List<Map<String, Object>> list = mail.mailQuery(posiId, emailBoxid);
        return list;
    }

    @RequestMapping(value = "/mailXq")
    @ResponseBody
    public List<Map> mailXq(HttpServletResponse response, int bodyId, int posiId, Email e) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        List<Email> aaaaaa = mail.app(bodyId, posiId);
        e.setEmailId(aaaaaa.get(0).getEmailId());
        e.setReadFlag(1);
        mail.mailUpdelete(e);
        System.out.println(bodyId);
        List<Map> queryQx = mail.mailXq(bodyId);
        System.out.println(queryQx);
        return queryQx;
    }

    @RequestMapping(value = "/mailUpdate")
    @ResponseBody
    public Map mailUpdate(HttpServletResponse response, Email e) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(e.getEmailId());
        e.setEmailId(e.getEmailId());
        e.setEmailBoxid(3);
        e.setDeleteFlag(1);
        int aaa = mail.mailUpdate(e);
        if (aaa > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }

        return map;
    }

    @RequestMapping(value = "/LjQuery")
    @ResponseBody
    public List<Map<String, Object>> LjQuery(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int posiId = 1;
        int emailBoxid = 3;
        List<Map<String, Object>> list = mail.LjQuery(posiId, emailBoxid);
        return list;
    }

    @RequestMapping(value = "/LjXq")
    @ResponseBody
    public List<Map> LjXq(HttpServletResponse response, int bodyId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        List<Map> queryQx = mail.LjXq(bodyId);
        return queryQx;
    }

    @RequestMapping(value = "/LjUpdate")
    @ResponseBody
    public Map LjUpdate(HttpServletResponse response, int emailId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(emailId);
        int aaa = mail.LjUpdate(emailId);
        System.out.println(aaa);
        if (aaa > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/YfsQuery")
    @ResponseBody
    public List<Map<String, Object>> YfsQuery(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int posiId = 1;
        int emailBoxid = 1;
        List<Map<String, Object>> list = mail.YfsQuery(posiId, emailBoxid);
        return list;
    }

    @RequestMapping(value = "/YfsXq")
    @ResponseBody
    public List<Map> YfsXq(HttpServletResponse response, int bodyId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        List<Map> queryQx = mail.YfsXq(bodyId);
        return queryQx;
    }

    @RequestMapping(value = "/CGQuery")
    @ResponseBody
    public List<Map<String, Object>> CGQuery(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int posiId = 1;
        int emailBoxid = 4;
        List<Map<String, Object>> list = mail.CGQuery(posiId, emailBoxid);
        return list;
    }

    @RequestMapping(value = "/CGqueryList")
    @ResponseBody
    public List<Map> CGqueryList(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int persoId = 1;
        int EmailBoxid = 4;
        int posiId = persoId;
        List<Map> list = mail.CGqueryList(persoId, EmailBoxid, posiId);
        System.out.println(list);
        return list;
    }

    @RequestMapping(value = "/CGdEdelete")
    @ResponseBody
    public Map CGdEdelete(HttpServletResponse response, int bodyId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(bodyId);
        List<Email> em = mail.CGQueryine(bodyId);
        for (int i = 0; i < em.size(); i++) {
            System.out.println(em.get(i).getEmailId());
            int emailId = (int) em.get(i).getEmailId();
            int aaa = mail.CGdEdelete(emailId);
            System.out.println(aaa);
        }
        int bbb = mail.CGdMdelete(bodyId);

        System.out.println(bbb);
        if (bbb > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/CGQueryt")
    public ModelAndView CGQueryt(HttpServletResponse response, int bodyId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        List<Map> list = mail.CGQueryt(bodyId);
        ModelAndView mod = new ModelAndView("caEmail1");
        mod.addObject("map", list);
        return mod;
    }

    @RequestMapping(value = "/CGAddUP")
    @ResponseBody
    public Map CGAddUP(HttpServletResponse response, Mailboxinfo2 mailboxinfo2) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mailboxinfo2.setSendTime(df.format(new Date()));
        int a = mail.CGAddUP(mailboxinfo2);
        List<Email> ap = mail.CGQu((int) mailboxinfo2.getBodyId());
        for (int i = 0; i < ap.size(); i++) {
            int EmailId = (int) ap.get(i).getEmailId();
            int EmailBoxid = 1;
            mail.CGUPdatee(EmailId, EmailBoxid);
        }
        if (a > 0) {
            map.put("message", "发送成功");
        } else {
            map.put("message", "发送失败");
        }
        return map;
    }

    @RequestMapping(value = "/CGAddUP1")
    @ResponseBody
    public Map CGAddUP1(HttpServletResponse response, Mailboxinfo2 mailboxinfo2) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mailboxinfo2.setSendTime(df.format(new Date()));
        int a = mail.CGAddUP1(mailboxinfo2);
        if (a > 0) {
            map.put("message", "保存成功");
        } else {
            map.put("message", "保存失败");
        }
        return map;
    }

    @RequestMapping(value = "/Tbuser")
    @ResponseBody
    public List<Map> Tbuser(HttpServletResponse response) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int persoId = 1;
        List<Map> list = mail.Tbuser(persoId);
        System.out.println(list);
        return list;
    }

    @RequestMapping(value = "/TbuserUP")
    public void TbuserUP(HttpServletResponse response, int uId, String uloginPassword) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println(uId + uloginPassword);
        mail.TbuserUP(uId, uloginPassword);
        System.out.println(uId + uloginPassword);
    }

    @RequestMapping(value = "/TbuserXq")
    @ResponseBody
    public List<Map> TbuserXq(HttpServletResponse response, int persoId) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        List<Map> list = mail.TbuserXq(persoId);
        System.out.println(list);
        return list;
    }

    @RequestMapping(value = "/Tbuserupp")
    @ResponseBody
    public Map Tbuserupp(HttpServletResponse response, TbPersoninfo td) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();

        int a = mail.Tbuserupp(td);
        if (a > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("/showData")
    public Map<String, Object> methodx(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        int persoId = 1;
        int EmailBoxid = 1;
        List<Mailboxinfo2> datas = mail.queryAllDataFromTable(page, limit, keyWord, persoId, EmailBoxid);
        int countx = mail.queryAllCount(keyWord, persoId, EmailBoxid);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/shipment")
    public Map<String, Object> shipment(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        int persoId = 1;
        List<Mailboxinfo2> datas = mail.YfsQuery(page, limit, keyWord, persoId);
        int countx = mail.YfsQueryCount(keyWord, persoId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        return map;
    }
    @ResponseBody
    @RequestMapping("/dustbin")
    public Map<String, Object> dustbin(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        int persoId = 1;
        int EmailBoxid = 3;
        List<Mailboxinfo2> datas = mail.dustbin(page, limit, keyWord, persoId, EmailBoxid);
        int countx = mail.dustbinCount(keyWord, persoId, EmailBoxid);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }
    @ResponseBody
    @RequestMapping("/rough")
    public Map<String, Object> rough(
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "15") int limit,
            String keyWord
    ) {
        int persoId = 1;
        int EmailBoxid = 4;
        List<Mailboxinfo2> datas = mail.rough(page, limit, keyWord, persoId, EmailBoxid);
        int countx = mail.roughCount(keyWord, persoId, EmailBoxid);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }
}