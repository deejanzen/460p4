<h3> Feature 1
      <select size="1"
              class="bloc" name="feat1Select" id="feat1Select"
              onfocus='this.size=10;' onblur='this.size=1;'>
        <%
//            dbc.connect();
//            featList = dbc.show_all_features(dept);
//            dbc.disconnect();

            if (featList != null && featList.size() > 0) {
                for (int i = 3; i < featList.size(); i++) {
                    String partName = featList.get(i).get_partNum();
                    out.write("<option value=" + partName + " >" + partName + "</option>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('featList is empty');");
                out.println("</script>");
                return;
            }
        %>
       </select>
</h3>
<br>
<h3>Feature 2:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
<br>
<h3>Feature 3:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3><br>
<h3>Feature 4:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
<h3>Feature 5:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
<h3>Feature 6:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
<h3>Feature 7:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
<h3>Feature 8:
        <select size="1"
               class="bloc" name="feat2Select" id="feat2Select"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             if (featList != null && featList.size() > 0) {
                 for (int i = 3; i < featList.size(); i++) {
                     String partName = featList.get(i).get_partNum();
                     out.write("<option value=" + partName + " >" + partName + "</option>");
                 }
             }
         %>
        </select>
</h3>
</fieldset>
<br>
<button type="submit" id="viewBtn" name="viewBtn"> Place Your Order</button>

</form>
</center>
</div>

<%
    if (request.getParameter("viewBtn") == null){
        return;
    }

    String contrName = request.getParameter("contrSelect");
    String shipName = deptList.get

	if (contrName.equals("newContract")) {
		dbc.connect();
		newContrFlag = 1;
		contrName = dbc.contrIDGenerator();
		dbc.disconnect();
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
