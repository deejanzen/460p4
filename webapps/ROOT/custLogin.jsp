<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.orderRecord, dbController.contractRecord;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Login</title>
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
	button {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: auto;
	}
</style>
<body>
	<h2>Login</h2>
	<div id="loginbox">
		<form action="custLogin.jsp" method="post">
			CustomerID <input type="text" id="custID" value="" name="custID"> 
			<br>
			FirstName <input type="text" id="fname" value="" name="fname">
			<br>
			LastName <input type="text" id="lname" value="" name="lname">
			<br>
			Email <input type="text" id="email" value="" name="email">
			<br>
			<button type="submit" value="submitBtn" name="submitBtn"> Login</button>	
		</form>
	</div>
	<%
	if(request.getParameter("submitBtn") == null){
		return;
	}
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	DBController dbc = new DBController();
		
	String cust_id = request.getParameter("custID");
	String cust_fname = request.getParameter("fname");
	String cust_lname = request.getParameter("lname");
	String cust_email = request.getParameter("email");
	
	if (cust_id != ""){
		// check if the customer id is in the database
		dbc.connect();
		if (dbc.verify_customerID(cust_id) != 1){
			dbc.disconnect();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('This Customer ID Is Not Exist\\nPlease Enter A New CustomerID\\Or You Can Fullfill The Blank Below To Create Your Profile');");
			out.println("location='custLogin.jsp';");
			out.println("</script>");
			return;
		}
		session.setAttribute("custID",cust_id);
		response.sendRedirect("customerPage.jsp");
		return;
	}
	
	if (cust_fname == "" || cust_lname == "") {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You Cannot Leave Your First Name and Last Name Empty If You Are New Customer');");
			out.println("location='custLogin.jsp';");
			out.println("</script>");
			return;
	}
	
	dbc.connect();
	
	cust_id = dbc.custIDGenerator();
	dbc.addNewCustomer(cust_id, cust_fname, cust_lname, cust_email);
	
	session.setAttribute("custID", cust_id);
	response.sendRedirect("customerPage.jsp");
	
	out.println("<script type=\"text/javascript\">");
	out.println("alert('You Customer ID is: " + cust_id + " \\n(Please Write It Down, Cuz You Won't See This Again In Your Life)');");
	out.println("location='custLogin.jsp';");
	out.println("</script>");
	
	dbc.disconnect();

	%>
</body>
</html>