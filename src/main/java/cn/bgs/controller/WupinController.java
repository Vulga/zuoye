package cn.bgs.controller;

import cn.bgs.pojo.Wupin;
import cn.bgs.service.WupinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/9 9:51
 */
@Controller
@RequestMapping("wupin")
public class WupinController {
    @Autowired
    private WupinService wupinService;

    @RequestMapping("lookWupinAll")
    @ResponseBody
    public List<Wupin> lookWupinAll(Integer lid, String lname){
        if(!lname.equals("")){lname="%"+lname+"%";}
        List<Wupin> wupins = wupinService.lookWupinAll(lid, lname);
        if(wupins.size()>0){
            return wupins;
        }else{
            return wupinService.lookWupinAll2(lid);
        }
    }

    @RequestMapping("add")
    @ResponseBody
    public boolean add(Wupin wupin){
        return wupinService.add(wupin);
    }

    @RequestMapping("del")
    @ResponseBody
    public boolean del(int wid){
        return wupinService.del(wid);
    }

    @RequestMapping("upd")
    @ResponseBody
    public boolean upd(Wupin wupin){
        return wupinService.upd(wupin);
    }

}
