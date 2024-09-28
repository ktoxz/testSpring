package com.example.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.manager.DatabaseManager;

public class DatabaseUtil {
    protected static Connection myConn = null;
    private static DatabaseUtil ins = null;
    protected static DatabaseManager db;

    // Constructor protected để chỉ các lớp con mới có thể khởi tạo
    protected DatabaseUtil() {
        try {
            db = DatabaseManager.getInstance();
            myConn = db.myConn;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static DatabaseUtil getInstance() {
        if (ins == null) {
            ins = new DatabaseUtil();
        }
        return ins;
    }

    // Hàm thực hiện truy vấn SQL và trả về ResultSet
    protected ResultSet askQuery(String sql) throws SQLException {
        PreparedStatement myStmt = myConn.prepareStatement(sql);
        return myStmt.executeQuery();
    }

}
