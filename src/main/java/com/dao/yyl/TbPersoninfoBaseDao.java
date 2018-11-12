package com.dao.yyl;

import com.entity.yyl.TbPersoninfoBase;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbPersoninfoBaseDao {
    List<Map> TbPersoninfoBaseQuery(TbPersoninfoBase tpb);
    List<Map> TbPersoninfoBaseQuery1(String persoId);
    void TbPersoninfoBaseAdd(TbPersoninfoBase tpb);
    void TbPersoninfoBaseUpdate(TbPersoninfoBase tpb);
    void TbPersoninfoBaseUpdateBatch(TbPersoninfoBase tpb);
    void TbPersoninfoBaseDelete(TbPersoninfoBase tpb);
}
