<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Query Question #4</title>
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
			.bloc { 
				display:inline; 
				vertical-align:top; 
				overflow:scroll; 
				border:solid grey 1px; 
				overflow-x: hidden;
				position: absolute;
				min-width:50px; 
			}	
			table, th, td {
				border: 1px solid black;
				border-collapse: collapse;
			}
			th, td {
				padding: 5px;
				text-align: left;
			}			
		</style>
	</head>
	<body>
	<div id="addNewOrderBox">

	<center>
		<h2>Query Question #4</h2>
		<br>
		<h3> Indicate Which Department Has The Most Order:
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			DBController dbc = new DBController();
		%>
		</h3>
		<form action="query4.jsp" method="post">
			<fieldset id = "field1">
				<legend>Popular Department:</legend>								
				<table style="width:100%">
					<thead>
						<tr>
							<th style="width:40%;">Department</th>
							<th style="width:40%;">Ship Model</th>
							<th style="width:20%;">Order Count</th>
						</tr>
					</thead>
					<%			
						dbc.connect();	
						ArrayList<deptRecord> deptList = dbc.show_most_popular_dept();						
						dbc.disconnect();
													
						if (deptList != null && deptList.size() > 0) {
							for (int i = 0; i < deptList.size(); i++) {
								out.write("<tr>");
								out.write("<td>" + deptList.get(i).get_deptName() + " </td>");	
								out.write("<td>" + deptList.get(i).get_modelName() + " </td>");	
								out.write("<td>" + deptList.get(i).get_basePrice() + "</td>");	
								out.write("</tr>");									
							}
						}		
					%>				
				</table>
				
			</fieldset>
			
			
			<br>
		</form>
	</center>
	</div>	
	</body>
</html>