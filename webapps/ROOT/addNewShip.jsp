<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*, java.util.ArrayList, dbController.DBController, dbController.partRecord, dbController.deptRecord;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add New Ship</title>
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
	<div id="addNewShipBox">

	<center>
		<h2>Add New Ship</h2>
		<form action="addNewShip.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
				<h3>Enter Department Name: 
					<input type="text" name="deptName" id="deptName" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>
				<br>
				
				<h3>Choose Part(s) (Press Ctrl To Make Multiple Selection):				
					  <select multiple
							  size="1"
							  class="bloc" name="partsSelect" id="partsSelect"
							  onfocus='this.size=5;' onblur='this.size=1;'>							  
						<%
							request.setCharacterEncoding("utf-8");
							response.setContentType("text/html;charset=utf-8");
							

							DBController dbc = new DBController();
							dbc.connect();
							
							ArrayList<partRecord> partList = dbc.show_all_part();
														
							if (partList != null && partList.size() > 0) {
								for (int i = 0; i < partList.size(); i++) {
									String part_name = partList.get(i).get_partName();

									if (!part_name.equals("Hull") && !part_name.equals("Wing") && !part_name.equals("Engine")) {
										out.write("<option value=" + part_name + " >" + part_name + "</option>");	
									}
								}
							}							

							dbc.disconnect();
						%>
					   </select>					
				</h3>
				
				<br>
				
				<h3>Enter Ship Name: 
					<input type="text" name="shipName" id="shipName" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>
				
				<br>
				
				<h3>Enter Ship Labor Fee: 
					<input type="text" name="shipLaborFee" id="shipLaborFee" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>
			</fieldset>
			
			
			<br>
			<button type="button" id="viewBtn" name="viewBtn"> View The Receipt</button>
			&nbsp;
			&nbsp;
			<button type="submit" id="submitBtn" name="submitBtn"> Add The Ship</button>
		</form>
	</center>
	</div>
	
	<div id="shipReceipt" class="receiptPopUp">
	  <div id="shipReceiptContent" class="receiptPopUpContent">
	  </div>

	</div>	
	
	<script>
	// Get the receiptWindow
	var receiptWindow = document.getElementById('shipReceipt');

	// Get the button that opens the receiptWindow
	var viewButton = document.getElementById("viewBtn");

	// When the user clicks the button, open the receiptWindow 
	viewButton.onclick = function() {
		receiptWindow.style.display = "block";
		
		var paragraph = document.getElementById("shipReceiptContent");
		
		// Print out the Department Name
		//var deptSelect = document.getElementById("departmentSelect");
		//var deptName = deptSelect.options[deptSelect.selectedIndex].text;
		var deptName = document.getElementById("deptName").value;
		var deptText = "<p>Department Name:   " + deptName + "</p>"
		
		paragraph.innerHTML += deptText;	
		
		// List the parts Name
		var partsSelect = document.getElementById("partsSelect");
		var partsArr = getSelectValues(partsSelect);
		var partsArrLength = partsArr.length;
		
		var partsText = "<p>Parts List:<br><ul>";
		var i;
		partsText += "<li>" + "Hull" + "</li>";
		partsText += "<li>" + "Wing" + "</li>";
		partsText += "<li>" + "Engine" + "</li>";
		for (i = 0; i < partsArrLength;i++) {
			partsText += "<li>" + partsArr[i] + "</li>";
		}
		partsText + "</ul></p>";
		
		paragraph.innerHTML += partsText;	
		paragraph.innerHTML += "<br>";	
		
		// Print out the Ship Name
		var shipName = document.getElementById("shipName").value;
		var shipText = "<p>Ship Name:   " + shipName + "</p>"
		
		paragraph.innerHTML += shipText;		
	}
	
	// When the user clicks anywhere outside of the receiptWindow, close it
	window.onclick = function(event) {
		if (event.target == receiptWindow) {
			var paragraph = document.getElementById("shipReceiptContent");
			paragraph.innerHTML = "";
			receiptWindow.style.display = "none";
		}
	}
	
	// Return an array of the selected opion values
	// select is an HTML select element
	function getSelectValues(select) {
	  var result = [];
	  var options = select && select.options;
	  var opt;

	  for (var i=0, iLen=options.length; i<iLen; i++) {
		opt = options[i];

		if (opt.selected) {
		  result.push(opt.value || opt.text);
		}
	  }
	  return result;
	}
	
	</script>	
	

	<%
	if (request.getParameter("submitBtn") == null){
		return;
	}
	
	//DBController dbc = new DBController();
  	dbc.connect();
	
	
	String deptName = request.getParameter("deptName");		

	// Check If the deptName is already in the database
	int rtn = dbc.verify_department(deptName);
	dbc.disconnect();
	if(rtn == 1){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Department is Already Exist');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		return;
	}
	
	if (deptName == ""){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Department Name Cannot Be Empty');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		return;
	}
		
	// Check the Number of Feature Parts
	String[] partArr = request.getParameterValues("partsSelect");
	if (partArr == null || partArr.length > 10 || partArr.length < 3 ) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('You Need to Choose 3-10 Feature Parts');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		return;
	}
	
	//out.println("<script type=\"text/javascript\">");
	//out.println("alert('" + partArr.length + "');");
	//out.println("location='addNewShip.jsp';");
	//out.println("</script>");
	
	String shipName = request.getParameter("shipName");	
	if (shipName == ""){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Ship Name Cannot Be Empty');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		return;
	}	
	
	String shipLaborFee = request.getParameter("shipLaborFee");
	if (shipLaborFee == ""){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The shipLaborFee Cannot Be Empty');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		return;
	}
	dbc.connect();
	if (!dbc.isInteger(shipLaborFee)){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Ship LaborFee Must Be An Integer');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		dbc.disconnect();
		return;
	}	
	//out.println("<script type=\"text/javascript\">");
	//out.println("alert(' yea ');");
	//out.println("location='addNewShip.jsp';");
	//out.println("</script>");
	
	int result = dbc.addNewShipToDept(deptName, partArr, shipName, shipLaborFee);
	out.println("<script type=\"text/javascript\">");
	out.println("alert('" + result + "');");
	out.println("location='addNewShip.jsp';");
	out.println("</script>");
	dbc.disconnect();
	%>

	
	
	</body>
	

</html>

