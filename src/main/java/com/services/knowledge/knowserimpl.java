package com.services.knowledge;

import com.dao.knowledge.knowdao;
import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.tb_PersonInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class knowserimpl implements knowser{
    @Autowired
    private knowdao  dao;
    @Override
    public List<conferenceroom> query() {
        return dao.query();
    }

    @Override
    @Transactional
    public void delete(int a) {
        dao.delete(a);
    }

    @Override
    public void update(conferenceroom co) {
        dao.update(co);
    }

    @Override
    public void save(conferenceroom co) {
        dao.save(co);
    }

    @Override
    public List<meeting> query1(int id) {
        return dao.query1(id);
    }

    @Override
    public List<meeting> query3(int id) {
   return dao.query3(id);
    }

    @Override
    public void ch1(int id) {
        dao.ch1(id);
    }

    @Override
    public void cha(String date) {
        dao.cha(date);
    }

    @Override
    public void chb(String date) {
        dao.chb(date);
    }

    @Override
    public void chc(String date) {
       dao.chc(date);
    }

    @Override
    public void chd(String date) {
        dao.chd(date);
    }

    @Override
    public List<tb_PersonInfo> gly() {
        return dao.gly();
    }

    @Override
    public List<meeting> grhy(int id) {
        return dao.grhy(id);
    }
}
