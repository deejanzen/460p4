<h3> Feature <c:out value = "${j}"/><p>
      <select size="1"
              class="bloc" name="feat1Select" id="feat1Select"
              onfocus='this.size=5;' onblur='this.size=1;'>
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

<%--
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


</fieldset>


<br>
</form>
</center>
</div>

</body>


</html>
--%>
