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

public class CompanyDbUtil extends DatabaseUtil{
	private static CompanyDbUtil ins = null;

    public static CompanyDbUtil getInstance() {
        if (ins == null) {
            ins = new CompanyDbUtil();
        }
        return ins;
    }
	
	public Company getCompany(int id) throws SQLException {
		ResultSet myRs = null;
		String sql = "SELECT * FROM Company where id = "+id;
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
	
	
}
