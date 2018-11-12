package com.entity.permit;

public class upRoleUser {
    private long uid;
    private long ruid;
    private long rid;
    private long deptid;
    private long persoid;
    private String uloginname;
    private String uloginpassword;
    private long ulocking;

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    public long getDeptid() {
        return deptid;
    }

    public void setDeptid(long deptid) {
        this.deptid = deptid;
    }

    public long getPersoid() {
        return persoid;
    }

    public void setPersoid(long persoid) {
        this.persoid = persoid;
    }

    public String getUloginname() {
        return uloginname;
    }

    public void setUloginname(String uloginname) {
        this.uloginname = uloginname;
    }

    public String getUloginpassword() {
        return uloginpassword;
    }

    public void setUloginpassword(String uloginpassword) {
        this.uloginpassword = uloginpassword;
    }

    public long getRuid() {
        return ruid;
    }

    public void setRuid(long ruid) {
        this.ruid = ruid;
    }

    public upRoleUser() {
        super();
    }

    public long getUlocking() {
        return ulocking;
    }

    public void setUlocking(long ulocking) {
        this.ulocking = ulocking;
    }

    public upRoleUser(long uid,long ruid, long rid, long deptid, long persoid, String uloginname, String uloginpassword, long ulocking) {
        this.uid = uid;
        this.ruid = ruid;
        this.rid = rid;
        this.deptid = deptid;
        this.persoid = persoid;
        this.uloginname = uloginname;
        this.uloginpassword = uloginpassword;
        this.ulocking = ulocking;
    }

    @Override
    public String toString() {
        return "upRoleUser{" +
                "uid=" + uid +
                ", ruid=" + ruid +
                ", rid=" + rid +
                ", deptid=" + deptid +
                ", persoid=" + persoid +
                ", uloginname='" + uloginname + '\'' +
                ", uloginpassword='" + uloginpassword + '\'' +
                ", ulocking=" + ulocking +
                '}';
    }
}
