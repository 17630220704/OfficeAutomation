package com.entity.knowledge;

import java.util.Date;

public class meeting {
    private int meid;
    private String mename;

    public String getMedate() {
        return medate;
    }

    public void setMedate(String medate) {
        this.medate = medate;
    }

    private String mevalue;
    private int menumber;
    private String medate;
    private String mestate;
    private String meremarks;

    public String getMeremarks() {
        return meremarks;
    }

    public void setMeremarks(String meremarks) {
        this.meremarks = meremarks;
    }

    public com.entity.knowledge.conferenceroom getConferenceroom() {
        return conferenceroom;
    }

    public void setConferenceroom(com.entity.knowledge.conferenceroom conferenceroom) {
        this.conferenceroom = conferenceroom;
    }

    private conferenceroom conferenceroom;
    private tb_PersonInfo tb_PersonInfo;

    public String getMetime() {
        return metime;
    }

    public void setMetime(String metime) {
        this.metime = metime;
    }

    private String metime;
    public int getMeid() {
        return meid;
    }

    public com.entity.knowledge.tb_PersonInfo getTb_PersonInfo() {
        return tb_PersonInfo;
    }

    public void setTb_PersonInfo(com.entity.knowledge.tb_PersonInfo tb_PersonInfo) {
        this.tb_PersonInfo = tb_PersonInfo;
    }

    public void setMeid(int meid) {
        this.meid = meid;
    }

    public String getMename() {
        return mename;
    }

    public void setMename(String mename) {
        this.mename = mename;
    }

    public String getMevalue() {
        return mevalue;
    }

    public void setMevalue(String mevalue) {
        this.mevalue = mevalue;
    }

    public int getMenumber() {
        return menumber;
    }

    public void setMenumber(int menumber) {
        this.menumber = menumber;
    }



    public String getMestate() {
        return mestate;
    }

    public void setMestate(String mestate) {
        this.mestate = mestate;
    }
}
