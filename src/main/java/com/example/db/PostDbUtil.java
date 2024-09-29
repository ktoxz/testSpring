package com.example.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.manager.DatabaseManager;
import com.example.model.Company;
import com.example.model.Post;
import com.example.model.User;

public class PostDbUtil extends DatabaseUtil{
	private static PostDbUtil ins = null;

    public static PostDbUtil getInstance() {
        if (ins == null) {
            ins = new PostDbUtil();
        }
        return ins;
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

	
	public List<Post> getPostsByIdList(int id) throws SQLException {
		return getPosts("SELECT * FROM post where company_id = "+id);
	}
	
	public List<Post> getRandomPost(int amount) throws SQLException {
		String query = "Select * from post order by rand()";
		if(amount != 0) query+=" limit "+amount;
		return getPosts(query);
	}
	
	public List<Post> getPosts(String query) throws SQLException{
		ResultSet myRs = null;
		myRs = askQuery(query);
		System.out.println(query);
		List<Post> posts = new ArrayList<Post>();
		while (myRs.next()) {
			posts.add(new Post(myRs));
		}
		return posts;
		
	}
	
	public Post GetPost(int id) throws SQLException {
		ResultSet myRs = null;
		String sql = "SELECT * FROM post where id = "+id;
		myRs = askQuery(sql);
		System.out.println(sql);
		Post post = null;
		while (myRs.next()) {
			post = new Post(myRs);
		}
		return post;

	}
	
	public boolean UpdatePost(int postId, String title, String description, String experience, int quantity,
            String address, String deadline, double salary, String type, String category) 
            throws SQLException {
		String sql = "UPDATE post "
		     + "SET title = ?, description = ?, exp = ?, hire = ?, address = ?, deadline = ?, "
		     + "salary = ?, type = ?, category = ? "
		     + "WHERE id = ?";
		
		try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
			myStmt.setString(1, title);
			myStmt.setString(2, description);
			myStmt.setString(3, experience);
			myStmt.setInt(4, quantity);
			myStmt.setString(5, address);
			myStmt.setString(6, deadline);
			myStmt.setDouble(7, salary);
			myStmt.setString(8, type);
			myStmt.setString(9, category);
			myStmt.setInt(10, postId);
			
			System.out.println(myStmt);
			myStmt.executeUpdate();
			Post post = GetPost(postId);
			// Cập nhật lại thông tin đối tượng Post
			post.setTitle(title);
			post.setDescription(description);
			post.setExp(experience);
			post.setHire(quantity);
			post.setAddress(address);
			post.setDeadline(Date.valueOf(deadline));
			post.setSalary(salary);
			post.setType(type);
			post.setCategory(category);
			return true;
		} catch(Exception e) {
			return false;
		}
		
	}
	
	public void DeletePost(int id) throws SQLException {
		PreparedStatement myStmt = null;
		String 	sql = "delete from post where "
				+ "id = ?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, id);
		System.out.println(myStmt.toString());
		myStmt.execute();
	}
	
	
}
