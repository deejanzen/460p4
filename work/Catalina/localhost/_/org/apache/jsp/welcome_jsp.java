package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.StringBuffer;
import dbController.DatabaseController;

public final class welcome_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t\t<title>Search Results</title>\n");
      out.write("\t\t\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\tbutton {\n");
      out.write("\t\t\t    background-color: #4CAF50;\n");
      out.write("\t\t\t    color: white;\n");
      out.write("\t\t\t    padding: 14px 20px;\n");
      out.write("\t\t\t    margin: 8px 0;\n");
      out.write("\t\t\t    border: none;\n");
      out.write("\t\t\t    cursor: pointer;\n");
      out.write("\t\t\t    width: 100px;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t\n");
      out.write("\t\t\ttable {\n");
      out.write("\t\t\t\tfont-size: 18px;\n");
      out.write("\t\t\t\tfont-family:'Verdana';\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</style>\n");
      out.write("\t</head>\n");
      out.write("\t\n");
      out.write("\t<body>\n");
      out.write("\t\n");
      out.write("\t<div id=\"searchresult\" align=\"center\" >\n");
      out.write("\t");

  		request.setCharacterEncoding("utf-8");
 	 	response.setContentType("text/html;charset=utf-8");

  		DatabaseController dbcontroller = new DatabaseController();
  		// connect to backend database server via the databasecontroller, which
  		// is a wrapper class providing necessary methods for this particular
  		// application
  		dbcontroller.Open();

  		// writing the content on output/response page
  		out.write("<h1 style=\"color: #4CAF50;\">All Products</h1>");
  		out.write("<hr/>");

  		// stringbuffer to hold final content
  		StringBuffer content = new StringBuffer();;
  		content.append("<table>");
		
  		// asking dbcontroller to list the employee table
  		Vector<String> vecResult = dbcontroller.FindAllProducts();   
  		if (vecResult == null) {
             content.append("Query result is null!");
        } 		

		content.append("<tr><th><u>Barcode</u>&nbsp;&nbsp;&nbsp;&nbsp;</th>" + 
		"<th><u>Name of Product</u>&nbsp;&nbsp;&nbsp;&nbsp;</th> " + 
		"<th><u>Price</u>&nbsp;&nbsp;&nbsp;&nbsp;</th>" +
   		"<th><u>Quantity</u>&nbsp;&nbsp;&nbsp;&nbsp;</th></tr>");
  
  		if (vecResult != null && vecResult.size() > 0) {
    		for (int i = 0; i < vecResult.size(); i++) {
      			String row = vecResult.get(i);
     		 	String[] detail = row.split("##");
      			if (detail.length != 4) {
        		//break;
      			}
     	 	
     	 		content.append(
          			"<tr id=\"tablerow_" + i + "\">");
      			content.append(
          			"<td class=\"postlist\">" +
          			detail[0] + "</td>");
      			content.append(
          			"<td>" + detail[1] + "</td>");
      			content.append("<td>" + detail[2] + "</td>" +
                     "<td> &nbsp;&nbsp;" + detail[3] + "</td>");
      			content.append("</tr>");
    		}
  		}
  		out.write(content.toString());
		out.write("</table><hr/>");
  		// close the dbcontroller and relase all resources occupied by it.
  		dbcontroller.Close();
	
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t<br/>\n");
      out.write("    <center><button onClick=\"parent.location='SampleIndex.jsp'\">Logout</button></center>\n");
      out.write("    \n");
      out.write("    <div align=\"center\" style=\"position: absolute; bottom: 5px;\">\n");
      out.write("  \t\t<hr/>\n");
      out.write("    \t<p style=\"color: Black\"> &copy; Designed by Yawen Chen and Jacob Combs </p>\n");
      out.write("    </div>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
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
