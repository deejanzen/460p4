<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord;"%>
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
		</style>
	</head>
	<body>
	<div id="addNewOrderBox">

	<center>
		<h2>Query Question #1</h2>
		<br>
		<h3> Choosing one from a list of ship types, report the cost of all the parts
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			DBController dbc = new DBController();
		%>
		</h3>
		<form action="query1.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>								
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
			<button type="submit" id="viewBtn" name="viewBtn"> View The Receipt And Submit</button>
		</form>
	</center>
	</div>
	<%
		if (request.getParameter("viewBtn") == null){
		return;
	}

	String shipName = request.getParameter("shipSelect");
	
	if (shipName == null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Please Select A Ship Model To Check The Part Price');");
		out.println("</script>");
		return;
	}
	
	if (request.getParameter("viewBtn") != null){
		int totalPrice = 0;
		
		dbc.connect();
		int basePrice = dbc.getBasePriceByName(shipName);
		dbc.disconnect();
		
		String receiptContent = "";
		
		receiptContent += "Receipt\\n";
		receiptContent += ("Ship Model: " + shipName + "\\n");
		receiptContent += ("Ship Model Base Price: " + basePrice + "\\n");
		
		dbc.connect();
		ArrayList<partRecord> partList = dbc.show_all_part_byModelName(shipName);
		dbc.disconnect();
					
		if (partList != null && partList.size() > 0) {
			for (int i = 0; i < partList.size(); i++) {
				String part_name = partList.get(i).get_partName();
				int part_price = partList.get(i).get_partPrice();					
				totalPrice += part_price;					
				receiptContent += ("     " + i + ". PartName: " + part_name + "----------PartPrice: " + part_price + "\\n");
			}
		}					
		totalPrice += basePrice;
		receiptContent += ("Total Price: " + totalPrice + "\\n");						
		out.println("<script type=\"text/javascript\">");
		out.println("alert('" + receiptContent + "');");
		out.println("location='query1.jsp';");
		out.println("</script>");			
	}
	%>
	
	</body>
</html>