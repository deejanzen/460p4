<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Update Order Progress</title>
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
	<div id="updateProgressBox">

	<center>
		<h2>Update Order Progress</h2>
		<form action="updateProgress.jsp" method="post">
			<fieldset id = "field1">
				<legend>Update Building Progress:</legend>				
								
				<h3>Updating Order Number:  
				<%
					request.setCharacterEncoding("utf-8");
					response.setContentType("text/html;charset=utf-8");
					
					String orderID = session.getAttribute("orderIDforUpdate").toString();		
					out.write(orderID);
					
				%>
				</h3>	
			</fieldset>
			
			<br>
			
			<fieldset id="field2">
				<legend>Part List:</legend>				
								
					<%
						request.setCharacterEncoding("utf-8");
						response.setContentType("text/html;charset=utf-8");
						
						DBController dbc = new DBController();
						dbc.connect();
						
						
					%>
	
			</fieldset>

			<button type="submit" id="submitBtn" name="submitBtn"> Comfirm Update</button>
		</form>
	</center>
	</div>

	
	<%	
	if (request.getParameter("submitBtn") == null){
		return;
	}
	
	%>
	
	</body>
	

</html>