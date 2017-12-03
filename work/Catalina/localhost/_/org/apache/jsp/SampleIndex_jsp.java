package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SampleIndex_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<title>Welcome to the CSc 460 Supermarket</title>\n");
      out.write("\t\t<meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\" />\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"scripts/search.js\"></script>\n");
      out.write("\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\tbody {\n");
      out.write("\t        \tbackground-image: url(\"back.jpg\");\n");
      out.write("\t        \tbackground-size: cover;\n");
      out.write("\t        \tbackground-repeat: no-repeat;\n");
      out.write("\t        \tbackground-position: center center;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\tinput[type=text], input[type=password] {\n");
      out.write("    \t\t\twidth: 20%;\n");
      out.write("    \t\t\tpadding: 12px 20px;\n");
      out.write("    \t\t\tmargin: 8px 0;\n");
      out.write("    \t\t\tdisplay: inline-block;\n");
      out.write("    \t\t\tborder: 1px solid #ccc;\n");
      out.write("    \t\t\tbox-sizing: border-box;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
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
      out.write("\n");
      out.write("\t<body>\n");
      out.write("\t\t<br/><br/><br/>\n");
      out.write("\t\t<br/><br/><br/>\n");
      out.write("\t\t<br/><br/><br/>\n");
      out.write("\t\t<br/><br/><br/>\n");
      out.write("\n");
      out.write("\t\t<div align=\"center\">\n");
      out.write("  \t\t<h1 style=\"color: white\"><b>Welcome to the CSc460 Supermarket</b></h1>\n");
      out.write("  \t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"container\" align=\"center\">\n");
      out.write("    \t\t<label style=\"color: white\"><b>Username</b></label>\n");
      out.write("    \t\t<input type=\"text\" id=\"myText\" placeholder=\"Please Enter Username\" required>\n");
      out.write("    \t\t<br/>\n");
      out.write("\n");
      out.write("    \t\t<label style=\"color: white\"><b>Password </b></label>\n");
      out.write("    \t\t<input type=\"password\" placeholder=\"Please Enter Password\" required>\n");
      out.write("    \t\t<br/>\n");
      out.write("        \n");
      out.write("    \t\t<button type=\"button\" id=\"btn_search\" onclick=\"window.location.href='welcome.jsp'\">Login</button>\n");
      out.write("    \t\t<button type=\"button\" id=\"btn_return\" onclick=\"window.location.href='index.html'\">Back</button>\n");
      out.write("    \t\t<br/><br/>\n");
      out.write("  \t\t</div>\n");
      out.write("\n");
      out.write("  \t\t<div align=\"center\" style=\"position: absolute; bottom: 5px;\">\n");
      out.write("  \t\t\t<hr/>\n");
      out.write("    \t\t<p style=\"color: white\"> &copy; Designed by Yawen Chen and Jacob Combs </p>\n");
      out.write("    \t</div>\n");
      out.write("\n");
      out.write("<!-- \n");
      out.write("    \t<script>\n");
      out.write("\t\t\tfunction myFunction() {\n");
      out.write("    \t\t\tvar x = document.getElementById(\"myText\").value;\n");
      out.write("    \t\t\twindow.location.href=\"./welcome.html\";\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</script>\n");
      out.write(" -->\n");
      out.write("\t</body>\n");
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
