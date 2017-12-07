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
			<button type="button" style="float: left;" onclick="window.location.href='query1.jsp'">Member Login</button>
			<button type="button" style="float: right;" onclick="window.location.href='updateShipStatus.jsp'">New Member</button>
			<br>
			<button type="button" onclick="window.location.href='query3.jsp'">Query Question #3</button>
			&nbsp;&nbsp;
			<button type="button" onclick="window.location.href='query4.jsp'">Query Question #4</button>
			<br>
			<button type="button" onclick="window.location.href='query5.jsp'">Query Question #5</button>
			<br>
			<br>
			<button type="button" onclick="window.location.href='managerPage.jsp'">Manager Login</button>
			<br>
			<br>
			<button type="button" onclick="window.location.href='custLogin.jsp'">Customer</button>
			<br>
		</form>
	</div>
	<%


	%>
</body>
</html>
