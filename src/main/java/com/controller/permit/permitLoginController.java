package com.controller.permit;

import com.entity.permit.TbUser;
import com.services.permit.permitLoginService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("singleton")
public class permitLoginController {

    @Resource(name="permitLoginServiceImp")
    private permitLoginService permitLoginServicedao;
    private long userid=0;

    @ResponseBody
    @RequestMapping(value = "/permitLogin.do")
    public Map permitLogin(TbUser user){            //登陆
        Map<String,Object> map = new HashMap<String,Object>();
        userid = user.getUId();
        int login_result = 3;
        login_result = permitLoginServicedao.getlogin(user);
        map.put("result",login_result);
        return map;
    }
    public Map permitgetTree(){          //获取一级菜单
        System.out.println("userid:   "+userid);
        Map<String,Object> map = new HashMap<>();
        map= permitLoginServicedao.getTree(userid);
        System.out.println("菜单："+map);
        return map;
    };

    /*Get&Set*/
    public permitLoginService getPermitLoginServicedao() {
        return permitLoginServicedao;
    }

    public void setPermitLoginServicedao(permitLoginService permitLoginServicedao) {
        this.permitLoginServicedao = permitLoginServicedao;
    }
}
