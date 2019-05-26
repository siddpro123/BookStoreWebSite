package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
		super();
	}

	@Override
	public Category create(Category category) {
		
		return super.create(category);
	}

	@Override
	public void delete(Object id) {
		super.delete(Category.class, id);
		
	}
	
	@Override
	public Category update(Category category) {
		
		return super.update(category);
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Category.countAll");
	}

	@Override
	public Category get(Object id) {
		return super.find(Category.class, id);
	}
	
	public Category findByName( String CategoryName) {
		List<Category> result = super.findWithNamedQuery("Category.findByName","name", CategoryName);
		if (result != null && result.size() > 0)
		{
			return result.get(0);
		}
		return null;
	}


}
