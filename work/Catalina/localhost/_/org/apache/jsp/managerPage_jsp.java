package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class managerPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t\t<title>Manager Page</title>\n");
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
      out.write("\t\t</style>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("\t<div id=\"managerBox\">\n");
      out.write("\n");
      out.write("\t<center>\n");
      out.write("\t\t<h2>Manager Selection</h2>\n");
      out.write("\t\t<form action=\"managerPage.jsp\" method=\"post\">\n");
      out.write("\t\t\t<fieldset id = \"field1\">\n");
      out.write("\t\t\t\t<legend>Update Database:</legend>\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"myRadio\" value=\"addShip\"/> Add New Ship\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"myRadio\" value=\"addPart\"/> Add New Part\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"myRadio\" value=\"updatePartCost\"/> Update Part Cost\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t</fieldset>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<fieldset id = \"field2\">\n");
      out.write("\t\t\t\t<legend>Update Progress:</legend>\n");
      out.write("\t\t\t\t<input type=\"radio\" name=\"myRadio\" value=\"updateShipStatus\"/> Update Ship Building Progress or Scrap Ship\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t</fieldset>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\tPlease Choose One Action From Above:\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"submit\" value=\"submitBtn\" name=\"submitBtn\"> submit</button>\n");
      out.write("\t\t\t<button type=\"button\" onclick=\"window.location.href='login.jsp'\">Back</button>\n");
      out.write("\t\t</form>\n");
      out.write("\t</center>\n");
      out.write("\t</div>\n");
      out.write("\t");

		if(request.getParameter("submitBtn") == null){
			return;
		}
		else {
			String selection = request.getParameter("myRadio");
			if (selection == null){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Please Make Your Selection');");
				out.println("location='managerPage.jsp';");
				out.println("</script>");
			}
			else if(selection.equals("addShip")){
				out.println("<script type=\"text/javascript\">");
				out.println("window.open('addNewShip.jsp');");
				out.println("</script>");
			}
			else if(selection.equals("addPart")){
				out.println("<script type=\"text/javascript\">");
				out.println("window.open('addNewPart.jsp');");
				out.println("</script>");
			}
			else if(selection.equals("updatePartCost")){
				out.println("<script type=\"text/javascript\">");
				out.println("window.open('updatePartCost.jsp');");
				out.println("</script>");
			}
			else if(selection.equals("updateShipStatus")){
				out.println("<script type=\"text/javascript\">");
				out.println("window.open('updateShipStatus.jsp');");
				out.println("</script>");
			}
		}
	
      out.write("\n");
      out.write("\t</body>\n");
      out.write("</html>");
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
