<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add New Department</title>
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
	
		</style>
	</head>
	<body>
	<div id="addNewDeptBox">

	<center>
		<h2>Add New Department</h2>
		<form action="addNewDept.jsp" method="post">
			<fieldset id = "field1">
				<legend>Enter Information:</legend>				
				<h3>Enter Department Name: 
					<input type="text" name="deptName" value="" onkeypress="this.style.width = ((this.value.length + 2) * 8) + 'px';">
				</h3>
			</fieldset>
			
			<br>

			<button type="submit" id="submitBtn" name="submitBtn"> Add The Department</button>
		</form>
	</center>
	</div>
	
	
	<%
	if (request.getParameter("submitBtn") == null){
		return;
	}


	String deptName = request.getParameter("deptName");
	
	%>
	
	</body>
	

</html>