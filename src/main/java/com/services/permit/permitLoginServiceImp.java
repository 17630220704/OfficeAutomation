package com.services.permit;

import com.dao.permit.permitLogin;
import com.entity.permit.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service("permitLoginServiceImp")
public class permitLoginServiceImp implements permitLoginService {

    @Autowired
    private permitLogin permitLogindao;

    @Override
    public int getlogin(TbUser tbUser) {
/**
 * @param loginresult 登陆结果
 * */
        int loginresult = 0;//登陆结果
        int lackresult = 0;
        int userid = 0;
        //登陆验证
        List<Map> loginlist =  permitLogindao.getlogin(tbUser);
        loginresult = loginlist.size();
        userid = Integer.parseInt(loginlist.get(0).get("u_id").toString());
       //黑名单查询
        List<Map> Lacklist =  permitLogindao.LoginLacklist(userid);
        lackresult = Lacklist.size();
        if (loginresult>0 && lackresult<=0 ){
            return 0;
        }else if(lackresult>0) {
            return 0;
        }else {
            return 0;
        }
    }

}
