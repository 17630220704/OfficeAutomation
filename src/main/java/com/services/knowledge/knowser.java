package com.services.knowledge;

import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.tb_PersonInfo;

import java.util.List;

public interface knowser {
    public List<conferenceroom> query();
    public void delete(int a);
    public void update(conferenceroom co);
    public void save(conferenceroom co);
    public List<meeting> query1(int id);
    public List<meeting> query3(int id);
    public void ch1(int id);
    public void cha(String date);
    public void chb(String date);
    public void chc(String date);
    public void chd(String date);
    public List<tb_PersonInfo>  gly();
    public List<meeting> grhy(int id);
}
