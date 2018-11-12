package com.entity.knowledge;

import java.util.Date;

public class time {
    private int tiid;
    private String timorning;
    private String tiupper;
    private String tilower;
    private String tinight;
    private conferenceroom conferenceroom;

    public com.entity.knowledge.conferenceroom getConferenceroom() {
        return conferenceroom;
    }

    public void setConferenceroom(com.entity.knowledge.conferenceroom conferenceroom) {
        this.conferenceroom = conferenceroom;
    }

    public int getTiid() {
        return tiid;
    }

    public void setTiid(int tiid) {
        this.tiid = tiid;
    }

    public String getTimorning() {
        return timorning;
    }

    public void setTimorning(String timorning) {
        this.timorning = timorning;
    }

    public String getTiupper() {
        return tiupper;
    }

    public void setTiupper(String tiupper) {
        this.tiupper = tiupper;
    }

    public String getTilower() {
        return tilower;
    }

    public void setTilower(String tilower) {
        this.tilower = tilower;
    }

    public String getTinight() {
        return tinight;
    }

    public void setTinight(String tinight) {
        this.tinight = tinight;
    }


    private String tidate;

    public String getTidate() {
        return tidate;
    }

    public void setTidate(String tidate) {
        this.tidate = tidate;
    }
}
