<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.mysql.*" %>
<%@ page import="jiri.DBInfo" %>

<html>
    <head>
        <title>Hello World</title>
    </head>
    <body>
        <div>Hello World</div>
        <b>
        <%
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(
                        "jdbc:mysql://" + DBInfo.URL +
                        ":3306?user=" + DBInfo.USER + "&password=" + DBInfo.DBPW
                    ); 
                out.println(conn);
            }
           
            catch (SQLException e) {
            out.println(e); 
            }
            finally {
            	if (conn != null) conn.close();
            }
        %>
		</b>
    </body>
</html>