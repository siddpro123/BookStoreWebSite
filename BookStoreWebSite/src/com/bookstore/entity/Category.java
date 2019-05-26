package com.bookstore.entity;
// Generated Apr 16, 2019 10:47:01 PM by Hibernate Tools 5.2.12.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "category", catalog = "bookstoredb")
@NamedQueries(value = { @NamedQuery(name = "Category.findAll", query = "SELECT c from Category c ORDER BY c.name"),
		@NamedQuery(name = "Category.countAll", query = "SELECT Count(*) FROM Category"),
		@NamedQuery(name = "Category.findByName", query = "SELECT c from Category c ORDER BY c.name= :name")})
public class Category implements java.io.Serializable {

	private int categoryId;
	private String name;
	private Set <Book> books = new HashSet<Book>(0);

	public Category() {
	}

	public Category(int categoryId, String name) {
		this.categoryId = categoryId;
		this.name = name;
	}

	public Category(int categoryId, String name, Set books) {
		this.categoryId = categoryId;
		this.name = name;
		this.books = books;
	}

	public Category(String string) {
		// TODO Auto-generated constructor stub
	}

	@Id

	@Column(name = "category_id", unique = true, nullable = false)
	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "name", nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, targetEntity = Book.class , mappedBy = "category")
	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}

}
