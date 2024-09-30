package com.example.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.db.CompanyDbUtil;
import com.example.db.PostDbUtil;
import com.example.db.UserDbUtil;

public class Applicant {
	int userId;
	int companyId;
	Post post;
	boolean isAccept = false;
	User user;
	Company company;
	
	public Applicant(int u, Post post) {
		this.userId = u;
		this.post = post;
		this.companyId = post.getCompanyId();
	}
	
	public Applicant(ResultSet rs) throws SQLException {
		this.userId = rs.getInt("user_id");
		this.companyId = rs.getInt("company_id");
		this.post = PostDbUtil.getInstance().GetPost(rs.getInt("post_id"));
		this.isAccept = rs.getBoolean("accepted");
		this.user = UserDbUtil.getInstance().getUser(userId);
		this.company = CompanyDbUtil.getInstance().getCompany(companyId);
	}
	
	public int getUserId() {
		return userId;
	}
	

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCompanyId() {
		return companyId;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	
	public Company getCompany(){
		return company;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public boolean getIsAccept() {
	    return isAccept;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
	
}
