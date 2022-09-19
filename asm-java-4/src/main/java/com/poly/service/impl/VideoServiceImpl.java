package com.poly.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.dao.VideoDao;
import com.poly.dao.impl.VideoDaoImpl;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.util.JpaUtils;

public class VideoServiceImpl implements VideoService {
	
	private VideoDao dao;	
	
	public  VideoServiceImpl() {
		dao = new VideoDaoImpl();
	}

	public Video findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	public Video findByHref(String href) {
		// TODO Auto-generated method stub
		return dao.findByHref(href);
	}

	public List<Video> findAll() {
		// TODO Auto-generated method stub
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Video> query = em.createNamedQuery("Video.findAll", Video.class);
		List<Video> videos = query.getResultList();
//		return dao.findAll();
		return videos;
//		
	}

	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	public Video create(Video entity) {
		// TODO Auto-generated method stub
		entity.setActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShares(0);
		return dao.create(entity);
	}

	public Video update(Video entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	public Video delete(String href) {
		// TODO Auto-generated method stub
		Video entity = findByHref(href);
		entity.setActive(Boolean.FALSE);
		return dao.update(entity);
	}
//	public static void main(String[] args) {
//		VideoServiceImpl i = new VideoServiceImpl();
//		List<Video> videos = i.findAll();
//		for (Video video : videos) {
//			System.out.println(video.getTitle());
//		} 
//	}
}
