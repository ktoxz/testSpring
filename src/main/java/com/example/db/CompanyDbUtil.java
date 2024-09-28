package com.example.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.manager.DatabaseManager;
import com.example.model.Company;
import com.example.model.Post;
import com.example.model.User;

public class CompanyDbUtil {
	static Connection myConn = null;
	private static CompanyDbUtil ins = null;
	private static DatabaseManager db;

	public static CompanyDbUtil getInstance() {
		if (ins == null) {
			ins = new CompanyDbUtil();
			try {
				db = DatabaseManager.getInstance();
				myConn = db.myConn;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ins;
	}
	
	public Company getCompany(int id) throws SQLException {
		ResultSet myRs = null;
		String sql = "SELECT * FROM Company where user_id = "+id;
		myRs = askQuery(sql);
		System.out.println(sql);
		Company company = null;
		while (myRs.next()) {
			company = new Company(myRs);
		}
		return company;

	}
	
	public void UpdateCompany(Company company, String name, String email, String phone_number, String address, String description)
	        throws SQLException {
	    String sql = "UPDATE company "
	            + "SET name_company = ?, phone_number = ?, email = ?, address = ?, description = ? "
	            + "WHERE id = ?";

	    try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
	        myStmt.setString(1, name);
	        myStmt.setString(2, phone_number);
	        myStmt.setString(3, email);
	        myStmt.setString(4, address);
	        myStmt.setString(5, description);
	        myStmt.setInt(6, company.getId());
	        System.out.println(myStmt);
	        myStmt.executeUpdate();
	        
	        company.setNameCompany(name);
	        company.setPhoneNumber(phone_number);
	        company.setEmail(email);
	        company.setAddress(address);
	        company.setDescription(description);
	    }
	}
	
	public void AddPost(String title, String description, String exp, int hire, String address, 
            Date deadline, double salary, String type, String category, 
            int companyId, int userId) throws SQLException {
		String sql = "INSERT INTO post (title, description, exp, hire, address, deadline, salary, type, category, company_id, user_id) "
		       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
			myStmt.setString(1, title);
			myStmt.setString(2, description);
			myStmt.setString(3, exp);
			myStmt.setInt(4, hire);
			myStmt.setString(5, address);
			myStmt.setDate(6, deadline);
			myStmt.setDouble(7, salary);
			myStmt.setString(8, type);
			myStmt.setString(9, category);
			myStmt.setInt(10, companyId);
			myStmt.setInt(11, userId);
			
			System.out.println(myStmt);
			myStmt.executeUpdate();
		}
	}

	
	public List<Post> getPosts(int id) throws SQLException {
		ResultSet myRs = null;
		String sql = "SELECT * FROM post where company_id = "+id;
		myRs = askQuery(sql);
		System.out.println(sql);
		List<Post> posts = new ArrayList<Post>();
		while (myRs.next()) {
			posts.add(new Post(myRs));
		}
		return posts;

	}
	
	
	public ResultSet askQuery(String query) throws SQLException {
		System.out.println(query);
		Statement myStmt = null;
		ResultSet myRs = null;
		String sql = query;

		myStmt = myConn.createStatement();
		myRs = myStmt.executeQuery(sql);

		return myRs;
	}
}
