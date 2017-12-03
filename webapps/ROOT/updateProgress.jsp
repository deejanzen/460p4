<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.buildRecord;"%>
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
			#buildProgressTable th, #buildProgressTable td {
			  text-align: left;
			  padding: 12px;
			}
			#buildProgressTable tr {
			  border-bottom: 1px solid #ddd;
			}
			#buildProgressTable {
				border-collapse: collapse;
				width: 100%;
				font-size: 18px;
				display:inline; 
				padding: 0;
				margin: 0;
				table-layout: fixed;
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
								
				<table id="buildProgressTable">
				<tr>
					<th style="width:30%;">OrderID</th>
					<th style="width:40%;">PartName</th>
					<th style="width:30%;">Status</th>
				</tr>		
				<%				
					DBController dbc = new DBController();
					dbc.connect();
					
					ArrayList<buildRecord> buildList = dbc.show_all_build();
					
					if (buildList != null && buildList.size() > 0) {
						for (int i = 0; i < buildList.size(); i++) {
							String order_ID = buildList.get(i).get_orderID();
							String order_Status = buildList.get(i).get_partID();
							String part_Name = buildList.get(i).get_status(); 
							
							if (order_ID.equals(orderID)) {
								out.write("<tr>");
								out.write("<td>" + order_ID + "</td>");
								out.write("<td>" + part_Name + "</td>");
								out.write("<td>" + order_Status + "</td>");
								out.write("</tr>");
							}
						}
					}	

					dbc.disconnect();
				%>
				</table>
				<script>		
				</script>	
	
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