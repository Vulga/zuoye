package cn.bgs.service.impl;

import cn.bgs.dao.PlanMapper;
import cn.bgs.pojo.Plan;
import cn.bgs.pojo.VO;
import cn.bgs.pojo.VO2;
import cn.bgs.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/10 12:29
 */
@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanMapper planMapper;


    @Override
    public boolean add(Plan plan) {
        return planMapper.add(plan);
    }

    @Override
    public List<Plan> queryAll(VO flag) {
        return planMapper.queryAll(flag);
    }

    @Override
    public boolean ackPlan(Integer pcount, Integer id, String pname, Integer type, String reason) {
        return planMapper.ackPlan(pcount, id, pname, type, reason);
    }

    @Override
    public List<Plan> queryAll2() {
        return planMapper.queryAll2();
    }

    @Override
    public boolean upd(Plan plan) {
        return planMapper.upd(plan);
    }

    @Override
    public List<VO2> queryAllTJ(VO2 vo2) {
        return planMapper.queryAllTJ(vo2);
    }
}
