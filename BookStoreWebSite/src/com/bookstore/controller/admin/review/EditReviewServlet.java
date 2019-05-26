package com.bookstore.controller.admin.review;

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
import com.bookstore.service.ReviewServices;
import com.bookstore.service.UserServices;


@WebServlet("/admin/edit_review")
public class EditReviewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
   
    public EditReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewServices reviewServices = new ReviewServices(request, response);
		reviewServices.editReview();
		
	}

	
}
