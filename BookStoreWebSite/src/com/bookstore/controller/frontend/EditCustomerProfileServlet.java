package com.bookstore.controller.frontend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CategoryServices;
import com.bookstore.service.CustomerServices;
import com.bookstore.service.UserServices;


@WebServlet("/update_profile")
public class EditCustomerProfileServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
   
    public EditCustomerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerServices CustomerServices = new CustomerServices(request, response);
		CustomerServices.updateCustomerProfile();
	}

	
}
