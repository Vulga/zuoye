package cn.bgs.pojo;

/**
 * 审批 全查 pok==0
 *List<Plan> queryAll(boolean flag);
        true 表示 出货记录查询 查询审批通过的 即pok==1

 * @Author 张超
 * @Date 2020/1/10 15:25
 */

public class VO {
    boolean flag;
    String pname;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public boolean getFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
}
