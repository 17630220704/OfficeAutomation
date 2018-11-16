package com.entity.lqp;


public class TbRecruitmentemployed {

  private long employedId;
  private long deptId;
  private long empId;
  private String headid;
  private java.sql.Date hireDate;
  private java.sql.Date workEndTime;
  private java.sql.Date officialSalary;
  private String remark;
  private String shaixuan;


  public long getEmployedId() {
    return employedId;
  }

  public void setEmployedId(long employedId) {
    this.employedId = employedId;
  }


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public long getEmpId() {
    return empId;
  }

  public void setEmpId(long empId) {
    this.empId = empId;
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


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getShaixuan() {
    return shaixuan;
  }

  public void setShaixuan(String shaixuan) {
    this.shaixuan = shaixuan;
  }

  @Override
  public String toString() {
    return "TbRecruitmentemployed{" +
            "employedId=" + employedId +
            ", deptId=" + deptId +
            ", empId=" + empId +
            ", headid='" + headid + '\'' +
            ", hireDate=" + hireDate +
            ", workEndTime=" + workEndTime +
            ", officialSalary=" + officialSalary +
            ", remark='" + remark + '\'' +
            ", shaixuan='" + shaixuan + '\'' +
            '}';
  }
}
