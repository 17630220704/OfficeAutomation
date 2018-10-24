package com.controller.lcy;

import com.alibaba.fastjson.JSON;
import com.entity.lcy.Mailboxinfo2;
import com.services.lcy.servicesEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class EmailController {
    @Autowired
    private servicesEmail mail;

    @RequestMapping(value = "/mailAdd", method = RequestMethod.POST)
    @ResponseBody
    public String mailAdd(HttpServletResponse response, Mailboxinfo2 mailboxinfo2){
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println("1111");
        System.out.println("执行"+mailboxinfo2.getPersoId());
        System.out.println("执行"+mailboxinfo2.getToId2());
        System.out.println("执行"+mailboxinfo2.getSubject());
        System.out.println("执行"+mailboxinfo2.getSize());
        System.out.println("执行"+mailboxinfo2.getContent());
        System.out.println("执行"+mailboxinfo2.getSendTime());
        System.out.println("执行"+mailboxinfo2.getAttachmentId());
        System.out.println("执行"+mailboxinfo2.getAttachmentName());



        Map<String, Object> map = new HashMap<String, Object>();
        int a = mail.mailAdd(mailboxinfo2);
        System.out.println(a);
        if (a > 0) {
            map.put("message", "发送成功");
        } else {
            map.put("message", "发送失败");
        }
        return JSON.toJSONString(map);
    }
}
