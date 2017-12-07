<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add Part To Order</title>
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
		<h2>Add New Order</h2>
		<br>
		<h3>Customer ID:
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			String custID = session.getAttribute("cust_id").toString();		
			session.setAttribute("custIDForContr", custID);
			
			String orderID = session.getAttribute("order_id").toString();
			String contrName = session.getAttribute("contr_id").toString();
			out.write(custID);
			
		%>
		</h3>
		<form action="addPartToOrder.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
				
				<h3>Choose Part(s) to Add:				
					  <select Multiple size="1"
							  class="bloc" name="partsSelect" id="partsSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>		
						<option value='Add None'></option>
							  
						<%							
							DBController dbc = new DBController();
													
							dbc.connect();
							ArrayList<partRecord> partList = dbc.show_available_part(orderID);							
														
							dbc.disconnect();
							
							if (partList != null && partList.size() > 0) {
								for (int i = 0; i < partList.size(); i++) {
									String partName = partList.get(i).get_partName();
									out.write("<option value=" + partName + " >" + partName + "</option>");	
								}
							}
						%>
					   </select>					
				</h3>	
				
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
	
	String[] partArr = request.getParameterValues("partsSelect");
	if (partArr.length!=0 && !partArr[0].equals("Add None")){
		dbc.connect();
		int curPartCount = dbc.getTotalPartNumber(orderID);
		dbc.disconnect();
		
		int partLimit = 10 - curPartCount;
		
		if (partLimit <= 0) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You Cannot Add Any More Parts For Reaching Limit 10');");
			out.println("</script>");
			response.sendRedirect("addPartToOrder.jsp");
		}
		
		if ((curPartCount + partArr.length) >= 10){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You Cannot Have More Then 10 Parts For Your Ship');");
			out.println("location='addPartToOrder.jsp';");
			out.println("</script>");
			return;
		}	
		
		dbc.connect();
		dbc.addPartToOrder(orderID, partArr);
		dbc.disconnect();
	}
	String receiptContent = "";
	receiptContent += "Receipt\\n";
	receiptContent += ("Contract ID: " + contrName + "\\n");
	receiptContent += ("Customer ID: " + custID + "\\n");
	receiptContent += ("Order ID: " + orderID + "\\n");
	
	dbc.connect();
	ArrayList<partRecord> part_list_new = dbc.show_all_part_byOrderID(orderID);
	dbc.disconnect();	
	
	if (part_list_new != null && part_list_new.size() > 0) {
		for (int i = 0; i < part_list_new.size(); i++) {
			String part_name = part_list_new.get(i).get_partName();
			int part_price = part_list_new.get(i).get_partPrice();					
			//totalPrice += part_price;					
			receiptContent += ("     " + i + ". PartName: " + part_name + "----------PartPrice: " + part_price + "\\n");
		}
	}	
	dbc.connect();	
	int totalPrice = dbc.getTotalPriceByOrder(orderID);
	dbc.disconnect();
	
	receiptContent += ("Total Price: " + totalPrice + "\\n");

	out.println("<script type=\"text/javascript\">");
	out.println("alert('" + receiptContent + "');");
	out.println("location='updateContract.jsp';");
	out.println("</script>");
	
	
	%>	
		
	</body>
	

</html>