package com.entity.lqp;


public class TbRecruitmentplan {

  private long planId;
  private long empId;
  private String planName;
  private String dictionaryId;
  private java.sql.Date startTime;
  private java.sql.Date endTime;
  private long budget;
  private String planInstructions;
  private String planNote;
  private String noteRemind;
  private Integer approvalStatus;


  public long getPlanId() {
    return planId;
  }

  public void setPlanId(long planId) {
    this.planId = planId;
  }


  public long getEmpId() {
    return empId;
  }

  public void setEmpId(long empId) {
    this.empId = empId;
  }


  public String getPlanName() {
    return planName;
  }

  public void setPlanName(String planName) {
    this.planName = planName;
  }


  public String getDictionaryId() {
    return dictionaryId;
  }

  public void setDictionaryId(String dictionaryId) {
    this.dictionaryId = dictionaryId;
  }


  public java.sql.Date getStartTime() {
    return startTime;
  }

  public void setStartTime(java.sql.Date startTime) {
    this.startTime = startTime;
  }


  public java.sql.Date getEndTime() {
    return endTime;
  }

  public void setEndTime(java.sql.Date endTime) {
    this.endTime = endTime;
  }


  public long getBudget() {
    return budget;
  }

  public void setBudget(long budget) {
    this.budget = budget;
  }


  public String getPlanInstructions() {
    return planInstructions;
  }

  public void setPlanInstructions(String planInstructions) {
    this.planInstructions = planInstructions;
  }


  public String getPlanNote() {
    return planNote;
  }

  public void setPlanNote(String planNote) {
    this.planNote = planNote;
  }


  public String getNoteRemind() {
    return noteRemind;
  }

  public void setNoteRemind(String noteRemind) {
    this.noteRemind = noteRemind;
  }


  public long getApprovalStatus() {
    return approvalStatus;
  }

  public void setApprovalStatus(Integer approvalStatus) {
    this.approvalStatus = approvalStatus;
  }

  @Override
  public String toString() {
    return "TbRecruitmentplan{" +
            "planId=" + planId +
            ", empId=" + empId +
            ", planName='" + planName + '\'' +
            ", dictionaryId='" + dictionaryId + '\'' +
            ", startTime=" + startTime +
            ", endTime=" + endTime +
            ", budget=" + budget +
            ", planInstructions='" + planInstructions + '\'' +
            ", planNote='" + planNote + '\'' +
            ", noteRemind='" + noteRemind + '\'' +
            ", approvalStatus=" + approvalStatus +
            '}';
  }
}
