package com.services.lcy;

import com.dao.lcy.EmailDao;
import com.entity.lcy.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class servicesEmailImpl implements servicesEmail{
     @Autowired
     private EmailDao dao;
    @Override
    public int EmailAdd(Email email) {

        return dao.EmailAdd(email);
    }
}
