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
<button type="submit" id="viewBtn" name="viewBtn"> View The Receipt And Submit</button>

<br>
</form>
</center>
</div>

<%

%>


</body>


</html>
