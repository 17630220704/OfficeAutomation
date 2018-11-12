package com.entity.yyl;


public class TbDeparment {

  private long deptId;
  private long deptNumber;
  private String deptName;


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public long getDeptNumber() {
    return deptNumber;
  }

  public void setDeptNumber(long deptNumber) {
    this.deptNumber = deptNumber;
  }


  public String getDeptName() {
    return deptName;
  }

  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }

  @Override
  public String toString() {
    return "TbDeparment{" +
            "deptId=" + deptId +
            ", deptNumber=" + deptNumber +
            ", deptName='" + deptName + '\'' +
            '}';
  }
}
