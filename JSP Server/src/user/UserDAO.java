package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.*;
import jiri.DBInfo;

public class UserDAO {
    private Connection conn; 
    private PreparedStatement pstmt;
    private ResultSet rs; 

    public UserDAO() { 
        try {  
            Class.forName("com.mysql.jdbc.Driver");   
            conn = DriverManager.getConnection(
                    "jdbc:mysql://" + DBInfo.URL +
                    ":3306/member?user="+DBInfo.USER+"&password=" +DBInfo.DBPW
                ); 
        }catch(Exception e) {
            e.printStackTrace(); //오류발생시 오류내용 출력하게 해주는 소스
        }
    }

    public int login(String userID, String userPassword) {

        String SQL = "Select userPassword From user where userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(userPassword)) {
                    return 1; // 로그인 성공
                } else 
                    return 0; // 비밀번호 불일치
            }
            return -1; //아이디가 없음
        }catch(Exception e) {
            e.printStackTrace();    // 예외처리
        }
        return -2; // 데이터베이스 오류
    }  
    public int join(String userID, String userPassword) {
        String SQL = "INSERT INTO user VALUES (?,?)"; 
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            return pstmt.executeUpdate(); 
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; //데이처베이스 오류
    }
}