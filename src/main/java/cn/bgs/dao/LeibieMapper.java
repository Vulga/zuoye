package cn.bgs.dao;

import cn.bgs.pojo.Leibie;
import java.util.List;

public interface LeibieMapper {
    /*ztree查询类别*/
    List<Leibie> getNode();
    /*添加类别*/
    boolean add(Leibie leibie);
    /*删除类别*/
    int delete(int lid);
    /*修改类别*/
    boolean update(Leibie leibie);
    /*添加物品的下拉框，选择类别*/
    List<Leibie> getSelect();
    /*查询的下拉框*/
    List<Leibie> getQuerySelect();
}
