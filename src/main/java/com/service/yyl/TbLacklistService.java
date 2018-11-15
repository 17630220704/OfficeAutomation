package com.service.yyl;

import com.entity.yyl.TbLacklist;
import com.entity.yyl.TbPersoninfo;

import java.util.List;
import java.util.Map;

public interface TbLacklistService {
    List<Map> TbLacklistQuery();
    void TbLacklistUpdate(TbLacklist tl);
    void TbLacklistAdd(TbLacklist tl);
    void TbLacklistDelete(Integer lId);
}
