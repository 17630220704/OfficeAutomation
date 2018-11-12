package com.entity.knowledge;

import java.util.List;

public class conferenceroom {
    private int coid;
    private  String coname;
    private tb_PersonInfo tb_personInfo;

    public tb_PersonInfo getTb_personInfo() {
        return tb_personInfo;
    }

    public void setTb_personInfo(tb_PersonInfo tb_personInfo) {
        this.tb_personInfo = tb_personInfo;
    }

    private String costate;

    public String getCostate() {
        return costate;
    }

    public void setCostate(String costate) {
        this.costate = costate;
    }

    public String getCovalue() {
        return covalue;
    }

    public void setCovalue(String covalue) {
        this.covalue = covalue;
    }

    private String covalue;
    private List<meeting> meeting;
    private List<time> time;

    public List<com.entity.knowledge.meeting> getMeeting() {
        return meeting;
    }

    public void setMeeting(List<com.entity.knowledge.meeting> meeting) {
        this.meeting = meeting;
    }

    public List<com.entity.knowledge.time> getTime() {
        return time;
    }

    public void setTime(List<com.entity.knowledge.time> time) {
        this.time = time;
    }

    public int getCoid() {
        return coid;
    }

    public void setCoid(int coid) {
        this.coid = coid;
    }

    public String getConame() {
        return coname;
    }

    public void setConame(String coname) {
        this.coname = coname;
    }
}
