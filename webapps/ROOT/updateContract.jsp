<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord, dbController.orderRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Update Contract Order</title>
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
			#myInput {
				background-image: url('/css/searchicon.png');
				background-repeat: no-repeat;
				width: 100%;
				font-size: 16px;
				padding: 12px 20px 12px 40px;
				border: 1px solid #ddd;
				margin-bottom: 12px;
			}
		
		</style>
	</head>
	<body>
	<div id="addNewOrderBox">

	<center>
		<h2>Update Contract Order</h2>
		<h3>Customer ID:
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			String custID = session.getAttribute("custIDForContr").toString();		
			out.write(custID);
			
		%>
		</h3>
		<form action="updateContract.jsp" method="post">
			<fieldset id = "field1">
				<h3>Enter The Order Number: 
					<input type="text" name="orderID" id="orderID" value="" onkeyup="myFunction()" placeholder="Search for Order.." title="Type in an order ID">
				</h3>		
				<br>
				<legend>Click to Choose The Ship</legend>		
				
				<h3>
					<table id="shipOrderTable">
					<thead class="fixedHeader">
						<tr>
							<th style="width:25%;">ContractID</th>
							<th style="width:25%;">Order ID</th>
							<th style="width:20%;">Status</th>
							<th style="width:30%;">Predicted Cost</th>
						</tr>
					</thead>
					<tbody class="shipOrderTableBody" align="center">
					<%												
						DBController dbc = new DBController();
						dbc.connect();
						
						ArrayList<contractRecord> contrList = dbc.show_all_contractByCustID(custID);
													
						if (contrList != null && contrList.size() > 0) {
							for (int i = 0; i < contrList.size(); i++) {
								String contr_id = contrList.get(i).get_contrID();
								ArrayList<orderRecord> orderList = dbc.show_all_orderByContract(contr_id);
								
								int orderCount = orderList.size();
								for (int m = 0; m < orderCount; m++){
									out.write("<tr>");
									out.write("<td>" + contr_id + ": </td>");
									out.write("<td>" + orderList.get(m).get_orderID() + "</td>");
									out.write("<td>" + orderList.get(m).get_status() + "</td>");	
									out.write("<td>" + dbc.getTotalPriceByOrder(orderList.get(m).get_orderID()) + "</td>");	
									out.write("</tr>");	
								}
								
								//out.write("<tr>");
								//out.write("<td rowspan='" + orderCount + "'>" + contr_id + ": </td>");
								//out.write("<td>" + orderList.get(0).get_orderID() + "</td>");
								//out.write("<td>" + orderList.get(0).get_status() + "</td>");	
								//out.write("</tr>");
								
								//if (orderCount > 1) {
								//	for (int m = 1; m < orderCount; m++){
								//		out.write("<tr>");
								//		out.write("<td>" + orderList.get(0).get_orderID() + "</td>");
								//		out.write("<td>" + orderList.get(0).get_status() + "</td>");	
								//		out.write("</tr>");	
								//	}
								//}
							}
						}		
						dbc.disconnect();
					%>
					</tbody>
					</table>			
				</h3>					
			</fieldset>
	
			
			
			<br>
			<button type="submit" id="submitBtn" name="submitBtn"> Update The Order</button>
		</form>
	</center>
	</div>
		
	<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("orderID");
		filter = input.value.toUpperCase();
		table = document.getElementById("shipOrderTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}       
		}
	}
	//var table = document.querySelector('shipOrderTable');
	function addRowHandlers() {
		var rows = document.getElementById("shipOrderTable").rows;
		for (i = 0; i < rows.length; i++) {
			rows[i].onclick = function(){ 
				return function(){
					if (i != 0){
						var id = this.cells[1].innerHTML;
						var orderIDBox = document.getElementById("orderID"); 
						orderIDBox.value = id;	
					}
				};
			}(rows[i]);
		}
	}
	window.onload = addRowHandlers();		
	</script>	
	

	<%
	if (request.getParameter("submitBtn") == null){
		return;
	}
	
	String orderID = request.getParameter("orderID");
	
	//Check if the contract id is active
	dbc.connect();
	String contrID = dbc.getContrIDByOrderID(orderID);
	
	//out.println("<script type=\"text/javascript\">");
	//out.println("alert('" + contrID + "');");
	//out.println("</script>");	
	
	int result = dbc.verify_contractStatus(contrID);
	dbc.disconnect();
	
	if (result != 0){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('" + result + "Contract Is Inactive\\n\\nPlease Choose Another Order To Update');");
		out.println("</script>");	
		return;
	}
	
	session.setAttribute("order_id", orderID);
	session.setAttribute("cust_id", custID);
	session.setAttribute("contr_id", contrID);
	response.sendRedirect("addPartToOrder.jsp");
	

	%>

	
	
	</body>
	

</html>