package cn.bgs.service;

import cn.bgs.pojo.Wupin;

import java.util.List;

public interface WupinService {
    List<Wupin> lookWupinAll(Integer lid, String lname);

    boolean add(Wupin wupin);

    boolean del(int wid);

    boolean upd(Wupin wupin);

    List<Wupin> lookWupinAll2(Integer lid);
}
