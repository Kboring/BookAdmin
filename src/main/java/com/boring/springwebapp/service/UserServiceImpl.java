package com.boring.springwebapp.service;

import com.boring.springwebapp.dao.UserMapper;
import com.boring.springwebapp.entity.Book;
import com.boring.springwebapp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUser(Map map) {
        return userMapper.findUser(map);
    }

    @Override
    public int addUser(Map map) {
        return userMapper.addUser(map);
    }

    @Override
    public List<Book> findBookByName(String username) {
        return userMapper.findBookByName(username);
    }

    @Override
    public int addBook(Map map) {
        return userMapper.addBook(map);
    }

    @Override
    public List<Book> allBook() {
        return userMapper.allBook();
    }

    @Override
    public int delBookById(int id) {
        return userMapper.delBookById(id);
    }

    @Override
    public int delBookByName(String bookname) {
        return userMapper.delBookByName(bookname);
    }

    @Override
    public List<User> allUser() {
        return userMapper.allUser();
    }

    @Override
    public List<User> findUserByName(String username) {
        return userMapper.findUserByName(username);
    }

    @Override
    public List<Book> findBookByPage(Map map) {
        return userMapper.findBookByPage(map);
    }

    @Override
    public int delUser(String username) {
        return userMapper.delUser(username);
    }
}
