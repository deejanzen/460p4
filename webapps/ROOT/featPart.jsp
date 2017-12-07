<%@ include file = "addNewOrder.jsp" %>
<h3>Feature 1:
      <select size="1"
              class="bloc" name="shipSelect" id="shipSelect"
              onfocus='this.size=5;' onblur='this.size=1;'>
        <%
            dbc.connect();

            ArrayList<deptRecord> featList = dbc.show_all_features();

            if (deptList != null && featList.size() > 0) {
                for (int i = 0; i < featList.size(); i++) {
                    String modelName = featList.get(i).get_modelName();
                    out.write("<option value=" + modelName + " >" + modelName + "</option>");
                }
            }

            dbc.disconnect();
        %>
       </select>
</h3>
<br><br>
<h3>Feature 2:
        <select size="1"
               class="bloc" name="shipSelect" id="shipSelect"
               onfocus='this.size=5;' onblur='this.size=1;'>
         <%
             dbc.connect();

             ArrayList<deptRecord> featList = dbc.show_all_features();

             if (deptList != null && featList.size() > 0) {
                 for (int i = 0; i < featList.size(); i++) {
                     String modelName = featList.get(i).get_modelName();
                     out.write("<option value=" + modelName + " >" + modelName + "</option>");
                 }
             }

             dbc.disconnect();
         %>
        </select>
</h3>


--------------------------------------------------------------------------------------------------------
<%--
</body>


</html>
--%>
