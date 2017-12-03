<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
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
	
	<div id="loginbox">
	<h2>Register</h2>
	<form action="register.jsp">
		UserID    <input type="text" id="userid" name="userid">
		<br> 
		Password <input type="text" id="password" name="password"> 
		<br> 
		FirstName <input type ="text" id="name" name="fname">
        <br>
		LastName <input type ="text" id="name" name="lname">
        <br>
		<button type="submit" value="submitBtn" name="submitBtn"> register</button>
		<button type="button" onclick="window.location.href='login.jsp'">Back</button>
		<p id="result"></p>
		</form>
	</div>
 	<%
		if (request.getParameter("submitBtn") == null){
			return;
		}
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
	
		int result = 0;
	
		if(result == 0){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('registeration complete');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}
		else if (result == 1){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('this userid has already been used');");
			out.println("location='register.jsp';");
			out.println("</script>");

		}
		else if (result == 2){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('one of the information is not valid');");
			out.println("location='register.jsp';");
			out.println("</script>");

		}
		out.write(result+"");
	%>
</body>
</html>