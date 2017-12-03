<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.orderRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Update Ship Status</title>
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
			#myInput {
				background-image: url('/css/searchicon.png');
				background-repeat: no-repeat;
				width: 100%;
				font-size: 16px;
				padding: 12px 20px 12px 40px;
				border: 1px solid #ddd;
				margin-bottom: 12px;
			}
			#shipOrderTable tr:hover:not(.fixedHeader) {
				background-color: #eee;
			}
		</style>
	</head>
	<body>
	<div id="scrapShipBox">

	
	<center>
		<h2>Update Ship Status</h2>
		<form action="updateShipStatus.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
								
				<h3>Enter The Order Number: 
					<input type="text" name="orderID" id="orderID" value="" onkeyup="myFunction()" placeholder="Search for Order.." title="Type in an order ID">
				</h3>				
			</fieldset>
			
			<br>

			<fieldset id = "field2">
				<legend>Click to Choose The Ship</legend>
				<h3>

				<table id="shipOrderTable">
					<thead class="fixedHeader">
						<tr>
							<th style="width:20%;">OrderID</th>
							<th style="width:20%;">ContractID</th>
							<th style="width:40%;">Department Name</th>
							<th style="width:20%;">Status</th>
						</tr>
					</thead>
					<tbody class="shipOrderTableBody" align="center">
					<%
						request.setCharacterEncoding("utf-8");
						response.setContentType("text/html;charset=utf-8");
						

						DBController dbc = new DBController();
						dbc.connect();
						
						ArrayList<orderRecord> orderList = dbc.show_all_order();
													
						if (orderList != null && orderList.size() > 0) {
							for (int i = 0; i < orderList.size(); i++) {
								String order_ID = orderList.get(i).get_orderID();
								String contract_ID = orderList.get(i).get_contractID();
								String dept_Name = orderList.get(i).get_deptName();
								String order_Status = orderList.get(i).get_status(); 
								
								if (order_Status.equals("Active")) {
									out.write("<tr>");
									out.write("<td>" + order_ID + "</td>");
									out.write("<td>" + contract_ID + "</td>");
									out.write("<td>" + dept_Name + "</td>");
									out.write("<td>" + order_Status + "</td>");
									out.write("</tr>");
								}
							}
						}							

						dbc.disconnect();
					%>
					</tbody>
				</table>

				<script>
				function myFunction() {
					var input, filter, table, tr, td, i;
					input = document.getElementById("orderID");
					filter = input.value.toUpperCase();
					table = document.getElementById("shipOrderTable");
					tr = table.getElementsByTagName("tr");
					for (i = 0; i < tr.length; i++) {
						td = tr[i].getElementsByTagName("td")[0];
						if (td) {
							if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
								tr[i].style.display = "";
							} else {
								tr[i].style.display = "none";
							}
						}       
					}
				}
				
				// get a reference to the table
				//var table = document.querySelector('shipOrderTable');
				function addRowHandlers() {
					var rows = document.getElementById("shipOrderTable").rows;
					for (i = 0; i < rows.length; i++) {
						rows[i].onclick = function(){ 
							return function(){
								if (i != 0){
									var id = this.cells[0].innerHTML;
									var orderIDBox = document.getElementById("orderID"); 
									orderIDBox.value = id;	
								}
							};
						}(rows[i]);
					}
				}
				window.onload = addRowHandlers();				
				</script>
				</h3>

			</fieldset>
			
			<button type="submit" id="submitScrapBtn" name="submitScrapBtn"> Scrap The Ship</button>
			<button type="submit" id="submitUpdateBtn" name="submitUpdateBtn"> Update Ship Progress</button>
		</form>
	</center>
	</div>

	
	<%	
	if (request.getParameter("submitScrapBtn") == null && request.getParameter("submitUpdateBtn") == null){
		return;
	}
	
	String orderID = request.getParameter("orderID");
		
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	if (request.getParameter("submitScrapBtn") != null) {
		out.println("<script type=\"text/javascript\">");
		out.println("location='updateShipStatus.jsp';");
		out.println("</script>");
	}
	else if (request.getParameter("submitUpdateBtn") != null) {
		if (!orderID.equals("")){
			session.setAttribute("orderIDforUpdate",orderID);
			out.println("<script type=\"text/javascript\">");
			out.println("window.open('updateProgress.jsp');");
			out.println("</script>");
		}
		else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please Select An Order To Update');");
			out.println("location='updateShipStatus.jsp';");
			out.println("</script>");
		}
	}
	%>
	
	</body>
	

</html>