package com.boring.springwebapp.service;

import com.boring.springwebapp.entity.Book;
import com.boring.springwebapp.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {
    public User findUser(Map map);

    public int addUser( Map map);

    public List<Book> findBookByName( String username);

    public int addBook( Map map);

    public List<Book> allBook();

    // 删除书籍
    public int delBookById(int id);

    public int delBookByName(String bookname);

    public List<User> allUser();

    public List<User> findUserByName(String username);

    public List<Book> findBookByPage(Map map);

    public int delUser( String username);
}
