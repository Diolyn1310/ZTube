package com.poly.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import org.hibernate.mapping.PrimaryKey;

import com.poly.util.JpaUtils;

public class AbstractDao<T> {
	public static final EntityManager entityManager = JpaUtils.getEntityManager();
		
	@Override
	protected void finalize() throws Throwable {
		entityManager.close(); 
		super.finalize();
	}
	
	public T findById(Class<T> clazz, int id) {
		return entityManager.find(clazz, id);
	}
	
		public List<T> findAll(Class<T> clazz, boolean existIsActive){
			String entityName = clazz.getSimpleName();
			StringBuilder sql= new StringBuilder();
			sql.append("SELECT o FROM ").append(entityName).equals(" o");
			if(existIsActive == true) {
				sql.append(" o WHERE o.isActive = true");
			}
			TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
			return query.getResultList();
		}
		public List<T> findAll(Class<T> clazz, boolean existIsActive, int pageNumber, int pageSize){
			String entityName = clazz.getSimpleName();
			StringBuilder sql= new StringBuilder();
			sql.append("SELECT o FROM ").append(entityName).equals(" o");
			if(existIsActive == true) {
				sql.append(" o WHERE o.isActive = true");
			}
			TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
			query.setFirstResult((pageNumber -1) * pageSize);
			query.setMaxResults(pageSize);
			return query.getResultList();
		}
		public T findOne(Class<T> clazz, String sql, Object ... params){
			TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
			for(int i=0; i < params.length; i++) {
				query.setParameter(i, params[i]);
				
			}
			List<T> result = query.getResultList();
			if (result.isEmpty()) {
				return null;
				
			}
			return result.get(0);
		
		}
		public List<T> findMany(Class<T> clazz, String sql, Object ... params){
			TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
			for(int i=0; i < params.length; i++) {
				query.setParameter(i, params[i]);
				
			}
			return query.getResultList();
		
		}
		@SuppressWarnings("unchecked")
		public List<Object[]> findManyByNativeQuery	(String sql, Object ... params){
			Query query = entityManager.createNativeQuery(sql);
			for(int i=0; i < params.length; i++) {
				query.setParameter(i, params[i]);
				
			}
			return query.getResultList();
		
		}
		public T create(T entity) {
			try {
				entityManager.getTransaction().begin();
				entityManager.persist(entity);
				entityManager.getTransaction().commit();
				System.out.println("thanh cong");
				return entity;
			} catch (Exception e) {
				entityManager.getTransaction().rollback();
				System.out.println("kh the create" + entity.getClass().getSimpleName()+ " to BD");
				throw new RuntimeException(e);

			}
			
		}
		public T update(T entity) {
			try {
				entityManager.getTransaction().begin();
				entityManager.merge(entity);
				entityManager.getTransaction().commit();
				System.out.println("thanh cong");
				return entity;
			} catch (Exception e) {
				entityManager.getTransaction().rollback();
				System.out.println("kh the create" + entity.getClass().getSimpleName());
				throw new RuntimeException(e);

			}
			
		}
		public T delete(T entity) {
			try {
				entityManager.getTransaction().begin();
				entityManager.remove(entity);
				entityManager.getTransaction().commit();
				System.out.println("thanh cong");
				return entity;
			} catch (Exception e) {
				entityManager.getTransaction().rollback();
				System.out.println("kh the create" + entity.getClass().getSimpleName());
				throw new RuntimeException(e);

			}
			
		}
		public List<T> callStored(String namedStored, Map<String, Object> params){
			StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStored);
			params.forEach((key, value) -> query.setParameter(key, value));
			return (List<T>) query.getResultList();
		}
}
