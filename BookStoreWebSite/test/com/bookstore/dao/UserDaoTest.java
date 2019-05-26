package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.Test;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

class UserDaoTest {

	@Test
	public void testCreateUsers() {
		
		Users user1 = new Users();
		user1.setEmail("test@gmail.com");
		user1.setFullName("test test");
		user1.setPassword("13246456");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		UserDAO userDAO = new UserDAO();
		user1 = userDAO.create(user1);
		
		entityManager.close();
		entityManagerFactory.close();
		
		assertTrue(user1.getUserId() > 19);

	}

}
