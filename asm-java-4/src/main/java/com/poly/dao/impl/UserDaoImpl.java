package com.poly.dao.impl;

import java.util.List;
import java.util.Map;

import com.poly.constant.NamedStored;
import com.poly.dao.AbstractDao;
import com.poly.dao.UserDao;
import com.poly.entity.User;

public class UserDaoImpl extends AbstractDao<User> implements UserDao {

	public User findById(int id) {
		// TODO Auto-generated method stub
		return super.findById(User.class, id);
	}

	public User findByEmail(String email) {
		String sql = "SELECT o FROM User o WHERE o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	public User findByUsername(String username) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0";
		return super.findOne(User.class, sql, username);
	}

	public User findByUsernameAndPassword(String username, String password) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0 AND o.password = ?1";
		return super.findOne(User.class, sql, username, password);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true);
	}

	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true, pageNumber, pageSize);
	}

	@Override
	public List<User> findUserLikedVideoByVideoHref(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.callStored(NamedStored.FIND_USER_LIKED_VIDEO_BY_VIDEO_HREF, params);
	}


}
