package com.poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.dao.UserDao;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.entity.User;
import com.poly.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao dao;
	
	public  UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}

	@Override
	public User Login(String username, String password) {
		// TODO Auto-generated method stub
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public User ResetPassword(String email) {
		User existUser = findByEmail(email);
		if(existUser!= null) {
			String newPass = String.valueOf((int)(Math.random()*((9000-1000)+1)) + 1000);
			existUser.setPassword(newPass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User create(String username, String password, String email) {
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setPassword(password);
		newUser.setEmail(email);
		newUser.setAdmin(Boolean.FALSE);
		newUser.setActive(Boolean.TRUE);
		return dao.create(newUser);
	}

	@Override
	public User update(User entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		user.setActive(Boolean.FALSE);
		return dao.update(user);
	}

	@Override
	public List<User> findUserLikedVideoByVideoHref(String href) {
		Map<String, Object> params = new HashMap<>();
		params.put("videoHref", href);
		return dao.findUserLikedVideoByVideoHref(params);
	}
	
}
