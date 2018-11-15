package com.dao.yyl;

import com.entity.yyl.TdTransfer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TdTransferDao {
    List<Map> TdTransferQuery(TdTransfer tt);
    void TdTransferAdd(TdTransfer tt);
    void TdTransferUpdate(TdTransfer tt);
    void TdTransferDatity(TdTransfer tt);
}
