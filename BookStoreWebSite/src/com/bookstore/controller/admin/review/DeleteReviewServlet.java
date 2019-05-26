package com.bookstore.controller.admin.review;

import java.io.IOException;

import javax.persistence.EntityManager;
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


@WebServlet("/admin/delete_review")
public class DeleteReviewServlet extends HttpServlet {
	
	public DeleteReviewServlet() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewServices reviewServices = new ReviewServices(request, response);
		reviewServices.deleteReview();
	}


}
