package cn.bgs.service.impl;

import cn.bgs.dao.WupinMapper;
import cn.bgs.pojo.Wupin;
import cn.bgs.service.WupinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/9 9:52
 */
@Service
public class WupinServiceImpl implements WupinService {
    @Autowired
    private WupinMapper wupinMapper;


    @Override
    public List<Wupin> lookWupinAll(Integer lid, String lname) {
        return wupinMapper.lookWupinAll(lid, lname);
    }

    @Override
    public boolean add(Wupin wupin) {
        return wupinMapper.add(wupin);
    }

    @Override
    public boolean del(int wid) {
        return wupinMapper.del(wid);
    }

    @Override
    public boolean upd(Wupin wupin) {
        return wupinMapper.upd(wupin);
    }

    @Override
    public List<Wupin> lookWupinAll2(Integer lid) {
        return wupinMapper.lookWupinAll2(lid);
    }

}
