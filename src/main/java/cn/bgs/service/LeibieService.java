package cn.bgs.service;

import cn.bgs.pojo.Leibie;

import java.util.List;

public interface LeibieService {
    List<Leibie> getNode();

    boolean add(Leibie leibie);

    int delete(int lid);

    boolean update(Leibie leibie);

    List<Leibie> getSelect();

    List<Leibie> getQuerySelect();
}
