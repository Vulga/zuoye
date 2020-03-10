package cn.bgs.service.impl;

import cn.bgs.dao.UserMapper;
import cn.bgs.pojo.User;
import cn.bgs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/7 9:25
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public boolean delUser(int id) {
        return userMapper.delUser(id);
    }

    @Override
    public boolean addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public boolean updUser(User user) {
        return userMapper.updUser(user);
    }
}
