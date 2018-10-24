package com.services.lcy;

import com.dao.lcy.EmailDao;
import com.entity.lcy.Mailboxinfo2;
import com.services.lcy.servicesEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class servicesEmailImpl implements servicesEmail {
    @Autowired
    private EmailDao dao;

    @Override
    public int mailAdd(Mailboxinfo2 mailboxinfo2) {
        return dao.mailAdd(mailboxinfo2);
    }
}
