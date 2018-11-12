package com.dao.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.time;

import java.util.List;

public interface Meetdao {
    public List<conferenceroom> query();
    public void save(meeting me);
    public List<meeting> query1(int id);
    public List<meeting> query2(int a);
    public List<time> query3(time ti);
    public void save1(time ti);
    public List<time> querytimorning(time ti);
    public List<time> querytiupper(time ti);
    public List<time> querytilower(time ti);
    public List<time> querytinight(time ti);
    public List<meeting> query4(int id);
    public void updatetimorning(int tiid);
    public void updatetiupper(int tiid);
    public void updatetilower(int tiid);
    public void updatetinight(int tiid);
    public void updateid(int meid);
    public void updateth(int meid);
    public List<meeting> query5();
    public List<meeting> queryme1(String lx);
    public List<meeting> queryme2(meeting me);
    public List<meeting> queryme3(String name);
    public void updatestate();
    public void updatebz(meeting  me);
}
