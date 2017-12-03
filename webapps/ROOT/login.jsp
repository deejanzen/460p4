<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<style>
	#loginbox {
		border: 2px solid black;
		border-radius: 5px;
		text-align: center;
		padding: 20px;
		height: 200px;
		width: 400px;
		position:relative;
		left:35%;
	}
</style>
<body>
	<h2>Login</h2>
	<div id="loginbox">
		<form action="login.jsp">
			UserID <input type="text" id="userid" name="userid"> 
			<br>
			Password <input type="password" id="password" name="password">
			<br>
			<button type="submit" value="submitBtn" name="submitBtn"> login</button>
			<br>
			<button type="button" onclick="window.location.href='register.jsp'">Register</button>
			<br>
			<button type="button" onclick="window.location.href='managerPage.jsp'">Manager</button>
			<br>
			<button type="button" onclick="window.location.href='customerPage.jsp'">Customer</button>
		</form>
	</div>
	<%
		if (request.getParameter("submitBtn") == null){
			return;
		}
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("password");
		session.setAttribute("userID",userid);
		session.setAttribute("userType","1");
		
		int userType = 0;
		
		if(userType == 1){
			response.sendRedirect("customerPage.jsp");
			session.setAttribute("userType","1");
		}
		if(userType ==2 ){
			response.sendRedirect("managerPage.jsp");
			session.setAttribute("userType","2");
		}
		else if(userType == 0){
			out.write("<h1>your userid or password is not correct!</h1>");
		}
	
	%>
</body>
</html>