package com.entity.schedule;


import java.sql.Date;

public class TdSchedule {

  private long scheduleId;
  private String scheduleName;
  private String scheduleType;
  private String scheduleState;
  private Date dateStart;
  private Date dateEnd;
  private String monday;
  private String tuesday;
  private String wednesday;
  private String thursday;
  private String friday;
  private String saturday;
  private String sunday;
  private String persoId;

  public String getPersoId() {
    return persoId;
  }

  public void setPersoId(String persoId) {
    this.persoId = persoId;
  }

  public long getScheduleId() {
    return scheduleId;
  }

  public void setScheduleId(long scheduleId) {
    this.scheduleId = scheduleId;
  }

  public String getScheduleName() {
    return scheduleName;
  }

  public void setScheduleName(String scheduleName) {
    this.scheduleName = scheduleName;
  }

  public String getScheduleType() {
    return scheduleType;
  }

  public void setScheduleType(String scheduleType) {
    this.scheduleType = scheduleType;
  }

  public String getScheduleState() {
    return scheduleState;
  }

  public void setScheduleState(String scheduleState) {
    this.scheduleState = scheduleState;
  }

  public Date getDateStart() {
    return dateStart;
  }

  public void setDateStart(Date dateStart) {
    this.dateStart = dateStart;
  }

  public Date getDateEnd() {
    return dateEnd;
  }

  public void setDateEnd(Date dateEnd) {
    this.dateEnd = dateEnd;
  }

  public String getMonday() {
    return monday;
  }

  public void setMonday(String monday) {
    this.monday = monday;
  }

  public String getTuesday() {
    return tuesday;
  }

  public void setTuesday(String tuesday) {
    this.tuesday = tuesday;
  }

  public String getWednesday() {
    return wednesday;
  }

  public void setWednesday(String wednesday) {
    this.wednesday = wednesday;
  }

  public String getThursday() {
    return thursday;
  }

  public void setThursday(String thursday) {
    this.thursday = thursday;
  }

  public String getFriday() {
    return friday;
  }

  public void setFriday(String friday) {
    this.friday = friday;
  }

  public String getSaturday() {
    return saturday;
  }

  public void setSaturday(String saturday) {
    this.saturday = saturday;
  }

  public String getSunday() {
    return sunday;
  }

  public void setSunday(String sunday) {
    this.sunday = sunday;
  }

  public TdSchedule(long scheduleId, String scheduleName, String scheduleType, String scheduleState, Date dateStart, Date dateEnd, String monday, String tuesday, String wednesday, String thursday, String friday, String saturday, String sunday, String persoId) {
    this.scheduleId = scheduleId;
    this.scheduleName = scheduleName;
    this.scheduleType = scheduleType;
    this.scheduleState = scheduleState;
    this.dateStart = dateStart;
    this.dateEnd = dateEnd;
    this.monday = monday;
    this.tuesday = tuesday;
    this.wednesday = wednesday;
    this.thursday = thursday;
    this.friday = friday;
    this.saturday = saturday;
    this.sunday = sunday;
    this.persoId = persoId;
  }

  public TdSchedule() {
    super();
  }

  @Override
  public String toString() {
    return "TdSchedule{" +
            "scheduleId=" + scheduleId +
            ", scheduleName='" + scheduleName + '\'' +
            ", scheduleType='" + scheduleType + '\'' +
            ", scheduleState='" + scheduleState + '\'' +
            ", dateStart=" + dateStart +
            ", dateEnd=" + dateEnd +
            ", monday='" + monday + '\'' +
            ", tuesday='" + tuesday + '\'' +
            ", wednesday='" + wednesday + '\'' +
            ", thursday='" + thursday + '\'' +
            ", friday='" + friday + '\'' +
            ", saturday='" + saturday + '\'' +
            ", sunday='" + sunday + '\'' +
            ", persoId='" + persoId + '\'' +
            '}';
  }
}

