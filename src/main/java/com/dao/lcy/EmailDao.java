package com.dao.lcy;

import com.entity.lcy.Mailboxinfo2;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailDao {
    public int mailAdd(Mailboxinfo2 mailboxinfo2);
}
