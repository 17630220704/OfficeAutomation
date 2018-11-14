package com.entity.schedule;


import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;

public class TbScheduleDate {

  private long sdId;
  private String sdName;
  private Time sdAmstartdate;
  private Time sdAmenddate;
  private Time sdPmstartdate;
  private Time sdPmenddate;
  private Time sdNmstartdate;
  private Time sdNmenddate;



  public long getSdId() {
    return sdId;
  }

  public void setSdId(long sdId) {
    this.sdId = sdId;
  }


  public String getSdName() {
    return sdName;
  }

  public void setSdName(String sdName) {
    this.sdName = sdName;
  }


  public Time getSdAmstartdate() {
    return sdAmstartdate;
  }

  public void setSdAmstartdate(Time sdAmstartdate) {
    this.sdAmstartdate = sdAmstartdate;
  }


  public Time getSdAmenddate() {
    return sdAmenddate;
  }

  public void setSdAmenddate(Time sdAmenddate) {
    this.sdAmenddate = sdAmenddate;
  }


  public Time getSdPmstartdate() {
    return sdPmstartdate;
  }

  public void setSdPmstartdate(Time sdPmstartdate) {
    this.sdPmstartdate = sdPmstartdate;
  }


  public Time getSdPmenddate() {
    return sdPmenddate;
  }

  public void setSdPmenddate(Time sdPmenddate) {
    this.sdPmenddate = sdPmenddate;
  }


  public Time getSdNmstartdate() {
    return sdNmstartdate;
  }

  public void setSdNmstartdate(Time sdNmstartdate) {
    this.sdNmstartdate = sdNmstartdate;
  }


  public Time getSdNmenddate() {
    return sdNmenddate;
  }

  public void setSdNmenddate(Time sdNmenddate) {
    this.sdNmenddate = sdNmenddate;
  }

  public TbScheduleDate(long sdId, String sdName, Time sdAmstartdate, Time sdAmenddate, Time sdPmstartdate, Time sdPmenddate, Time sdNmstartdate, Time sdNmenddate) {
    this.sdId = sdId;
    this.sdName = sdName;
    this.sdAmstartdate = sdAmstartdate;
    this.sdAmenddate = sdAmenddate;
    this.sdPmstartdate = sdPmstartdate;
    this.sdPmenddate = sdPmenddate;
    this.sdNmstartdate = sdNmstartdate;
    this.sdNmenddate = sdNmenddate;
  }

  @Override
  public String toString() {
    return "TbScheduleDate{" +
            "sdId=" + sdId +
            ", sdName='" + sdName + '\'' +
            ", sdAmstartdate=" + sdAmstartdate +
            ", sdAmenddate=" + sdAmenddate +
            ", sdPmstartdate=" + sdPmstartdate +
            ", sdPmenddate=" + sdPmenddate +
            ", sdNmstartdate=" + sdNmstartdate +
            ", sdNmenddate=" + sdNmenddate +
            '}';
  }

  public TbScheduleDate() {
    super();
  }
}
