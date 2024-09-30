package	com.example.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.manager.DatabaseManager;
import com.example.model.Role;
import com.example.model.User;


public class UserDbUtil extends DatabaseUtil{

	public List<User> users = null;
	private static UserDbUtil ins = null;

    public static UserDbUtil getInstance() {
        if (ins == null) {
            ins = new UserDbUtil();
        }
        return ins;
    }

	public List<User> getUsers() throws SQLException {
		ResultSet myRs = null;
		String sql = "SELECT * FROM User";
		myRs = askQuery(sql);
		System.out.println(sql);
		users = new ArrayList<>();
		while (myRs.next()) {
			User student = new User(myRs);
			users.add(student);
		}
		return users;

	}
	
	public List<User> getUsers(String sql) throws SQLException {
		ResultSet myRs = null;
		myRs = askQuery(sql);
		System.out.println(sql);
		users = new ArrayList<>();
		while (myRs.next()) {
			User student = new User(myRs);
			users.add(student);
		}
		return users;

	}

	public User getUser(String email) {
		try {
			getUsers();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		for (User x : users)
			if (x.getEmail() == email)
				return x;
		return null;
	}
	
	public User getUser(int id) {
		try {
			getUsers();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		for (User x : users)
			if (x.getId() == id)
				return x;
		return null;
	}
	
	public User LoginUser(String email, String password) throws SQLException {
	    ResultSet myRs = null;
	    String sql = "SELECT * FROM User WHERE email = ? AND password = ?";
	    
	    try (PreparedStatement stmt = DatabaseManager.getInstance().myConn.prepareStatement(sql)) {
	        stmt.setString(1, email);
	        stmt.setString(2, password);
	        
	        myRs = stmt.executeQuery();
	        System.out.println("Executing query: " + stmt.toString());
	        
	        if (myRs.next()) {  // Di chuyển con trỏ đến hàng đầu tiên nếu có kết quả
	            return new User(myRs);  // Tạo đối tượng User từ ResultSet
	        } else {
	            return null;  // Không tìm thấy người dùng
	        }
	    } catch (SQLException e) {
	        throw new SQLException("Error while executing login query.", e);
	    }
	}

	
	public boolean RegisterUser(String fullname, String email, String password, int roleID) throws SQLException {
		PreparedStatement myStmt = null;
		String sql = "INSERT INTO user (full_name, email, password, role_id)"
				+ "VALUES (?, ?, ?, ?)";
		myStmt = myConn.prepareStatement(sql);

		myStmt.setString(1, fullname);
		myStmt.setString(2, email);
		myStmt.setString(3, password);
		myStmt.setInt(4, roleID); 
		System.out.println(myStmt.toString());
		try {
			myStmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	


//
	public void UpdateUser(User user, String fullname, String phonenumber, String email, String address, String description)
	        throws SQLException {
	    String sql = "UPDATE user "
	            + "SET full_name = ?, phone_number = ?, email = ?, address = ?, description = ? "
	            + "WHERE id = ?";

	    try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
	        myStmt.setString(1, fullname);
	        myStmt.setString(2, phonenumber);
	        myStmt.setString(3, email);
	        myStmt.setString(4, address);
	        myStmt.setString(5, description);
	        myStmt.setInt(6, user.getId());
	        System.out.println(myStmt);
	        myStmt.executeUpdate();
	        
	        user.setFullName(fullname);
	        user.setPhoneNumber(phonenumber);
	        user.setEmail(email);
	        user.setAddress(address);
	        user.setDescription(description);
	    }
	}

//
//	public User CheckLegit(String email, String password) throws SQLException {
//		ResultSet rSet = askQuery(
//				"select id, username, fullname, phoneNumber, status, roleid, email from user where password = '"
//						+ password + "' and email = '" + email + "'");
//		System.out.println("check3");
//		while (rSet.next()) {
//			User user = new User(rSet);
//			return user;
//		}
//		return null;
//	}
//	
//	public List<User> getUsers(int limit, int page) throws SQLException{
//		ResultSet myRs = null;
//		String sql = "SELECT * FROM user limit ? offset ?";
//		try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
//			// Set the parameters for the SQL statement
//			myStmt.setInt(1, limit);
//			myStmt.setInt(2, limit*page);
//			myRs = myStmt.executeQuery(sql);
//			users = new ArrayList<>();
//
//			while (myRs.next()) {
//				User student = new User(myRs);
//				users.add(student);
//			}
//			return users;
//		} catch (Exception e) {
//			return null;
//			// TODO: handle exception
//		}
//		
//		
//
//	}
//
//	public void statusUser(int id, int status) throws SQLException {
//		String sql = "UPDATE user "
//				+ "SET status = ? "
//				+ "WHERE id = ?";
//		try (PreparedStatement myStmt = myConn.prepareStatement(sql)) {
//
//			myStmt.setInt(1, status);
//			myStmt.setInt(2, id);
//			System.out.println(myStmt);
//			myStmt.executeUpdate();
//		}
//
//	}
//
//	public List<User> searchUser(String query) throws SQLException {
//		String sql = "SELECT * FROM user WHERE fullname LIKE ? OR email LIKE ? OR username LIKE ? OR phonenumber LIKE ?";
//		try (PreparedStatement pstmt = myConn.prepareStatement(sql)) {
//			String formattedQuery = "%" + query + "%";
//			pstmt.setString(1, formattedQuery);
//			pstmt.setString(2, formattedQuery);
//			pstmt.setString(3, formattedQuery);
//			pstmt.setString(4, formattedQuery);
//			System.out.println(pstmt);
//			ResultSet rSet = pstmt.executeQuery();
//			List<User> users = new ArrayList<>();
//			while (rSet.next()) {
//				User user = new User(rSet);
//				users.add(user);
//			}
//			return users;
//		}
//	}

}
