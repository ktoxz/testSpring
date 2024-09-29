package com.example.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.db.PostDbUtil;

public class Applicant {
	int userId;
	int companyId;
	Post post;
	boolean isAccept = false;
	
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

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public boolean isAccept() {
		return isAccept;
	}

	public void setAccept(boolean isAccept) {
		this.isAccept = isAccept;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
	
}
