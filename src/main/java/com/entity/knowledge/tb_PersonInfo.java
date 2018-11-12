package com.entity.knowledge;

import java.util.List;

public class tb_PersonInfo {
    private int persoId;
    private String  PersonName;
    private List<meeting> meeting;
    private  List<conferenceroom> conferencerooms;

    public List<com.entity.knowledge.meeting> getMeeting() {
        return meeting;
    }

    public List<conferenceroom> getConferencerooms() {
        return conferencerooms;
    }

    public void setConferencerooms(List<conferenceroom> conferencerooms) {
        this.conferencerooms = conferencerooms;
    }

    public void setMeeting(List<com.entity.knowledge.meeting> meeting) {
        this.meeting = meeting;
    }

    public int getPersoId() {
        return persoId;
    }

    public void setPersoId(int persoId) {
        this.persoId = persoId;
    }

    public String getPersonName() {
        return PersonName;
    }

    public void setPersonName(String personName) {
        PersonName = personName;
    }


}
