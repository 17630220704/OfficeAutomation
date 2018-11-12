package com.service.yyl;

import com.entity.yyl.TbPersoninfo;
import com.entity.yyl.TdTransfer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface TdTransferService {
    List<Map> TdTransferQuery(TdTransfer tt);
    void TdTransferAdd(TdTransfer tt, TbPersoninfo tp);
    void TdTransferUpdate(TdTransfer tt);
    void TdTransferDatity(TdTransfer tt);
}
