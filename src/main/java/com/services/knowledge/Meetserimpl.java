package com.services.knowledge;

import com.dao.knowledge.Meetdao;
import com.entity.knowledge.conferenceroom;
import com.entity.knowledge.meeting;
import com.entity.knowledge.time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class Meetserimpl implements meetser {
    @Autowired
    private Meetdao dao;
    @Override
    public List<conferenceroom> query() {
        return dao.query();
    }

    @Override
    public void save(meeting me) {
        dao.save(me);
    }

    @Override
    public List<meeting> query1( int id) {
        return dao.query1(id);
    }

    @Override
    public List<meeting> query2(int a) {
        return dao.query2(a);
    }

    @Override
    public List<time> query3(time ti) {
        return dao.query3(ti);
    }

    @Override
    public void save1(time ti) {
        dao.save1(ti);
    }

    @Override
    public List<time> querytimorning( time ti) {
        return dao.querytimorning(ti);
    }

    @Override
    public List<time> querytiupper(time ti) {
        return dao.querytiupper(ti);
    }

    @Override
    public List<time> querytilower(time ti) {
        return dao.querytilower(ti);
    }

    @Override
    public List<time> querytinight(time ti) {
        return dao.querytinight(ti);
    }

    @Override
    public List<meeting> query4(int id) {
        return dao.query4(id);
    }

    @Override
    public void updatetimorning(int tiid) {
        dao.updatetimorning(tiid);
    }

    @Override
    public void updatetiupper(int tiid) {
        dao.updatetiupper(tiid);
    }

    @Override
    public void updatetilower(int tiid) {
       dao.updatetilower(tiid);
    }

    @Override
    public void updatetinight(int tiid) {
        dao.updatetinight(tiid);
    }

    @Override
    public void updateid(int meid) {
        dao.updateid(meid);
    }

    @Override
    public void updateth(int meid) {
        dao.updateth(meid);
    }

    @Override
    public List<meeting> query5() {
        return dao.query5();
    }

    @Override
    public List<meeting> queryme1(String lx) {
        return dao.queryme1(lx);
    }

    @Override
    public List<meeting> queryme2(meeting me) {
        return dao.queryme2(me);
    }

    @Override
    public List<meeting> queryme3(String name) {
        return dao.queryme3(name);
    }

    @Override
    public void updatestate() {
        dao.updatestate();
    }

    @Override
    public void updatebz(meeting me) {
        dao.updatebz(me);
    }
}
