package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.text.DefaultEditorKit.CutAction;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;

public class CustomerServices {
		private BookDAO bookDAO ;
		private CustomerDAO customerDAO;
		private HttpServletRequest request;
		private HttpServletResponse response;
		

		public CustomerServices(HttpServletRequest request,
			HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO();
		customerDAO = new CustomerDAO();
	}
		public void listCustomers (String Message) throws ServletException, IOException {
			List<Customer>  listCustomer = customerDAO.listAll();
			
			request.setAttribute("listCustomer",listCustomer);
			
			if (Message !=null)
			{
				request.setAttribute("message",Message);
			}		
			String listPage = "customer_list.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
		
		}
		
		public void listCustomers() throws ServletException, IOException {
			listCustomers (null);
		}


		public void createCustomer() throws ServletException, IOException {
			String email =  request.getParameter("email");
			Customer existCustomer = customerDAO.findByEmail(email);
			if ( existCustomer !=null)
			{
				String message ="could not create a new customer because the email"+ email +"is already exist";
				listCustomers(message);
				return;
			}else
			{
				Customer newCustomer = new Customer();
				updateCustomerFieldsFromForm(newCustomer);
				customerDAO.create(newCustomer);
				String message = "New customer has been created";
				listCustomers(message);
			}
		}
		
		private void updateCustomerFieldsFromForm( Customer customer) {
			String email =  request.getParameter("email");
			String fullName =  request.getParameter("fullName");
			String password =  request.getParameter("password");
			String phone =  request.getParameter("phone");
			String address =  request.getParameter("address");
			String city =  request.getParameter("city");
			String zipCode =  request.getParameter("zipCode");
			String country =  request.getParameter("country");
			
			if ( email == null || email.equals("")) {
				customer.setEmail(email);
			}
	
			customer.setFullname(fullName);
			if(password !=null && !password.equals(""))
			{
				customer.setPassword(password);
			}

			customer.setPhone(phone);
			customer.setAddress(address);
			customer.setCity(city);
			customer.setZipcode(zipCode);
			customer.setCountry(country);
			
		}
		public void registerCustomer() throws ServletException, IOException {
			String email =  request.getParameter("email");
			Customer existCustomer = customerDAO.findByEmail(email);
			String message = " ";
			if ( existCustomer !=null)
			{
				message ="could not create a new customer because the email"+ email +"is already exist";
				listCustomers(message);
				return;
			}else
			{
				Customer newCustomer = new Customer();
				updateCustomerFieldsFromForm(newCustomer);
				customerDAO.create(newCustomer);
				message = "you have been registered successfully <br/> <a href='login'>Click here,</a> to login";
			
			}
			String messagePage = "frontend/message.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
			request.setAttribute(message, message);
			requestDispatcher.forward(request, response);
		}
		
		public void editCustomer() throws ServletException, IOException{
			Integer customerId = Integer.parseInt(request.getParameter("id"));
			Customer customer = customerDAO.get(customerId);
			request.setAttribute("customer", customer);
			
			List<Customer> listCustomer = customerDAO.listAll();
			request.setAttribute("listCustomer", listCustomer);
			
			String editPage = "customer_form.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage );
			requestDispatcher.forward(request, response);
		}

		public void updateCustomer() throws ServletException, IOException {

			int customerId = Integer.parseInt(request.getParameter("customerId"));
			String email =  request.getParameter("email");
			Customer existCustomer = customerDAO.findByEmail(email);

			
			if (existCustomer != null && !(existCustomer.getCustomerId() !=customerId))
			{
				String message ="could not update customer because the email"+ email +"is already exist";
				listCustomers(message);
				return;
			}
			else
			{
				
				
				Customer customerById = customerDAO.get(customerId);
				updateCustomerFieldsFromForm(customerById);
				
				customerDAO.update(customerById);
				String message = "New customer has been updated";
				listCustomers(message);
			}
			
			String message = " the book has been updated successfully";
			listCustomers(message);
		}

		public void deleteCustomer() throws ServletException, IOException {
			int customerId = Integer.parseInt(request.getParameter("customerId"));
			customerDAO.delete(customerId);
			String message = "the customer"+ customerId +" has been deleted successfully";
			listCustomers(message);
		}
		
//		public void showBookNewForm() throws ServletException, IOException {
//			List<Category> listCategory = categoryDAO.listAll();
//			request.setAttribute("listCategory", listCategory);
//			String newPage = "book_form.jsp";
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
//			requestDispatcher.forward(request, response);
//			
//		}
//		
//		public void readBookFields(Book book) throws ServletException, IOException {
//			String title =  request.getParameter("title");
//			String author =  request.getParameter("author");
//			String discription =  request.getParameter("discription");
//			String isbn =  request.getParameter("isbn");
//			float price = Float.parseFloat(request.getParameter("price"));
//			DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
//			Date publishDate = null;
//			
//			try {
//				publishDate = dateFormat.parse(request.getParameter("publishDate"));
//			} catch (ParseException ex) {
//				throw new ServletException("Error parsing publish date(format is MM/DD/YYYY)");
//			}
//			
//			book.setTitle(title);
//			book.setAuthor(author);
//			book.setDescription(discription);
//			book.setIsbn(isbn);
//			book.setPublishDate(publishDate);
//			Integer CategoryId = Integer.parseInt(request.getParameter("category"));
//			Category category = categoryDAO.get(CategoryId);
//			book.setCategory(category);
//			book.setPrice(price);
//			
//			
//			Part part = request.getPart("bookImage");
//			
//			if ( part !=null && part.getSize() >0) {
//				long size =part.getSize();
//				byte[] imageBytes = new byte [(int)size];
//				
//				//reading the image data through an array
//				InputStream inputStream = part.getInputStream();
//				inputStream.read(imageBytes);
//				inputStream.close();
//				book.setImage(imageBytes);
//			}
//			
//		}
//		public void listBooksByCategory() throws ServletException, IOException {
//			int categoryId = Integer.parseInt(request.getParameter("id"));
//			List<Book> listBooks =bookDAO.listByCategory(categoryId);
//			Category category = categoryDAO.get(categoryId);
//			
//			
//			
//			request.setAttribute("listBooks", listBooks);
//			request.setAttribute("category", category);
//			
//			String listPage = "frontend/books_list_by_category.jsp";
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher (listPage);
//			requestDispatcher.forward(request, response);
//		}
//		public void viewBookDetails() throws ServletException, IOException {
//			int bookId = Integer.parseInt(request.getParameter("id"));
//			Book book=bookDAO.get(bookId);
//			
//			request.setAttribute("Book", book);
//			
//			String listPage = "frontend/book_detail.jsp";
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher (listPage);
//			requestDispatcher.forward(request, response);
//		}
//		public void search() throws ServletException, IOException {
//			String keyword = request.getParameter("keyword");
//			List<Book> result = null;
//			if(keyword.equals(""))
//			{
//				result = bookDAO.listAll();
//			}else {
//				result=bookDAO.search(keyword);
//			}
//			request.setAttribute("keyword",keyword);
//			request.setAttribute("result",result);
//			String resultPage = "frontend/search_result.jsp";
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher (resultPage);
//			requestDispatcher.forward(request, response);
//		}
		public void showLogin() throws ServletException, IOException {
			String loginPage = "frontend/login.jsp";
			RequestDispatcher dispatcher =  request.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);
		}
		
		public void doLogin() throws ServletException, IOException {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Customer customer = customerDAO.checkLogin(email, password);
			if ( customer == null) {
				String message = "login failed.please check email and password";
				request.setAttribute("message", message);
				showLogin();
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loggedCustomer", customer);
				
				Object objRedirectURL = session.getAttribute("redirectURL");
				if(objRedirectURL != null)
				{
					String redirectURL = (String) objRedirectURL;
					session.removeAttribute("redirectURL");
					response.sendRedirect(redirectURL);
				}
				else
				{
					showCustomerProfile();
				}
			}
		}
		
		public void showCustomerProfile() throws ServletException, IOException {
			String profilePage = "frontend/customer_profile.jsp";
			RequestDispatcher dispatcher =  request.getRequestDispatcher(profilePage);
			dispatcher.forward(request, response);
		}
		
		public void showCustomerProfileEditForm() throws ServletException, IOException {
			String profilePage = "frontend/edit_profile.jsp";
			RequestDispatcher dispatcher =  request.getRequestDispatcher(profilePage);
			dispatcher.forward(request, response);
		}
		public void updateCustomerProfile() throws ServletException, IOException {
			Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
			updateCustomerFieldsFromForm(customer);
			customerDAO.update(customer);
			showCustomerProfile();
		}
	
	
}
