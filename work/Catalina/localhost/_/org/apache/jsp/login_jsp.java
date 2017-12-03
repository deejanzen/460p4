package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Login</title>\n");
      out.write("</head>\n");
      out.write("<style>\n");
      out.write("\t#loginbox {\n");
      out.write("\t\tborder: 2px solid black;\n");
      out.write("\t\tborder-radius: 5px;\n");
      out.write("\t\ttext-align: center;\n");
      out.write("\t\tpadding: 20px;\n");
      out.write("\t\theight: 200px;\n");
      out.write("\t\twidth: 400px;\n");
      out.write("\t\tposition:relative;\n");
      out.write("\t\tleft:35%;\n");
      out.write("\t}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("\t<h2>Login</h2>\n");
      out.write("\t<div id=\"loginbox\">\n");
      out.write("\t\t<form action=\"login.jsp\">\n");
      out.write("\t\t\tUserID <input type=\"text\" id=\"userid\" name=\"userid\"> \n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\tPassword <input type=\"password\" id=\"password\" name=\"password\">\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"submit\" value=\"submitBtn\" name=\"submitBtn\"> login</button>\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"button\" onclick=\"window.location.href='register.jsp'\">Register</button>\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"button\" onclick=\"window.location.href='managerPage.jsp'\">Manager</button>\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<button type=\"button\" onclick=\"window.location.href='customerPage.jsp'\">Customer</button>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("\t");

		if (request.getParameter("submitBtn") == null){
			return;
		}
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("password");
		session.setAttribute("userID",userid);
		session.setAttribute("userType","1");
		
		int userType = 0;
		
		if(userType == 1){
			response.sendRedirect("customerPage.jsp");
			session.setAttribute("userType","1");
		}
		if(userType ==2 ){
			response.sendRedirect("managerPage.jsp");
			session.setAttribute("userType","2");
		}
		else if(userType == 0){
			out.write("<h1>your userid or password is not correct!</h1>");
		}
	
	
      out.write("\n");
      out.write("</body>\n");
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
