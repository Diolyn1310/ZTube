package com.poly.service;

import java.util.List;

import com.poly.entity.User;

public interface UserService {
	User findById(int id);
	User findByEmail(String email);
	User findByUsername(String username);
	User Login(String username,String password); 
	User ResetPassword(String email); 
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create(String username, String password, String email);
	User update(User entity);
	User delete(String username);
	List<User> findUserLikedVideoByVideoHref(String href);
}
