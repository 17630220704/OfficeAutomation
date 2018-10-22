package com.controller.permit;

import com.entity.permit.TbUser;
import com.services.permit.permitLoginService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@Scope("singleton")
public class permitLoginController {

    @Resource(name="permitLoginServiceImp")
    private permitLoginService permitLoginServicedao;

    @ResponseBody
    @RequestMapping(value = "/permitLogin.do")
    public Map permitLogin(TbUser user){
        Map<String,Object> map = new HashMap<String,Object>();
        int login_result = 3;
        login_result = permitLoginServicedao.getlogin(user);
        System.out.println("控制器:"+login_result);
            map.put("result",login_result);
        return map;
    }

    /*Get&Set*/
    public permitLoginService getPermitLoginServicedao() {
        return permitLoginServicedao;
    }

    public void setPermitLoginServicedao(permitLoginService permitLoginServicedao) {
        this.permitLoginServicedao = permitLoginServicedao;
    }
}
