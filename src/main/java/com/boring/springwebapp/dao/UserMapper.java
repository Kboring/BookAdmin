package com.boring.springwebapp.dao;

import com.boring.springwebapp.entity.Book;
import com.boring.springwebapp.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    // 登录时 查找用户来验证
    public User findUser(@Param("map") Map map);

    // 注册
    public int addUser(@Param("map") Map map);

    // 根据username查找订阅的书籍
    public List<Book> findBookByName(@Param("username") String username);

    // 用户主页添加新的书籍
    public int addBook(@Param("map") Map map);

    // 查找所有的书籍
    public List<Book> allBook();

    // 删除书籍
    public int delBookById(@Param("id") int id);

    // 删除书籍
    public int delBookByName(@Param("bookname") String bookname);

    // 查找所有的用户信息
    public List<User> allUser();

    public List<User> findUserByName(@Param("username") String username);

    public List<Book> findBookByPage(@Param("map") Map map);

    // admin删除用户
    public int delUser(@Param("username") String username);
}
