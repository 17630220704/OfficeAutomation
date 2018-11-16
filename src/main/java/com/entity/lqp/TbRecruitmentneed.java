package com.entity.lqp;


public class TbRecruitmentneed {

  private long needId;
  private long deptId;
  private String jods;
  private java.sql.Date needDate;
  private long needNumber;
  private String needRequirements;
  private String remind;
  private String remark;


  public long getNeedId() {
    return needId;
  }

  public void setNeedId(long needId) {
    this.needId = needId;
  }


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public String getJods() {
    return jods;
  }

  public void setJods(String jods) {
    this.jods = jods;
  }


  public java.sql.Date getNeedDate() {
    return needDate;
  }

  public void setNeedDate(java.sql.Date needDate) {
    this.needDate = needDate;
  }


  public long getNeedNumber() {
    return needNumber;
  }

  public void setNeedNumber(long needNumber) {
    this.needNumber = needNumber;
  }


  public String getNeedRequirements() {
    return needRequirements;
  }

  public void setNeedRequirements(String needRequirements) {
    this.needRequirements = needRequirements;
  }


  public String getRemind() {
    return remind;
  }

  public void setRemind(String remind) {
    this.remind = remind;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
