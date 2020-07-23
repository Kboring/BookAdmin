package com.boring.springwebapp.controller;

import com.alibaba.fastjson.JSONObject;
import com.boring.springwebapp.entity.Book;
import com.boring.springwebapp.entity.User;
import com.boring.springwebapp.service.UserService;


import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HelloController {

    @Autowired
    private UserService userService;

    @RequestMapping({"/index"})
    public String index() {
        System.out.println("1:到达了index的controller");
        return "index";
    }

    //******************************************************************************
    @PostMapping(value = "/replace")
    @ResponseBody
    @CrossOrigin
    public String replace(@RequestBody String param, HttpServletRequest request,
                          Model model,HttpSession session) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));

        //管理员身份登录
        if (json.getString("username").equals("admin") && json.getString("password").equals("admin")) {
            json.put("msg", "admin");
            session.setAttribute("username",json.getString("username"));
            return json.toString();
        } else {
            // 普通用户登录
            Map<Object, String> map = new HashMap();
            map.put("username", json.getString("username"));
            map.put("password", json.getString("password"));
            session.setAttribute("username",json.getString("username"));
            User userByName = userService.findUser(map);
            if (userByName == null) { // 登录失败 表中查不到
                json.put("msg", "fail");
                return json.toString();
            } else {                  // 登录成功
                json.put("msg", "success");
                return json.toString();
            }
        }
    }

    //******************************************************************************



    @RequestMapping(value = "/home")
    @CrossOrigin
    public String home(HttpServletRequest request,
                          Model model,HttpSession session) {
        if (request.getSession().getAttribute("token_login") == "1"){
            Map<Object, String> map = new HashMap();
            map.put("username", request.getParameter("username"));
            map.put("password", request.getParameter("password"));
            map.put("age", request.getParameter("age"));
            map.put("classname", request.getParameter("classname"));

            userService.addUser(map);
            session.setAttribute("username", map.get("username"));
        }
        List<User> userByName = userService.findUserByName((String) request.getSession().getAttribute("username"));
        model.addAttribute("userByName",userByName);
        if (request.getSession().getAttribute("i") == null){


            Map map = new HashMap();
            map.put("i",0);
            map.put("username",request.getSession().getAttribute("username"));
            List<Book> book = userService.findBookByPage(map);
            if (book.size() != 0){   // 判断是否之前已经添加过图书
                model.addAttribute("book",book);
                // token 给前端判断是否展示已经选过图书
                model.addAttribute("token_book",1);
            }else {
            model.addAttribute("token_book",0);
        }
            return "home";
        }else {
            String i = (String) request.getSession().getAttribute("i");
            int y = Integer.parseInt(i);
            Map map = new HashMap();
            map.put("i",y);
            map.put("username",request.getSession().getAttribute("username"));
            List<Book> book = userService.findBookByPage(map);
            if (book.size() != 0){   // 判断是否之前已经添加过图书
                model.addAttribute("book",book);
                // token 给前端判断是否展示已经选过图书
                model.addAttribute("token_book",1);
            }else {
                model.addAttribute("token_book",0);
            }
            return "home";
        }
    }

    // 下一页查询
    @RequestMapping("/replace_home_next")
    @ResponseBody
    @CrossOrigin
    public String replace_home_next(@RequestBody String param,HttpSession session, HttpServletRequest request, Model model) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));
        String i = "0";
         if (!StringUtil.isEmpty((String) request.getSession().getAttribute("i"))){
            i = (String) request.getSession().getAttribute("i");
        }
         int x = Integer.parseInt(i);
        request.getSession().setAttribute("i",String.valueOf(x+2));

        Map map = new HashMap();
        map.put("i",x+2);
        map.put("username",json.getString("username"));
        //List<Book> bookByPage = userService.findBookByPage(map);
        List<Book> books = userService.findBookByName(json.getString("username"));
        if (x+2 < books.size()){
            json.put("msg", "success");
            return json.toString();
        }else {
            json.put("msg", "已经到头!");
            return json.toString();
        }

    }

    // 上一页查询
    @RequestMapping("/replace_home_pre")
    @ResponseBody
    @CrossOrigin
    public String replace_home_pre(@RequestBody String param,HttpServletRequest request, Model model) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));
        String i = "0";
        if (!StringUtil.isEmpty((String) request.getSession().getAttribute("i"))){
            i = (String) request.getSession().getAttribute("i");
        }
        int x = Integer.parseInt(i);
        request.getSession().setAttribute("i",String.valueOf(x-2));

        Map map = new HashMap();
        map.put("i",x-2);
        map.put("username",json.getString("username"));
        List<Book> books = userService.findBookByName(json.getString("username"));
        if (x-2 >= 0){
            json.put("msg", "success");
            return json.toString();
        }else {
            json.put("msg", "已经到头!");
            return json.toString();
        }

    }

    //******************************************************************************
    //******************************************************************************
    //******************************************************************************
    //******************************************************************************

    @RequestMapping("/regist")
    public String regist(HttpSession session, HttpServletRequest request) {
        System.out.println("3:到达了regist的controller");
        return "regist";
    }
    //******************************************************************************

    @RequestMapping({"/del"})
    @ResponseBody
    public String del(@RequestBody String param,HttpServletRequest request) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));
        userService.delBookById(json.getIntValue("id"));
        json.put("msg", "success");
        return json.toString();
    }

    //******************************************************************************

    @RequestMapping("/addBook")
    public String addBook(Model model,HttpServletRequest request) {
        List<Book> allBook = userService.allBook(); // 查找全部的书籍'
        request.getSession().setAttribute("allBook",allBook);
        model.addAttribute("allBook",allBook);
        return "addBook";
    }

    // 添加书籍
    @RequestMapping({"/addBook_replace"})
    @ResponseBody
    public String addBook(@RequestBody String param,HttpServletRequest request,Model model) {
        List<Book> allBook = userService.allBook(); // 查找全部的书籍'
        model.addAttribute("allBook",allBook);

        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));

        Map<String,Object> map = new HashMap<>();
        map.put("username",json.get("username"));
        map.put("id",json.get("id"));
        userService.addBook(map);
        json.put("msg", "success");
        return json.toString();
    }

    // 注销用户
    @RequestMapping({"/logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }





    //******************************************************************************
    //******************************************************************************
    //******************************************************************************
    //******************************************************************************
    // admin删除用户
    @RequestMapping({"/delUser"})
    @ResponseBody
    public String delUser(@RequestBody String param, HttpServletRequest request) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("username", json.getString("username"));

        userService.delUser(json.getString("username"));
        json.put("msg", "success");
        return json.toString();
    }

    // admin删除书籍
    @RequestMapping({"/delBook"})
    @ResponseBody
    public String delBook(@RequestBody String param, HttpServletRequest request) {
        JSONObject json = JSONObject.parseObject(param);
        request.getSession().setAttribute("bookname", json.getString("bookname"));

        userService.delBookByName(json.getString("bookname"));
        json.put("msg", "success");
        return json.toString();
    }

    @RequestMapping({"/admin"})
    public String admin(Model model,HttpSession session) {
        List<User> users = userService.allUser();
        List<Book> books = userService.allBook();
        int size = books.size();
        model.addAttribute("allBooksNum",size);
        session.setAttribute("allBooksNum",size);
        model.addAttribute("books",books);
        model.addAttribute("users",users);
        return "admin";
    }

}
