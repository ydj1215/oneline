<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>웹 서비스 실습</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
	* {
			font-family: 'Poor Story', cursive;
			text-align: center;
		}
	#postIt {
	 border: 3px solid black;
	 background-color: yellow;
	 width: 700px;
	 margin: auto;
	}
	
	#text {
	 font-size: 20px;
	}
	
	#box {
	 width : 400px;
	 height : 30px;
	 text-align: left;
	 font-size: 25px;
	 border: solid black 2px;
	}
	
	#button {
		box-sizing: border-box;
		height: 30px;
		width: 100px;
		margin: 10px;
		border: solid 2px;
		border-radius: 7px;
		background-color: #CCCC33;
	}
	
    #button:hover {
		background-color: black;
		color: white;
		border-color:black;
	}
	
	hr {
		border: solid black;
	}
	p {
	 font-size: 25px;
	 margin: 40px auto;
	}
	
	p input {
		box-sizing: border-box;
		height: 30px;
		width: 40px;
		border: solid 2px;
		border-radius: 10px;
		background-color: #FF0000;
		font-size: 20px;
		font-weight: bold;
	}
	
	p input:hover {
		background-color: black;
		color: white;
		border: solid black;
	}
</style>
</head>
<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "woehddb5555!"; 
	Connection con = null;
	String sql = "select * from oneline order by no desc";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<body style="background-color: #FFCC66;">
<div id="postIt">
	<h1><ins>메모장</ins></h1>
		<form method="post" action="memo_write.jsp">
	<div>
		<input id ="box" type="text" name="memo" placeholder="한줄 메모를 입력해주세요."></input>
		<br>	
		<label><input id="button" type="submit" value="등록"></input></label>
	</div>
	</form>
	
	<hr>
<%
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString("memo");
		String wdate = rs.getString(3);
		out.println("<p>("+wdate+") "+ memo + 
		"<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no="+no+"'\"><br>");
		out.println("</input></p>");
	}	
	rs.close();
	pstmt.close();
	con.close();
%>
</div>
</html>