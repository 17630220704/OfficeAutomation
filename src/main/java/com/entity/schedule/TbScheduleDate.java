package com.entity.schedule;


import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;

public class TbScheduleDate {

  private long sdId;
  private String sdName;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdAmstartdate;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdAmenddate;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdPmstartdate;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdPmenddate;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdNmstartdate;
  @DateTimeFormat(pattern = "HH:mm")
  private java.sql.Time sdNmenddate;



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


  public java.sql.Time getSdAmstartdate() {
    return sdAmstartdate;
  }

  public void setSdAmstartdate(java.sql.Time sdAmstartdate) {
    this.sdAmstartdate = sdAmstartdate;
  }


  public java.sql.Time getSdAmenddate() {
    return sdAmenddate;
  }

  public void setSdAmenddate(java.sql.Time sdAmenddate) {
    this.sdAmenddate = sdAmenddate;
  }


  public java.sql.Time getSdPmstartdate() {
    return sdPmstartdate;
  }

  public void setSdPmstartdate(java.sql.Time sdPmstartdate) {
    this.sdPmstartdate = sdPmstartdate;
  }


  public java.sql.Time getSdPmenddate() {
    return sdPmenddate;
  }

  public void setSdPmenddate(java.sql.Time sdPmenddate) {
    this.sdPmenddate = sdPmenddate;
  }


  public java.sql.Time getSdNmstartdate() {
    return sdNmstartdate;
  }

  public void setSdNmstartdate(java.sql.Time sdNmstartdate) {
    this.sdNmstartdate = sdNmstartdate;
  }


  public java.sql.Time getSdNmenddate() {
    return sdNmenddate;
  }

  public void setSdNmenddate(java.sql.Time sdNmenddate) {
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
