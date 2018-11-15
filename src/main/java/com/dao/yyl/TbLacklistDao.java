package com.dao.yyl;

import com.entity.yyl.TbLacklist;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface TbLacklistDao {
    List<Map> TbLacklistQuery();
    void TbLacklistUpdate(TbLacklist tl);
    void TbLacklistAdd(TbLacklist tl);
    void TbLacklistDelete(Integer lId);
}
