package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 데이터 접근 객체 DAO
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3307/BBS"; 
			String dbID = "root";
			String dbPassword = "toor";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public User getUser(String userID) {
		//String SQL = "SELECT * FROM USER WHERE userID = ?";
		String SQL = "SELECT * FROM USER WHERE userID = '" + userID + "'";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			//psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				return user;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
		
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = '" + userID + "'";
		try {
			pstmt = conn.prepareStatement(SQL);
			//pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // login success
				}
				else
					return 0; // password error
			}
			return -1; // id error
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB error
	}
	
	public int join(User user){
		//String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		String SQL = "INSERT INTO USER VALUES('" + user.getUserID() + "','" + user.getUserPassword() + "','" +
				user.getUserName() + "','" + user.getUserGender() + "','" + user.getUserEmail() + "')";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			/*
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			*/
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

