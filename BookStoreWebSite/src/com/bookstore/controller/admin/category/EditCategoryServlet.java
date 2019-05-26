package com.bookstore.controller.admin.category;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CategoryServices;
import com.bookstore.service.UserServices;


@WebServlet("/admin/edit_Category")
public class EditCategoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
   
    public EditCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices CategoryServices = new CategoryServices(request, response);
		CategoryServices.editCategory();
		
	}

	
}
