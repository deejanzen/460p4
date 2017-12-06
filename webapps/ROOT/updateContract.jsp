<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.*;"%>
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
			.receiptPopUp {
				display: none;
				position: fixed;
				z-index: 1;
				padding-top: 100px;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
				overflow: auto;
				background-color: rgb(0,0,0);
				background-color: rgba(0,0,0,0.4);
			}

			.receiptPopUpContent {
				background-color: #fefefe;
				margin: auto;
				padding: 20px;
				border: 1px solid #888;
				width: 80%;
			}
		
		</style>
	</head>
	<body>
	<div id="addNewOrderBox">

	<center>
		<h2>Add New Order</h2>
		<form action="addNewOrder.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
				
				<h3>Choose Contract ID (choose newContract Will Start A New Contract):				
					  <select size="1"
							  class="bloc" name="contrSelect" id="contrSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>		
						<option value="newContract">New Contract</option>;
						<%
							request.setCharacterEncoding("utf-8");
							response.setContentType("text/html;charset=utf-8");
							
							String custID = session.getAttribute("custIDForContr").toString();	
							
							DBController dbc = new DBController();
							dbc.connect();
							
							ArrayList<contractRecord> contrList = dbc.show_all_contractByCustID();
														
							if (contrList != null && contrList.size() > 0) {
								for (int i = 0; i < contrList.size(); i++) {
									String contr_id = contrList.get(i).get_contrID();
									out.write("<option value=" + contr_id + " >" + contr_id + "</option>");	
								}
							}							

							dbc.disconnect();
						%>
					   </select>					
				</h3>	
				
				&nbsp;&nbsp;&nbsp;
				
				<h3>Choose Ship Type: 
					  <select size="1"
							  class="bloc" name="shipSelect" id="shipSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>		
						<%							
							dbc.connect();
							
							ArrayList<deptRecord> deptList = dbc.show_all_dept();
														
							if (deptList != null && deptList.size() > 0) {
								for (int i = 0; i < deptList.size(); i++) {
									String modelName = deptList.get(i).get_modelName();
									out.write("<option value=" + modelName + " >" + modelName + "</option>");	
								}
							}							

							dbc.disconnect();
						%>
					   </select>
				</h3>
				
				<br>
				
			</fieldset>
			
			
			<br>
			<button type="button" id="viewBtn" name="viewBtn"> View The Receipt</button>
			&nbsp;
			&nbsp;
			<button type="submit" id="submitBtn" name="submitBtn"> Add The Order</button>
		</form>
	</center>
	</div>
	
	<div id="shipReceipt" class="receiptPopUp">
	  <div id="shipReceiptContent" class="receiptPopUpContent">
	  </div>
	</div>	
	
	<script>
	
	</script>	
	

	<%
	if (request.getParameter("submitBtn") == null){
		return;
	}
	

	%>

	
	
	</body>
	

</html>