<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord, dbController.FeatureRecord, dbController.buildRecord, dbController.contractRecord, dbController.customerRecord;"%>
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
		<%! DBController dbc = null; %>
		<form action="addNewOrder.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>

				<h3>Choose Contract ID (choose newContract Will Start A New Contract):
					  <select size="1"
							  class="bloc" name="contrSelect" id="contrSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>
						<option value="newContract">New Contract</option>;
						<%
							dbc = new DBController();
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

				<%! ArrayList<FeatureRecord> featList = null; %>
				<h3>Select a model:
					  <select size="1"
							  class="bloc" name="modelSelect" id="modelSelect"
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
				<button type="submit" id="nextBtn" name="nextBtn">See available features</button>
				<br>
				<button type="button" onclick="window.location.href='customerPage.jsp'">Go Back</button>


				&nbsp;&nbsp;&nbsp;

				<br>

	<%! String model = null; %>
	<%
	String contrName = request.getParameter("contrSelect");
	model = request.getParameter("modelSelect");

	int newContrFlag = 0;
	if (request.getParameter("nextBtn") == null) {
		return;
	}

	if (contrName.equals("newContract")) {
		dbc.connect();
		newContrFlag = 1;
		contrName = dbc.contrIDGenerator();
		dbc.disconnect();
	}

	if (model == null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Please Select A Ship Model To Make An Order');");
		out.println("</script>");
		return;
	}

	String dept = "";
	if (request.getParameter("nextBtn") != null) {
//		model = request.getParameter("modelSelect");

		if (model != null) {
			for (deptRecord r : deptList) {
				if (model.equals(r.get_modelName())) {
					dept = r.get_deptName();
				}
			}
			if (!dept.isEmpty()) {
				dbc.connect();
				featList = dbc.show_all_features(dept);
				dbc.disconnect();
				request.setAttribute("featList", featList);
//				session.setAttribute("featNo", featList.size());

//				out.println("<script type=\"text/javascript\">");
//				out.println("alert('--> The list size  is " + len + "');");
//				out.println("</script>");
			}
		}
//		session.setAttribute("shipmodel", model);
//		response.sendRedirect("featPart.jsp");
	}

	%>

	<c:choose>
        <c:when test="${empty model}">
            <%@ include file="addNewOrderBase.jsp" %>
        </c:when>
        <c:otherwise>
            <%@ include file="featPart.jsp" %>
        </c:otherwise>
    </c:choose>

<%--
	<c:forEach var = "j" begin="1" end="5">
		<%@ include file="featPart.jsp" %>
	</c:forEach>

	<%@ include file="addNewOrderBase.jsp" %>
--%>
