package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.lang.StringBuffer;
import dbController.DatabaseController;

public final class searchprocess_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Search Results</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"searchresult\">\n");

  request.setCharacterEncoding("utf-8");
  response.setContentType("text/html;charset=utf-8");

  DatabaseController dbcontroller = new DatabaseController();
  // connect to backend database server via the databasecontroller, which
  // is a wrapper class providing necessary methods for this particular
  // application
  dbcontroller.Open();

  // writing the content on output/response page
  out.write("<h2>All Employees</h2>");

  // stringbuffer to hold final content
  StringBuffer content = new StringBuffer();;
  content.append("<br/><table>");

  // asking dbcontroller to list the employee table
  Vector<String> vecResult = dbcontroller.FindAllEmployees();
   if (vecResult == null) {
     content.append("Query result is null!");
   }
   content.append("<tr><th>FNAME</th><th>MNAME</th><th>LNAME</th>" +
   "<th>SSN</th><th>BDATE</th><th>ADDRESS</th><th>SEX</th><th>SALARY</th>" + 
   "<th>SUPERSSN</th><th>DNO</th></tr>");
  if (vecResult != null && vecResult.size() > 0) {
    for (int i = 0; i < vecResult.size(); i++) {
      String row = vecResult.get(i);
      String[] detail = row.split("##");
      if (detail.length != 5) {
        //break;
      }
      content.append(
          "<tr id=\"tablerow_" + i + "\">");
      content.append(
          "<td class=\"postlist\"><a href=\"javascript:void(0)\" " +
          "\"><b>" + detail[0] + "</b></a></td>");
      content.append(
          "<td><a href=\"javascript:void(0)\" >" +
          "<b>" + detail[1] + "</b></a></td>");
      content.append("<td>" + detail[2] + "</td>" +
                     "<td>" + detail[3] + "</td>" +
                     "<td>" + detail[4] + "</td>" +
"<td>" + detail[5] + "</td>" +
"<td>" + detail[6] + "</td>" +
"<td>" + detail[7] + "</td>" +
"<td>" + detail[8] + "</td>" +
"<td>" + detail[9] + "</td>");
      content.append("</tr>");
    }
  }
  out.write(content.toString());

  // close the dbcontroller and relase all resources occupied by it.
  dbcontroller.Close();

      out.write("\n");
      out.write("</div>\n");
      out.write("</body>\n");
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
