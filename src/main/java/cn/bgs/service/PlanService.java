package cn.bgs.service;

import cn.bgs.pojo.Plan;
import cn.bgs.pojo.VO;
import cn.bgs.pojo.VO2;

import java.util.List;

public interface PlanService {
    boolean add(Plan plan);

    List<Plan> queryAll(VO flag);

    boolean ackPlan(Integer pcount, Integer id, String pname, Integer type, String reason);

    List<Plan> queryAll2();

    boolean upd(Plan plan);

    List<VO2> queryAllTJ(VO2 vo2);
}
