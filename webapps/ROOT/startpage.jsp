<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<style>
	#startbox {
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
	<h1>Welcome to Infinite Improbability Intergalactic Inc</h1>
	<div id="startbox">
		I am a:
		<form action="startpage.jsp">
			<br>
			<button type="button" onclick="window.location.href='createNewCust.jsp'">New Customer</button>
			<br><br>
			<button type="button" onclick="window.location.href='custLogin.jsp'">Existing Customer</button>
			<br><br>
			<button type="button" onclick="window.location.href='managerPage.jsp'">Manager</button>
			<br>
		</form>
	</div>
	<%


	%>
</body>
</html>
