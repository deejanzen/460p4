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
		<h2>Add New Order</h2>
		<br>
		<h3>Customer ID:
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");

			String custID = session.getAttribute("custIDForContr").toString();
			out.write(custID);

		%>
		</h3>
		<form action="addNewOrder.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>

				<h3>Choose Contract ID (choose newContract Will Start A New Contract):
					  <select size="1"
							  class="bloc" name="contrSelect" id="contrSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>
						<option value="newContract">New Contract</option>;
						<%
							DBController dbc = new DBController();
							dbc.connect();

							ArrayList<contractRecord> contrList = dbc.show_all_contractByCustID(custID);

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
			<button type="submit" id="viewBtn" name="viewBtn">Place Order</button>
			<button type="button" onclick="window.location.href='startpage.jsp'">Go Back</button>
		</form>
	</center>
	</div>

	<%
	if (request.getParameter("viewBtn") == null){
		return;
	}

	String contrName = request.getParameter("contrSelect");
	String shipName = request.getParameter("shipSelect");

	int newContrFlag = 0;

	if (contrName.equals("newContract")) {
		dbc.connect();
		newContrFlag = 1;
		contrName = dbc.contrIDGenerator();
		dbc.disconnect();
	}

	if (shipName == null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Please Select A Ship Model To Make An Order');");
		out.println("</script>");
		return;
	}

	if (request.getParameter("viewBtn") != null){

		int totalPrice = 0;

		dbc.connect();
		int basePrice = dbc.getBasePriceByName(shipName);
		String orderID = dbc.orderIDGenerator();
		dbc.disconnect();

		String receiptContent = "";

		receiptContent += "Receipt\\n";
		receiptContent += ("Contract ID: " + contrName + "\\n");
		receiptContent += ("Customer ID: " + custID + "\\n");
		receiptContent += ("Order ID: " + orderID + "\\n");
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

		//out.println("<script type=\"text/javascript\">");
		//out.println("alert('" + receiptContent + "');");
		//out.println("</script>");

		if (newContrFlag == 1) {

			dbc.connect();
			dbc.addNewContract(contrName, custID);
			dbc.disconnect();

			//out.println("<script type=\"text/javascript\">");
			//out.println("alert('Add New Contract');");
			//out.println("</script>");

		}

		dbc.connect();
		dbc.addNewContractOrder(orderID, contrName, shipName);
		dbc.addNewBuildDefault(orderID, partList);
		dbc.disconnect();

		out.println("<script type=\"text/javascript\">");
		out.println("alert('" + receiptContent + "');");
		out.println("location='customerPage.jsp';");
		out.println("</script>");
	}



	%>

	</body>


</html>
