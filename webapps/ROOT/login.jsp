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
			<br>
			<br>
			<button type="button" onclick="window.location.href='managerPage.jsp'">Manager</button>
			<br>
			<br>
			<button type="button" onclick="window.location.href='customerPage.jsp'">Customer</button>
		</form>
	</div>
	<%

	
	%>
</body>
</html>