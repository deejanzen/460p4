<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add New Part</title>
		<style>
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
	</head>
	<body>
	<div id="addNewPartBox">

	<center>
		<h2>Add New Part</h2>
		<form action="addNewPart.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
				<h3>Enter Part Name: 
					<input type="text" name="partName" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>
				<h3>Enter Part Price: 
					<input type="text" name="partPrice" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>				
			</fieldset>
			
			<br>

			<button type="submit" id="submitBtn" name="submitBtn"> Add The Part</button>
		</form>
	</center>
	</div>
		
	
	<%
	if (request.getParameter("submitBtn") == null){
		return;
	}
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	

	DBController dbc = new DBController();
	
	//String partID_test = dbc.partIDGenerator();
	
	//out.println("<script type=\"text/javascript\">");
	//out.println("alert('" + partID_test + "');");
	//out.println("location='addNewPart.jsp';");
	//out.println("</script>");
	
	String partName = request.getParameter("partName");
	// Check if the partName is empty
	if (partName == ""){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Part Name Cannot Be Empty');");
		out.println("location='addNewPart.jsp';");
		out.println("</script>");
		return;
	}
	
	String partPrice = request.getParameter("partPrice");
	// Check if the partprice is empty
	if (partPrice == ""){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Part Price Cannot Be Empty');");
		out.println("location='addNewPart.jsp';");
		out.println("</script>");
		return;
	}
	dbc.connect();
	if (!dbc.isInteger(partPrice)){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Part Price Must Be An Integer');");
		out.println("location='addNewPart.jsp';");
		out.println("</script>");
		dbc.disconnect();
		return;
	}
	
	int result = dbc.addNewPart(partName, partPrice);
	out.println("<script type=\"text/javascript\">");
	out.println("alert('" + result + "');");
	out.println("location='addNewPart.jsp';");
	out.println("</script>");

	dbc.disconnect();
	%>
	
	</body>
	

</html>