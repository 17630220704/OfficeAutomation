package com.entity.yyl;


public class TbPayrollprocess {

  private long processId;
  private String startdate;
  private String abortdate;
  private String year;
  private String month;
  private String remark;
  private long state;
  private String operator;
  private String seet;


  public long getProcessId() {
    return processId;
  }

  public void setProcessId(long processId) {
    this.processId = processId;
  }


  public String getStartdate() {
    return startdate;
  }

  public void setStartdate(String startdate) {
    this.startdate = startdate;
  }


  public String getAbortdate() {
    return abortdate;
  }

  public void setAbortdate(String abortdate) {
    this.abortdate = abortdate;
  }


  public String getYear() {
    return year;
  }

  public void setYear(String year) {
    this.year = year;
  }


  public String getMonth() {
    return month;
  }

  public void setMonth(String month) {
    this.month = month;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public long getState() {
    return state;
  }

  public void setState(long state) {
    this.state = state;
  }


  public String getOperator() {
    return operator;
  }

  public void setOperator(String operator) {
    this.operator = operator;
  }


  public String getSeet() {
    return seet;
  }

  public void setSeet(String seet) {
    this.seet = seet;
  }

  @Override
  public String toString() {
    return "TbPayrollprocess{" +
            "processId=" + processId +
            ", startdate='" + startdate + '\'' +
            ", abortdate='" + abortdate + '\'' +
            ", year='" + year + '\'' +
            ", month='" + month + '\'' +
            ", remark='" + remark + '\'' +
            ", state=" + state +
            ", operator='" + operator + '\'' +
            ", seet='" + seet + '\'' +
            '}';
  }
}
