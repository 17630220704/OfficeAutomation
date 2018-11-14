package com.services.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.time;

import java.util.List;

public interface meetser {
    List<conferenceroom> query();
    void save(meeting me);
    List<meeting> query1(int id);
    List<meeting> query2(int a);
    List<time> query3(time ti);
    void save1(time ti);
    List<time> querytimorning(time ti);
    List<time> querytiupper(time ti);
    List<time> querytilower(time ti);
    List<time> querytinight(time ti);
    List<meeting> query4(int id);
    void updatetimorning(int tiid);
    void updatetiupper(int tiid);
    void updatetilower(int tisid);
    void updatetinight(int tiid);
    void updateid(int meid);
    void updateth(int meid);
    List<meeting> query5();
    List<meeting> queryme1(String lx);
    List<meeting> queryme2(meeting me);
    List<meeting> queryme3(String name);
    void updatestate();
    void updatebz(meeting me);
}
