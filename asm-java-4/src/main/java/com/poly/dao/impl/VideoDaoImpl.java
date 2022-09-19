package com.poly.dao.impl;

import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.VideoDao;
import com.poly.entity.Video;

public class VideoDaoImpl extends AbstractDao<Video> implements VideoDao {

	public Video findById(int id) {
		// TODO Auto-generated method stub
		return super.findById(Video.class, id);	
	}

	public Video findByHref(String href) {
		String sql = "SELECT o FROM Video o WHERE o.href = ?0";
		return super.findOne(Video.class, sql, href);
	}

	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true);
	}

	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true, pageNumber, pageSize);
	}

}
