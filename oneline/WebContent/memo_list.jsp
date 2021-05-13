<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "woehddb5555!"; 
	Connection con = null;
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); //select
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString("memo");
		String wdate = rs.getString(3);
		out.println("일련번호"+ no + ": " + memo +" :(" + wdate 
		+ "<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no="+no+"'\"><br>");
	}
	rs.close();
	pstmt.close();
	con.close();
	out.println("DB조회 성공<br>");
%>
<input type="button" value="메모작성" onclick="location.href='memo_form.html'">
</body>
</html>