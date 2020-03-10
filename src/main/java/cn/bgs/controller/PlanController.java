package cn.bgs.controller;

import cn.bgs.pojo.Plan;
import cn.bgs.pojo.VO;
import cn.bgs.pojo.VO2;
import cn.bgs.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/10 12:27
 */
@Controller
@RequestMapping("plan")
public class PlanController {
    @Autowired
    private PlanService planService;

    @RequestMapping("add")
    @ResponseBody
    public boolean add(Plan plan){
        return planService.add(plan);
    }

    @RequestMapping("queryAll")
    @ResponseBody
    public List<Plan> queryAll(VO vo){
        if(vo.getPname()!=null && !vo.getPname().equals("")){vo.setPname("%"+vo.getPname()+"%");}
        return planService.queryAll(vo);
    }

    @RequestMapping("queryAll2")
    @ResponseBody
    public List<Plan> queryAll2(){
        return planService.queryAll2();
    }

    @RequestMapping("ackPlan")
    @ResponseBody
    public boolean ackPlan(Integer pcount, Integer id, String pname, Integer type, String reason){
        return planService.ackPlan(pcount, id,pname, type, reason);
    }

    @RequestMapping("upd")
    @ResponseBody
    public boolean upd(Plan plan){
        return planService.upd(plan);
    }

    @RequestMapping("queryAllTJ")
    @ResponseBody
    public List<VO2> queryAllTJ(VO2 vo2){
        return planService.queryAllTJ(vo2);
    }
}
