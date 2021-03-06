package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;

public class OrderDAO extends JpaDAO<BookOrder> implements GenericDAO<BookOrder> {

	@Override
	public BookOrder create(BookOrder order) {
        order.setOrderDate(new Date());
        order.setStatus("processing");
		return super.create(order);
	}

	@Override
	public BookOrder update(BookOrder order) {
		// TODO Auto-generated method stub
		return super.update(order);
	}

	@Override
	public BookOrder get(Object orderId) {
		
		return super.find(BookOrder.class, orderId);
	}
	
	public BookOrder get(Object orderId,Integer customerId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", orderId);
		parameters.put("customerId", customerId);
		List<BookOrder> result =  super.findWithNamedQuery("BookOrder.findByIdAndCustome",parameters);
		if(result.isEmpty())
		{
			return result.get(0);
		}
		
		return null;
	}

	@Override
	public void delete(Object orderId) {
		super.delete(BookOrder.class, orderId);
		
	}

	@Override
	public List<BookOrder> listAll() {
		
		return super.findWithNamedQuery("BookOrder.findAll");
	}

	@Override
	public long count() {
		
		return super.countWithNamedQuery("BookOrder.countAll");
	}
	
	public List<BookOrder> ListbyCustomer(Integer customerId){
		return super.findWithNamedQuery("BookOrder.findByCustomer","customerId",customerId);
		
	}

}
