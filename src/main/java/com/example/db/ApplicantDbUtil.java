package com.example.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Applicant;
import com.example.model.Post;

public class ApplicantDbUtil extends DatabaseUtil{
	private static ApplicantDbUtil ins = null;

    public static ApplicantDbUtil getInstance() {
        if (ins == null) {
            ins = new ApplicantDbUtil();
        }
        return ins;
    }
    
    
    public boolean RequestApply(Applicant apply) throws SQLException {
    	PreparedStatement myStmt = null;
		String sql = "INSERT INTO applicant (user_id, company_id, post_id, accepted)"
				+ "VALUES (?, ?, ?, ?)";
		myStmt = myConn.prepareStatement(sql);

		myStmt.setInt(1, apply.getUserId());
		myStmt.setInt(2, apply.getCompanyId());
		myStmt.setInt(3, apply.getPost().getId());
		myStmt.setBoolean(4, apply.isAccept());
		System.out.println(myStmt.toString());
		try {
			myStmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
    }
    
    public List<Applicant> getAppById(int userId) throws SQLException{
    	String query = "select * from applicant where user_id = "+userId;
    	return getApplicants(query);
    }
    
    
	public List<Applicant> getApplicants(String query) throws SQLException{
		ResultSet myRs = null;
		myRs = askQuery(query);
		System.out.println(query);
		List<Applicant> applicants = new ArrayList<Applicant>();
		while (myRs.next()) {
			applicants.add(new Applicant(myRs));
		}
		return applicants;
		
	}
    
}
