package com.dao.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.tb_PersonInfo;


import java.util.List;
public interface knowdao {
    List<conferenceroom> query();
    void delete(int a);
    void update(conferenceroom co);
    void save(conferenceroom co);
    List<meeting> query1(int id);
    List<meeting> query3(int id);
    void ch1(int id);
    void cha(String date);
    void chb(String date);
    void chc(String date);
    void chd(String date);
    List<tb_PersonInfo>  gly();
    List<meeting> grhy(int id);
    List<meeting> query11(meeting me);


}
