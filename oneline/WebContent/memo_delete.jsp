<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("no");
	
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "woehddb5555!";
	Connection con = null;
	String sql = "delete from oneline(memo) where no = ?";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd);

	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, no);
	pstmt.executeUpdate();//?들을 채운다음에 실행해야한다.
	pstmt.close();
	con.close();
	out.println("데이터 삭제 성공");
%>
<button onclick="location='memo_form.html'" style="font-size: 20pt">작성</button>
</body>
</html>
