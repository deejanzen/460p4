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
			#orderProgressTable th, #orderProgressTable td {
			  text-align: left;
			  padding: 12px;
			}
			#orderProgressTable tr {
			  border-bottom: 1px solid #ddd;
			}
			#orderProgressTable {
				border-collapse: collapse;
				width: 100%;
				font-size: 18px;
				display:inline; 
				padding: 0;
				margin: 0;
				table-layout: fixed;
			}
			#orderProgressTable tr:hover:not(.header) {
				background-color: #eee;
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
								
				<table id="orderProgressTable">
				<tr class="header">
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
							String part_Name = buildList.get(i).get_partID();
							String order_Status = buildList.get(i).get_status(); 
							
							if (order_ID.equals(orderID)) {
								out.write("<tr>");
								out.write("<td>" + order_ID + "</td>");
								out.write("<td>" + part_Name + "</td>");
								if (order_Status.equals("F")){
									out.write("<td style=\"color:red\">" + order_Status + "</td>");
								}
								else{
									out.write("<td style=\"color:green\">" + order_Status + "</td>");
								}

								out.write("</tr>");
							}
						}
					}	

					dbc.disconnect();
				%>
				</table>
				<script>
					//var table = document.querySelector('orderProgressTable');
					function addRowHandlers() {
						var rows = document.getElementById("orderProgressTable").rows;
						for (i = 0; i < rows.length; i++) {
							rows[i].onclick = function(){ 
								return function(){
									if (i != 0){
										if (this.cells[2].innerHTML = "F"){
											this.cells[2].innerHTML = "T";
											this.cells[2].style.color = "green";
										}
									}
								};
							}(rows[i]);
						}
					}
					window.onload = addRowHandlers();			
				</script>	
	
			</fieldset>
			
			<button type="submit" id="submitUndoBtn" name="submitUndoBtn"> Undo Update</button>
			<button type="submit" id="submitConfirmBtn" name="submitConfirmBtn"> Comfirm Update</button>
		</form>
	</center>
	</div>

	
	<%	
		if (request.getParameter("submitConfirmBtn") == null && request.getParameter("submitUndoBtn") == null){
			return;
		}
		if (request.getParameter("submitUndoBtn") != null){
			return;
		}
	
	%>
	
	</body>
	

</html>