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
		<h2>Query Question #5</h2>
		<br>
		<h3> Choosing A Department To See The Total Revenue
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			DBController dbc = new DBController();
		%>
		</h3>
		<form action="query5.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>								
				<h3>Choose Department: 
					  <select size="1"
							  class="bloc" name="deptSelect" id="deptSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>		
						<%							
							dbc.connect();
							
							ArrayList<deptRecord> deptList = dbc.show_all_dept();
														
							if (deptList != null && deptList.size() > 0) {
								for (int i = 0; i < deptList.size(); i++) {
									String deptName = deptList.get(i).get_deptName();
									out.write("<option value=" + deptName + " >" + deptName + "</option>");	
								}
							}							

							dbc.disconnect();
						%>
					   </select>
				</h3>
				
				<br>
				
			</fieldset>
			
			
			<br>
			<button type="submit" id="viewBtn" name="viewBtn"> View The Result</button>
		</form>
	</center>
	</div>
	<%
		if (request.getParameter("viewBtn") == null){
		return;
	}

	String deptName = request.getParameter("deptSelect");
	
	if (deptName == null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Please Select A Department To Check Info');");
		out.println("</script>");
		return;
	}
	
	if (request.getParameter("viewBtn") != null){
		int totalPrice = 0;
		
		dbc.connect();
		int totalRevenue = dbc.show_most_rich_dept(deptName);
		dbc.disconnect();
		
		String receiptContent = "";
		
		receiptContent += "Receipt\\n";
		receiptContent += ("Department Name: " + deptName + "\\n");
					
		receiptContent += ("Total Revenue: " + totalRevenue + "\\n");						
		out.println("<script type=\"text/javascript\">");
		out.println("alert('" + receiptContent + "');");
		out.println("location='query5.jsp';");
		out.println("</script>");			
	}
	%>
	
	</body>
</html>