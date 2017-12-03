package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.ArrayList;
import dbController.DBController;
import dbController.partRecord;
import dbController.deptRecord;;

public final class addNewShip_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = JspFactory.getDefaultFactory().getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t\t<title>Add New Ship</title>\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\tbutton {\n");
      out.write("\t\t\t    background-color: #4CAF50;\n");
      out.write("\t\t\t    color: white;\n");
      out.write("\t\t\t    padding: 14px 20px;\n");
      out.write("\t\t\t    margin: 8px 0;\n");
      out.write("\t\t\t    border: none;\n");
      out.write("\t\t\t    cursor: pointer;\n");
      out.write("\t\t\t    width: auto;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.bloc { \n");
      out.write("\t\t\t\tdisplay:inline; \n");
      out.write("\t\t\t\tvertical-align:top; \n");
      out.write("\t\t\t\toverflow:scroll; \n");
      out.write("\t\t\t\tborder:solid grey 1px; \n");
      out.write("\t\t\t\toverflow-x: hidden;\n");
      out.write("\t\t\t\tposition: absolute;\n");
      out.write("\t\t\t\tmin-width:50px; \n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.receiptPopUp {\n");
      out.write("\t\t\t\tdisplay: none;\n");
      out.write("\t\t\t\tposition: fixed;\n");
      out.write("\t\t\t\tz-index: 1;\n");
      out.write("\t\t\t\tpadding-top: 100px;\n");
      out.write("\t\t\t\tleft: 0;\n");
      out.write("\t\t\t\ttop: 0;\n");
      out.write("\t\t\t\twidth: 100%;\n");
      out.write("\t\t\t\theight: 100%;\n");
      out.write("\t\t\t\toverflow: auto;\n");
      out.write("\t\t\t\tbackground-color: rgb(0,0,0);\n");
      out.write("\t\t\t\tbackground-color: rgba(0,0,0,0.4);\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.receiptPopUpContent {\n");
      out.write("\t\t\t\tbackground-color: #fefefe;\n");
      out.write("\t\t\t\tmargin: auto;\n");
      out.write("\t\t\t\tpadding: 20px;\n");
      out.write("\t\t\t\tborder: 1px solid #888;\n");
      out.write("\t\t\t\twidth: 80%;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\t</style>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("\t<div id=\"addNewShipBox\">\n");
      out.write("\n");
      out.write("\t<center>\n");
      out.write("\t\t<h2>Add New Ship</h2>\n");
      out.write("\t\t<form action=\"addNewShip.jsp\" method=\"post\">\n");
      out.write("\t\t\t<fieldset id = \"field1\">\n");
      out.write("\t\t\t\t<legend>Enter Information:</legend>\t\t\t\t\n");
      out.write("\t\t\t\t<h3>Enter Department Name: \n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"deptName\" id=\"deptName\" value=\"\" onkeypress=\"this.style.width = ((this.value.length + 2) * 8) + 'px';\">\n");
      out.write("\t\t\t\t</h3>\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<h3>Choose Part(s) (Press Ctrl To Make Multiple Selection):\t\t\t\t\n");
      out.write("\t\t\t\t\t  <select multiple\n");
      out.write("\t\t\t\t\t\t\t  size=\"1\"\n");
      out.write("\t\t\t\t\t\t\t  class=\"bloc\" name=\"partsSelect\" id=\"partsSelect\"\n");
      out.write("\t\t\t\t\t\t\t  onfocus='this.size=5;' onblur='this.size=1;'>\t\t\t\t\t\t\t  \n");
      out.write("\t\t\t\t\t\t");

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
						
      out.write("\n");
      out.write("\t\t\t\t\t   </select>\t\t\t\t\t\n");
      out.write("\t\t\t\t</h3>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<h3>Enter Ship Name: \n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"shipName\" id=\"shipName\" value=\"\" onkeypress=\"this.style.width = ((this.value.length + 2) * 8) + 'px';\">\n");
      out.write("\t\t\t\t</h3>\n");
      out.write("\t\t\t</fieldset>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"button\" id=\"viewBtn\" name=\"viewBtn\"> View The Receipt</button>\n");
      out.write("\t\t\t&nbsp;\n");
      out.write("\t\t\t&nbsp;\n");
      out.write("\t\t\t<button type=\"submit\" id=\"submitBtn\" name=\"submitBtn\"> Add The Ship</button>\n");
      out.write("\t\t</form>\n");
      out.write("\t</center>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t<div id=\"shipReceipt\" class=\"receiptPopUp\">\n");
      out.write("\t  <div id=\"shipReceiptContent\" class=\"receiptPopUpContent\">\n");
      out.write("\t  </div>\n");
      out.write("\n");
      out.write("\t</div>\t\n");
      out.write("\t\n");
      out.write("\t<script>\n");
      out.write("\t// Get the receiptWindow\n");
      out.write("\tvar receiptWindow = document.getElementById('shipReceipt');\n");
      out.write("\n");
      out.write("\t// Get the button that opens the receiptWindow\n");
      out.write("\tvar viewButton = document.getElementById(\"viewBtn\");\n");
      out.write("\n");
      out.write("\t// When the user clicks the button, open the receiptWindow \n");
      out.write("\tviewButton.onclick = function() {\n");
      out.write("\t\treceiptWindow.style.display = \"block\";\n");
      out.write("\t\t\n");
      out.write("\t\tvar paragraph = document.getElementById(\"shipReceiptContent\");\n");
      out.write("\t\t\n");
      out.write("\t\t// Print out the Department Name\n");
      out.write("\t\t//var deptSelect = document.getElementById(\"departmentSelect\");\n");
      out.write("\t\t//var deptName = deptSelect.options[deptSelect.selectedIndex].text;\n");
      out.write("\t\tvar deptName = document.getElementById(\"deptName\").value;\n");
      out.write("\t\tvar deptText = \"<p>Department Name:   \" + deptName + \"</p>\"\n");
      out.write("\t\t\n");
      out.write("\t\tparagraph.innerHTML += deptText;\t\n");
      out.write("\t\t\n");
      out.write("\t\t// List the parts Name\n");
      out.write("\t\tvar partsSelect = document.getElementById(\"partsSelect\");\n");
      out.write("\t\tvar partsArr = getSelectValues(partsSelect);\n");
      out.write("\t\tvar partsArrLength = partsArr.length;\n");
      out.write("\t\t\n");
      out.write("\t\tvar partsText = \"<p>Parts List:<br><ul>\";\n");
      out.write("\t\tvar i;\n");
      out.write("\t\tpartsText += \"<li>\" + \"Hull\" + \"</li>\";\n");
      out.write("\t\tpartsText += \"<li>\" + \"Wing\" + \"</li>\";\n");
      out.write("\t\tpartsText += \"<li>\" + \"Engine\" + \"</li>\";\n");
      out.write("\t\tfor (i = 0; i < partsArrLength;i++) {\n");
      out.write("\t\t\tpartsText += \"<li>\" + partsArr[i] + \"</li>\";\n");
      out.write("\t\t}\n");
      out.write("\t\tpartsText + \"</ul></p>\";\n");
      out.write("\t\t\n");
      out.write("\t\tparagraph.innerHTML += partsText;\t\n");
      out.write("\t\tparagraph.innerHTML += \"<br>\";\t\n");
      out.write("\t\t\n");
      out.write("\t\t// Print out the Ship Name\n");
      out.write("\t\tvar shipName = document.getElementById(\"shipName\").value;\n");
      out.write("\t\tvar shipText = \"<p>Ship Name:   \" + shipName + \"</p>\"\n");
      out.write("\t\t\n");
      out.write("\t\tparagraph.innerHTML += shipText;\t\t\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t// When the user clicks anywhere outside of the receiptWindow, close it\n");
      out.write("\twindow.onclick = function(event) {\n");
      out.write("\t\tif (event.target == receiptWindow) {\n");
      out.write("\t\t\tvar paragraph = document.getElementById(\"shipReceiptContent\");\n");
      out.write("\t\t\tparagraph.innerHTML = \"\";\n");
      out.write("\t\t\treceiptWindow.style.display = \"none\";\n");
      out.write("\t\t}\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t// Return an array of the selected opion values\n");
      out.write("\t// select is an HTML select element\n");
      out.write("\tfunction getSelectValues(select) {\n");
      out.write("\t  var result = [];\n");
      out.write("\t  var options = select && select.options;\n");
      out.write("\t  var opt;\n");
      out.write("\n");
      out.write("\t  for (var i=0, iLen=options.length; i<iLen; i++) {\n");
      out.write("\t\topt = options[i];\n");
      out.write("\n");
      out.write("\t\tif (opt.selected) {\n");
      out.write("\t\t  result.push(opt.value || opt.text);\n");
      out.write("\t\t}\n");
      out.write("\t  }\n");
      out.write("\t  return result;\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t</script>\t\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t");

	if (request.getParameter("submitBtn") == null){
		return;
	}
	
	//DBController dbc = new DBController();
  	dbc.connect();
	
	
	String deptName = request.getParameter("deptName");		

	// Check If the deptName is already in the database
	int rtn = dbc.verify_department(deptName);
	if(rtn == 1){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('The Department is Already Exist');");
		out.println("location='addNewShip.jsp';");
		out.println("</script>");
		dbc.disconnect();
		return;
	}
	dbc.disconnect();
	
	String[] partArr = request.getParameterValues("partsSelect");
	String shipName = request.getParameter("shipName");	
	
	
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t</body>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
