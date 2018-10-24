package com.controller.lcy;

import com.alibaba.fastjson.JSON;
import com.entity.lcy.Email;
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

    @RequestMapping(value = "/EmailAdd", method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletResponse response, Email email) {
        response.setContentType("html/text;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        Map<String, Object> map = new HashMap<String, Object>();
        int a = mail.EmailAdd(email);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return JSON.toJSONString(map);
    }
}
