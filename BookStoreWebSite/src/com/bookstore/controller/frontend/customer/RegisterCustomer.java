package com.bookstore.controller.frontend.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CustomerServices;

@WebServlet("/register_customer")
public class RegisterCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		CustomerServices CustomerServices = new CustomerServices(request, response);
		CustomerServices.createCustomer();
	}

}
