<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<form method="post" action="signup_proc.jsp">
	ID : <input type="text" name="id"><br>
	PW : <input type="password" name="pw"><br>
	ÀÌ¸§ : <input type="text" name="name"><br>
	<input type="submit" value="È¸¿ø°¡ÀÔ">
</form>


signup_proc--------------------------------------------------------------------

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%			// 클라이언트 쪽 코드 (signup.jsp)에서 id라는 name을 가진 값을 가져온다.(getParameter) 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		// selec 코드를 그대로 가져와 insert로 사용한다. 
		String sql = "insert into member values (?, ?, ?)"; // values 값들을 제대로 모를때 
?를 사용한다. 하지만 권장하지 않는다. 
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, pw);
		stmt.setString(3, name);	
		stmt.executeUpdate();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>
