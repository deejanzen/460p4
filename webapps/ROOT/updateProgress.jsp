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
					System.out.println("testprint");
				%>
				</h3>
			</fieldset>
			
			<br>
			
			<fieldset id="field2">
				<legend>Part List:</legend>				
				<table id="orderProgressTable">
				<tr class="header">
					<th style="width:60%;">PartName</th>
					<th style="width:40%;">Status</th>
				</tr>		
				<%				
					DBController dbc = new DBController();
					dbc.connect();
					
					ArrayList<buildRecord> buildList = dbc.show_all_build();
					int orderPartCount = 1;
										
					if (buildList != null && buildList.size() > 0) {
						for (int i = 0; i < buildList.size(); i++) {
							String part_Name = buildList.get(i).get_partName();
							String part_ID = buildList.get(i).get_partID();
							String order_Status = buildList.get(i).get_status(); 
							String order_ID = buildList.get(i).get_orderID();
							
							if (order_ID.equals(orderID)) {
								
								String partID_Hidden = "";
								String status_Hidden = "";				
								
								out.write("<tr>");
								out.write("<td>" + part_Name + "</td>");
								
								partID_Hidden = orderPartCount + "0";
								out.write("<input type='hidden' name='" + partID_Hidden + "' id='" + partID_Hidden + "' value='" + part_ID + "'/>");
																
								if (order_Status.equals("F")){
									out.write("<td style='color:red'>" + order_Status + "</td>");
								}
								else{									
									out.write("<td style='color:green'>" + order_Status + "</td>");

								}
								status_Hidden = orderPartCount + "1";
								out.write("<input type='hidden' name='" + status_Hidden + "' id='" + status_Hidden + "' value='" + order_Status + "'/>");
								
								orderPartCount++;
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
										var inputID = this.cells[1].parentNode.rowIndex + "1";
										//alert(document.getElementById(inputID).value);
										if (this.cells[1].innerHTML == "F"){
											this.cells[1].innerHTML = "T";
											this.cells[1].style.color = "green";
											document.getElementById(inputID).value = "T";
										}
										else{
											this.cells[1].innerHTML = "F";
											this.cells[1].style.color = "red";
											document.getElementById(inputID).value = "F";
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
		if (request.getParameter("submitConfirmBtn") != null){	
		
			String partID_name = "";
			String status_name = "";
			String partID = "";
			String status = "";
			dbc.connect();
			
			//int i = 1;
			
			for (int i = 1; i <= orderPartCount; i++){
				String prefix = String.valueOf(i);
				partID_name = prefix + "0";
				status_name = prefix + "1";

				//out.println("<script type=\"text/javascript\">");
				//out.println("alert('" + status_name + "');");
				//out.println("location='updateProgress.jsp';");
				//out.println("</script>");

				partID = request.getParameter(partID_name);
				status = request.getParameter(status_name);
				
				//out.println("<script type=\"text/javascript\">");
				//out.println("alert('" + partID + "');");
				//out.println("location='updateProgress.jsp';");
				//out.println("</script>");

				
				//System.out.println(partID + ", " + status);
				int result = dbc.updateOrderProgress(orderID, partID, status);
				
				//out.println("<script type=\"text/javascript\">");
				//out.println("alert('" + result + "');");
				//out.println("location='updateProgress.jsp';");
				//out.println("</script>");
			}
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Update Completed =)');");
			out.println("location='updateProgress.jsp';");
			out.println("</script>");
			
			//session.invalidate(); 
			dbc.disconnect();
			return;
		}
		session.invalidate(); 
		//dbc.disconnect();
	%>
	
	</body>
	

</html>