package UACATS.servlets;
import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import UACATS.servlets.*;
import UACATS.utils.*;
import java.sql.*;

public class LoginServlet extends HttpServlet
{
    public LoginServlet()
    {
        super();
    }

    OracleConnect oc = new OracleConnect();

    public void drawHeader(HttpServletRequest req, PrintWriter out)
    {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>UA CATS logged in</title>");
        out.println("</head>");

        out.println("<body>");
        out.println("<p>");
        out.println("<center>");
    }

    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("</center>");
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }


    private void drawUACATSOptions(HttpServletRequest req, PrintWriter out)
    {
        out.println("<font size=5 face=\"Arial,Helvetica\">");
        out.println("<b>You have logged in to UA CATS</b></br>");
        out.println("<font size=4 color=\"#000066\">");
        out.println("<b>The University of Arizona Collection of Artworks</b><br></font>");
        out.println("</font>");

        out.println("<hr>");
        out.println("<br><br>");

        out.println("<form name=\"addArtifact\" action=AddArtifactServlet method=get>");
        out.println("<input type=submit name=\"addArtifact\" value=\"Add Artifact to UA CATS\">");
        out.println("</form>");

        out.println("<br>");

        out.println("<form name=\"findArtifact\" action=FindArtifactServlet method=get>");
        out.println("<input type=submit name=\"findArtifact\" value=\"Find Artifact by Search Condition\">");
        out.println("</form>");

        out.println("<br>");

        out.println("<form name=\"reportall\" action=./JSP/InstitutionReportSummary.jsp>");
        out.println("<input type=submit name=\"reportallsubmit\" value=\"Institution Report\">");
        out.println("</form>");

        out.println("<br>");

        out.println("<form name=\"logout\" action=index.html>");
        out.println("<input type=submit name=\"logoutUACATS\" value=\"Log out\">");
        out.println("</form>");
    }

    private void drawFailOptions(HttpServletRequest req, PrintWriter out)
    {
        out.println("<font size=5 face=\"Arial,Helvetica\">");
        out.println("<b>Failed to log in UA CATS. Check your username!</b></br>");
        out.println("<font size=4>");
        out.println("<b>The University of Arizona Collection of Artworks</b><br></font>");
        out.println("</font>");

        out.println("<hr");
        out.println("<br><br>");

        out.println("<form name=\"logout\" action=index.html>");
        out.println("<input type=submit name=\"home\" value=\"Return to Main Menu\">");
        out.println("</form>");

        out.println("<br>");
    }

    public void drawLoginSuccess(HttpServletRequest req, PrintWriter out)
    {
        drawHeader(req,out);
        drawUACATSOptions(req,out);
        drawFooter(req,out);
    }

    public void drawLoginFail(HttpServletRequest req, PrintWriter out)
    {
        drawHeader(req,out);
        drawFailOptions(req,out);
        drawFooter(req,out);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        //if login success, call the following function
        drawLoginSuccess(req,out);

        //if fail, call the following function
        //drawLoginFail(req,out);
    }
}


