package cn.bgs.service;

import cn.bgs.pojo.User;

import java.util.List;

public interface UserService {
    User login(String username, String password);

    List<User> findAllUser();

    boolean delUser(int id);

    boolean addUser(User user);

    boolean updUser(User user);
}
