package com.dao.lcy;

import com.entity.lcy.Email;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailDao {
    public int EmailAdd(Email email);
}
