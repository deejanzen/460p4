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
	
	String partName = request.getParameter("partName");
	String partPrice = request.getParameter("partPrice");
	
	%>
	
	</body>
	

</html>