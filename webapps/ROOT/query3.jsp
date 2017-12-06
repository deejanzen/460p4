<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.vipRecord, dbController.partRecord, dbController.deptRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add New Order</title>
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
			#shipOrderTable th, #shipOrderTable td {
			  text-align: left;
			  padding: 12px;
			}

			#shipOrderTable tr {
			  border-bottom: 1px solid #ddd;
			}

			#shipOrderTable fixedHeader, #shipOrderTable tr:hover {
				background-color: #f1f1f1;
			}
			thead.fixedHeader tr {
				position: relative;
				text-align: left;
				width: 100%;
				display: block;
			}
			#shipOrderTable {
				border-collapse: collapse;
				width: 100%;
				font-size: 18px;
				display:inline; 
				padding: 0;
				margin: 0;
				table-layout: fixed;
			}
			tbody.shipOrderTableBody {
				display: block;
				height: 300px;
				overflow-y: auto;
				overflow-x: hidden;
				width: 100%;
				padding: 0;
				margin: 0;
			}
			#shipOrderTable tr:hover:not(.fixedHeader) {
				background-color: #eee;
			}			
		</style>
	</head>
	<body>
	<div id="addNewOrderBox">

	<center>
		<h2>Query Question #3</h2>
		<br>
		<h3> Show The Customer Who Spent The Most
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			DBController dbc = new DBController();
		%>
		</h3>
		<form action="query3.jsp" method="post">
			<fieldset id = "field1">
				<legend>Table For Summary of Customer Total Spent:</legend>								
				<h3>
					<table id="shipOrderTable">
					<thead class="fixedHeader">
						<tr>
							<th style="width:40%;">Customer ID</th>
							<th style="width:60%;">Total Spent</th>
						</tr>
					</thead>
					<tbody class="shipOrderTableBody" align="center">
					<%			
						dbc.connect();	
						ArrayList<vipRecord> custList = dbc.show_all_rich_guy();						
						dbc.disconnect();
													
						if (custList != null && custList.size() > 0) {
							for (int i = 0; i < custList.size(); i++) {
								out.write("<tr>");
								out.write("<td>" + custList.get(i).get_custID() + ": </td>");	
								out.write("<td>" + custList.get(i).get_totalSpent() + "</td>");	
								out.write("</tr>");									
							}
						}		
					%>
					</tbody>
					</table>					
				</h3>								
			</fieldset>
			<br>
			<button type="submit" id="viewBtn" name="viewBtn"> Display</button>
		</form>
	</center>
	</div>	
	<%
	if (request.getParameter("viewBtn") == null){
		return;
	}
	%>
	</body>
</html>