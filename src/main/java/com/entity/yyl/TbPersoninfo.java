package com.entity.yyl;


public class TbPersoninfo {

  private long persoId;
  private Integer posiId;
  private String personName;
  private String personBirth;
  private String personPicture;
  private String telephone;
  private String officePhone;
  private String email;
  private String nowAddress;
  private String remark;
  private Integer nowState;


  public long getPersoId() {
    return persoId;
  }

  public void setPersoId(long persoId) {
    this.persoId = persoId;
  }


  public Integer getPosiId() {
    return posiId;
  }

  public void setPosiId(Integer posiId) {
    this.posiId = posiId;
  }


  public String getPersonName() {
    return personName;
  }

  public void setPersonName(String personName) {
    this.personName = personName;
  }


  public String getPersonBirth() {
    return personBirth;
  }

  public void setPersonBirth(String personBirth) {
    this.personBirth = personBirth;
  }


  public String getPersonPicture() {
    return personPicture;
  }

  public void setPersonPicture(String personPicture) {
    this.personPicture = personPicture;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getOfficePhone() {
    return officePhone;
  }

  public void setOfficePhone(String officePhone) {
    this.officePhone = officePhone;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getNowAddress() {
    return nowAddress;
  }

  public void setNowAddress(String nowAddress) {
    this.nowAddress = nowAddress;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public Integer getNowState() {
    return nowState;
  }

  public void setNowState(Integer nowState) {
    this.nowState = nowState;
  }

  @Override
  public String toString() {
    return "TbPersoninfo{" +
            "persoId=" + persoId +
            ", posiId=" + posiId +
            ", personName='" + personName + '\'' +
            ", personBirth='" + personBirth + '\'' +
            ", personPicture='" + personPicture + '\'' +
            ", telephone='" + telephone + '\'' +
            ", officePhone='" + officePhone + '\'' +
            ", email='" + email + '\'' +
            ", nowAddress='" + nowAddress + '\'' +
            ", remark='" + remark + '\'' +
            ", nowState=" + nowState +
            '}';
  }
}
