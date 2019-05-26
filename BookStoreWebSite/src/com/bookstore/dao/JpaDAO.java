package com.bookstore.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityGraph;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.FlushModeType;
import javax.persistence.LockModeType;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.metamodel.Metamodel;

import com.bookstore.entity.Book;
import com.bookstore.entity.Users;

public class JpaDAO <E> {
	
	//instance of entity manager 
	private static EntityManagerFactory entityManagerFactory;
	static {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
	}
	protected EntityManager entityManager;

	public JpaDAO() {
	}
	
	public  E create(E entity){
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		
		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	public E update(E entity) {
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		entity = entityManager.merge(entity);

		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	public E find(Class<E> type, Object id) {
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		E entity = entityManager.find(type, id);
		
		if (entity !=null)
		{
			entityManager.refresh(entity);
		}
		entityManager.close();
		return entity;
	}
	
	public void delete ( Class<E> type, Object id)
	{
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		Object reference = entityManager.getReference(type, id);
		entityManager.remove(reference);
		entityManager.getTransaction().commit();
		entityManager.close();
	}
	
	public List<E> findWithNamedQuery(String queryName)
	{
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
		
	}
	
	public List<E> findWithNamedQuery(String queryName, String paramName, Object paramValue)
	{
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setParameter(paramName, paramValue);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	public List<E> findWithNamedQuery(String queryName,Map<String, Object> parameters)
	{
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		Set<Entry<String, Object>> setParameters = parameters.entrySet();
		for(Entry<String, Object > entry: setParameters) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	public long countWithNamedQuery(String queryName) {
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		long result =  (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public long countWithNamedQuery(String queryName,String paramName, Object paramValue ) {
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setParameter(paramName, paramValue);
		long result =  (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public List<E> findWithNamedQuery(String queryName,int firstResult, int maxResult )
	{
		EntityManager entityManager =entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult);
		query.setFirstResult(maxResult);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
		
	}
}
