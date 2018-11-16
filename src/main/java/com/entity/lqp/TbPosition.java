package com.entity.lqp;


public class TbPosition {

  private long posiId;
  private long levelId;
  private long postId;
  private long deptId;
  private String posiName;


  public long getPosiId() {
    return posiId;
  }

  public void setPosiId(long posiId) {
    this.posiId = posiId;
  }


  public long getLevelId() {
    return levelId;
  }

  public void setLevelId(long levelId) {
    this.levelId = levelId;
  }


  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
  }


  public long getDeptId() {
    return deptId;
  }

  public void setDeptId(long deptId) {
    this.deptId = deptId;
  }


  public String getPosiName() {
    return posiName;
  }

  public void setPosiName(String posiName) {
    this.posiName = posiName;
  }

}
