package com.sirLiu.ttt_ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.sirLiu.ttt_ssm.model.TttUserinfo;
import com.sirLiu.ttt_ssm.model.commen.Msg;
import com.sirLiu.ttt_ssm.service.UserManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author sirLiu
 * @Date 2017/12/3 15:41
 */
//必须要加这个注解
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserManagementService userManagementService;

    @RequestMapping("/entry")
    public String listUsers(HttpServletRequest request) {
        if (request.getSession().getAttribute("users") == null) {
            request.getSession().setAttribute("users", userManagementService.listAllUsers());
        }
        return "index";
    }

    @RequestMapping("/ifUserHadLogin")
    @ResponseBody
    public boolean ifUserHadLogin(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }

    @RequestMapping("/userLogin")
    @ResponseBody
    public String userLogin(@RequestParam(value = "userName") String name,
                            @RequestParam(value = "userPassword") String password,
                            HttpServletRequest request) {
        TttUserinfo userinfo = userManagementService.selectByName(name);
        if (userinfo != null) {
            if (userinfo.getPassword().equals(password)) {
                request.getSession().setAttribute("user", userinfo);
                return Msg.success().add("userName", userinfo.getName()).toString();
            } else {
                return Msg.fail().add("error", "密码不正确！").toString();
            }
        } else {
            return Msg.fail().add("error", "该用户不存在！").toString();
        }
    }

    //String name, String password, String address, String mobile, String email, Boolean status=false
    @RequestMapping(value = "/userRegister")
    @ResponseBody
    public String userRegister(@RequestParam(value = "userName") String name,
                               @RequestParam("userPassword") String password,
                               @RequestParam("userAddress") String address,
                               @RequestParam(value = "userMobile") String mobile,
                               @RequestParam(value = "userEmail") String email,
                               HttpServletRequest request) {
        if (userManagementService.selectByName(name) == null) {
            TttUserinfo userinfo = new TttUserinfo();
            userinfo.setName(name);
            userinfo.setPassword(password);
            userinfo.setAddress(address);
            userinfo.setMobile(mobile);
            userinfo.setEmail(email);
            userinfo.setStatus(false);
            userManagementService.addUser(userinfo);
            request.getSession().setAttribute("user", userinfo);
            return Msg.success().toString();
        } else {
            return Msg.fail().add("error", "该用户名已经被注册!").toString();
        }
    }

    @RequestMapping(value = "/userUpdateAccount")
    @ResponseBody
    public String userUpdateAccount(@RequestParam(value = "userName") String name,
                                    @RequestParam("userPassword") String password,
                                    @RequestParam("userAddress") String address,
                                    @RequestParam(value = "userMobile") String mobile,
                                    @RequestParam(value = "userEmail") String email,
                                    HttpServletRequest request) {
        TttUserinfo userinfo = userManagementService.selectByName(name);
        if (userinfo != null) {
            userinfo.setName(name);
            userinfo.setPassword(password);
            userinfo.setAddress(address);
            userinfo.setMobile(mobile);
            userinfo.setEmail(email);
            userinfo.setStatus(false);
            userManagementService.updateUser(userinfo);
            request.getSession().setAttribute("user", userinfo);
            return Msg.success().toString();
        } else {
            return Msg.fail().add("error", "该用户不存在!").toString();
        }
    }

    @RequestMapping(value = "/reLogin")
    @ResponseBody
    public String reLogin( HttpServletRequest request) {
        request.getSession().setAttribute("user", null);
        return Msg.success().toString();
    }

    @RequestMapping(value = "/shop")
    public String redirectToShop(){
        return "shop";
    }

    @RequestMapping(value = "/about")
    public String redirectToAbout(){
        return "about";
    }

    @RequestMapping(value = "/contact")
    public String redirectToContact(){
        return "contact";
    }

}
