package cn.bgs.dao;

import cn.bgs.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    /*登录*/
    User login(@Param("username") String username, @Param("password") String password);
    /*用户全查*/
    List<User> findAllUser();
    /*用户删除*/
    boolean delUser(int id);
    /*用户添加*/
    boolean addUser(User user);
    /*用户修改*/
    boolean updUser(User user);
}
