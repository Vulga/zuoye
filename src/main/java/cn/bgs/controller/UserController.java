package cn.bgs.controller;

import cn.bgs.pojo.User;
import cn.bgs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author 张超
 * @Date 2020/1/7 9:21
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public User login(String username, String password, HttpSession session) {
        User user = userService.login(username, password);
        session.setAttribute("user", user);
        return user;
    }

    @RequestMapping("findAllUser")
    @ResponseBody
    public List<User> findAllUser() {
        return userService.findAllUser();
    }

    @RequestMapping("delUser")
    @ResponseBody
    public boolean delUser(int id) {
        return userService.delUser(id);
    }

    @RequestMapping("addUser")
    @ResponseBody
    public boolean addUser(User user) {
        return userService.addUser(user);
    }

    @RequestMapping("updUser")
    @ResponseBody
    public boolean updUser(User user) {
        return userService.updUser(user);
    }

}
