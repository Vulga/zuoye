package cn.bgs.service.impl;

import cn.bgs.dao.LeibieMapper;
import cn.bgs.pojo.Leibie;
import cn.bgs.service.LeibieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/8 19:40
 */
@Service
public class LeibieServiceImpl implements LeibieService {
    @Autowired
    private LeibieMapper leibieMapper;

    @Override
    public List<Leibie> getNode() {
        return leibieMapper.getNode();
    }

    @Override
    public boolean add(Leibie leibie) {
        return leibieMapper.add(leibie);
    }

    @Override
    public int delete(int lid) {
        return leibieMapper.delete(lid);
    }

    @Override
    public boolean update(Leibie leibie) {
        return leibieMapper.update(leibie);
    }

    @Override
    public List<Leibie> getSelect() {
        return leibieMapper.getSelect();
    }

    @Override
    public List<Leibie> getQuerySelect() {
        return leibieMapper.getQuerySelect();
    }
}
