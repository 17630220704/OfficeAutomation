package com.services.permit;

import com.dao.permit.scheduleManage;
import com.entity.schedule.TbScheduleDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("scheduleManageServiceImp")
public class scheduleManageServiceImp implements scheduleManageService {

    @Autowired
    private scheduleManage scheduleManagedao;

    @Override
    public List<Map<String, Object>> listschedule() {
        return null;
    }

    @Override
    public List<Map<String, Object>> listscheduledate() {
        List<Map<String,Object>> list = scheduleManagedao.listscheduledate();
        return list;
    }

    @Override
    public boolean savescheduledate(TbScheduleDate tbsd) {
        Integer result = scheduleManagedao.savescheduledate(tbsd);
        if (result==1){
            return true;
        }
        if (result==null){
            return false;
        }
        return false;
    }
}
