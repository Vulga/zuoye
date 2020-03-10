package cn.bgs.pojo;


public class Wupin {

  private Integer wid;
  private Integer wlid;
  private String wname;
  private Integer wcount;
  private java.sql.Timestamp addTime;

  /*物品类别*/
  private Leibie leibie;

  public Leibie getLeibie() {
    return leibie;
  }

  public void setLeibie(Leibie leibie) {
    this.leibie = leibie;
  }

  public Integer getWlid() {
    return wlid;
  }

  public void setWlid(Integer wlid) {
    this.wlid = wlid;
  }

  public Integer getWid() {
    return wid;
  }

  public void setWid(Integer wid) {
    this.wid = wid;
  }

  public String getWname() {
    return wname;
  }

  public void setWname(String wname) {
    this.wname = wname;
  }


  public Integer getWcount() {
    return wcount;
  }

  public void setWcount(Integer wcount) {
    this.wcount = wcount;
  }


  public java.sql.Timestamp getAddTime() {
    return addTime;
  }

  public void setAddTime(java.sql.Timestamp addTime) {
    this.addTime = addTime;
  }

}
