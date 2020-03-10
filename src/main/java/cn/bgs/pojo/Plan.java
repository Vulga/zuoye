package cn.bgs.pojo;


public class Plan {

  private Integer pid;
  private String pleibie;
  private String pname;
  private Integer pcount;
  private java.sql.Timestamp ptime;
  private Integer pok;
  private String reason;

  private Leibie leibie;

  public Leibie getLeibie() {
    return leibie;
  }

  public void setLeibie(Leibie leibie) {
    this.leibie = leibie;
  }

  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }


  public String getPleibie() {
    return pleibie;
  }

  public void setPleibie(String pleibie) {
    this.pleibie = pleibie;
  }


  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }


  public Integer getPcount() {
    return pcount;
  }

  public void setPcount(Integer pcount) {
    this.pcount = pcount;
  }


  public java.sql.Timestamp getPtime() {
    return ptime;
  }

  public void setPtime(java.sql.Timestamp ptime) {
    this.ptime = ptime;
  }


  public Integer getPok() {
    return pok;
  }

  public void setPok(Integer pok) {
    this.pok = pok;
  }


  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }

}
