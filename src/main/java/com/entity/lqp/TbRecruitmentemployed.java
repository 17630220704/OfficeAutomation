package com.entity.lqp;


public class TbRecruitmentemployed {

  private long employedId;
  private long planId;
  private long deptId;
  private String headid;
  private java.sql.Date hireDate;
  private java.sql.Date workEndTime;
  private java.sql.Date officialSalary;
  private String shaixuan;
  private String remark;


  public long getEmployedId() {
    return employedId;
  }

  public void setEmployedId(long employedId) {
    this.employedId = employedId;
  }


  public long getPlanId() {
    return planId;
  }

  public void setPlanId(long planId) {
    this.planId = planId;
  }


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public String getHeadid() {
    return headid;
  }

  public void setHeadid(String headid) {
    this.headid = headid;
  }


  public java.sql.Date getHireDate() {
    return hireDate;
  }

  public void setHireDate(java.sql.Date hireDate) {
    this.hireDate = hireDate;
  }


  public java.sql.Date getWorkEndTime() {
    return workEndTime;
  }

  public void setWorkEndTime(java.sql.Date workEndTime) {
    this.workEndTime = workEndTime;
  }


  public java.sql.Date getOfficialSalary() {
    return officialSalary;
  }

  public void setOfficialSalary(java.sql.Date officialSalary) {
    this.officialSalary = officialSalary;
  }


  public String getShaixuan() {
    return shaixuan;
  }

  public void setShaixuan(String shaixuan) {
    this.shaixuan = shaixuan;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  @Override
  public String toString() {
    return "TbRecruitmentemployed{" +
            "employedId=" + employedId +
            ", planId=" + planId +
            ", deptId=" + deptId +
            ", headid='" + headid + '\'' +
            ", hireDate=" + hireDate +
            ", workEndTime=" + workEndTime +
            ", officialSalary=" + officialSalary +
            ", shaixuan='" + shaixuan + '\'' +
            ", remark='" + remark + '\'' +
            '}';
  }
}
