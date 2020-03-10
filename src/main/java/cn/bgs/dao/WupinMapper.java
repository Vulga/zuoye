package cn.bgs.dao;

import cn.bgs.pojo.Wupin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WupinMapper {
    /*物品全查*/
    List<Wupin> lookWupinAll(@Param("lid") Integer lid, @Param("lname") String lname);
    /*添加物品*/
    boolean add(Wupin wupin);
    /*删除物品*/
    boolean del(int wid);
    /*修改物品*/
    boolean upd(Wupin wupin);
    /*select 主类别查询*/
    List<Wupin> lookWupinAll2(Integer lid);
}
