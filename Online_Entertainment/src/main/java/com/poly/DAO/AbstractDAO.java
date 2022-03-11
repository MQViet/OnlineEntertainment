package com.poly.DAO;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.Utils.JpaUtils;

public class AbstractDAO<T> {
	public static final EntityManager em = JpaUtils.getEntityManager();

	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public T findById(Class<T> c, String id) {
		return em.find(c, id);
	}

	public List<T> findAll(Class<T> c, boolean iA) {
		String Ename = c.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("select o from ").append(Ename).append(" o");
		if (iA == true) {
			sql.append(" where isActive = 1");
		}
		TypedQuery<T> query = em.createQuery(sql.toString(), c);
		return query.getResultList();
	}

	public T findOne(Class<T> c, String sql, Object... param) {
		TypedQuery<T> query = em.createQuery(sql, c);
		for (int i = 0; i < param.length; i++) {
			query.setParameter(i, param[i]);
		}
		List<T> reList = query.getResultList();
		if (reList.isEmpty()) {
			return null;
		}
		return reList.get(0);
	}

	public List<T> findMany(Class<T> c, String sql, Object... param) {
		TypedQuery<T> query = em.createQuery(sql, c);
		for (int i = 0; i < param.length; i++) {
			query.setParameter(i, param[i]);
		}
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Object[]> findByNative(String sql, Object... param) {
		Query query = em.createNativeQuery(sql);
		for (int i = 0; i < param.length; i++) {
			query.setParameter(i, param[i]);
		}
		return query.getResultList();
	}

	public T insert(T entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			System.out.println("Insert Succeed");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot insert " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}

	public T update(T entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			System.out.println("Update Succeed");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot update " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}

	public T delete(T entity) {
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			System.out.println("Delete Succeed");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot delete " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> callStored(String name, Map<String, Object> param) {
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery(name);
		param.forEach((key, value) -> query.setParameter(key, value));
		return (List<T>) query.getResultList();
	}
}
