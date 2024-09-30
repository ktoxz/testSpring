package com.example.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Applicant;
import com.example.model.Company;
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
		myStmt.setBoolean(4, apply.getIsAccept());
		System.out.println(myStmt.toString());
		try {
			myStmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
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
	
	public void AcceptApply(int id, int postID)
	        throws SQLException {
	    String sql = "UPDATE applicant "
	            + "SET accepted = true "
	            + "WHERE user_id = ? and post_id = ?";

	    try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
	        myStmt.setInt(1, id);
	        myStmt.setInt(2, postID);
	        System.out.println(myStmt);
	        myStmt.executeUpdate();
	    }
	}
    
}
