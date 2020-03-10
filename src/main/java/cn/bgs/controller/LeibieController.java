package cn.bgs.controller;

import cn.bgs.pojo.Leibie;
import cn.bgs.service.LeibieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/8 19:39
 */
@Controller
@RequestMapping("leibie")
public class LeibieController {
    @Autowired
    private LeibieService leibieService;

    @RequestMapping("getNode")
    @ResponseBody
    public List<Leibie> getNode(){
        return leibieService.getNode();
    }

    @RequestMapping("add")
    @ResponseBody
    public int add(Leibie leibie){
        leibieService.add(leibie);
        return leibie.getLid();
    }

    @RequestMapping("delete")
    @ResponseBody
    public int delete(int lid){
        return leibieService.delete(lid);
    }

    @RequestMapping("update")
    @ResponseBody
    public boolean update(Leibie leibie){
        return leibieService.update(leibie);
    }

    @RequestMapping("getSelect")
    @ResponseBody
    public List<Leibie> getSelect(){
        return leibieService.getSelect();
    }
    /*查询下拉框的*/
    @RequestMapping("getQuerySelect")
    @ResponseBody
    public List<Leibie> getQuerySelect(){
        return leibieService.getQuerySelect();
    }
}
