package cn.bgs.dao;

import cn.bgs.pojo.Plan;
import cn.bgs.pojo.VO;
import cn.bgs.pojo.VO2;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlanMapper {
    /*申请出货*/
    boolean add(Plan plan);
    /*审批 全查 pok==0*/
    List<Plan> queryAll(VO flag);
    /*审核出货*/
    boolean ackPlan(@Param("pcount") Integer pcount, @Param("id") Integer id, @Param("pname") String pname, @Param("type") Integer type, @Param("reason") String reason);
    /*非admin查看审核的记录，不通过的在重新申请*/
    List<Plan> queryAll2();
    /*重新申请*/
    boolean upd(Plan plan);
    /*统计图的，查看通过了的！！ pok==1*/
    List<VO2> queryAllTJ(VO2 vo2);
}
