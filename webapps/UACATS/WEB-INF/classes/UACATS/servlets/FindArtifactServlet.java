package UACATS.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import UACATS.servlets.*;
import UACATS.utils.*;
import java.sql.*;

public class FindArtifactServlet extends HttpServlet
{

    public FindArtifactServlet()
    {
        super();
    }

    public void drawHeader(HttpServletRequest req, PrintWriter out)
    {
        out.println("<html>");
        out.println("<head><title>Find Artifact</title></head>");

        out.println("<body>");
        out.println("<p>");
        out.println("<center>");
        out.println("<font size=5 face=\"Arial, Helvetica, sans-serif\" color=\"#000066\">");
        out.println("<b>UA CATS - Find Artifact</b><br></font>");

        out.println("<hr>");
        out.println("<br><br>");
    }

    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("<br>");
        out.println("<hr>");
        out.println("<br>");

        out.println("<p>");
                out.println("<form name=\"MainMenu\" action=LoginServlet method=get>");
                        out.println("<input type=submit name=\"MainMenu\" value=\"Main Menu\">");
                out.println("</form>");
        out.println("</p>");

        out.println("<p>");
                out.println("<form name=\"logout\" action=index.html>");
                        out.println("<input type=submit name=\"logoutUACATS\" value=\"Logout\">");
                out.println("</form>");
        out.println("</p>");

        out.println("<br><br>");
        out.println("</center>");
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }



/*    public void drawSelectMenu(HttpServletRequest req, PrintWriter out)
    {
        HttpSession session = req.getSession();
        String searchOption = (String)session.getAttribute("sOption");
        String citationID = (String)session.getAttribute("citationID");
        String amountMIN = (String)session.getAttribute("amountMIN");
        String amountMAX = (String)session.getAttribute("amountMAX");
        String status = (String)session.getAttribute("status");

        out.println("<h2 align=\"center\">Choose Search Option</h2>");

        out.println("<form name=\"citationSearch\" action=FindCitationServlet method=get>");

        out.println("<select name=\"sOption\">");
        out.println("<option value=\"null\">Choose Search Option:\n</option>");

        if (searchOption == null || searchOption.equals(""))
        {
            out.println("<option value=\"citationID\">Citation ID\n</option>");
            out.println("<option value=\"others\">Others\n</option></select>");

            out.println("<p>");
            out.println("<input type=submit name=\"searchop\" value=\"Select\" >");
            out.println("</p>");

            out.println("</form>");

        }
        else if (searchOption.equals("citationID")) 
        {
            out.println("<option selected=\"yes\" value=\"citationID\">Citation ID\n</option>");
            out.println("<option value=\"others\">Others\n</option></select><br>");

            out.println("Enter Citation ID: ");
            out.println("<input type=text size=30 name=\"citationID\">");

            //out.println("<p>");
            out.println("<input type=submit name=\"findcitation\" value=\"Find\" >");
            out.println("</p>");

            out.println("</form>");
        }
        else if (searchOption.equals("others")) 
        {
            out.println("<option value=\"citationID\">Citation ID\n</option>");
            out.println("<option selected=\"yes\" value=\"others\">Others\n</option></select><br>");

            out.println("<h2 align=\"center\">Amount</h2>");

            out.println("<select name=\"amountMIN\"> ");
            out.println("<option value=\"null\">$0\n</option>");

            if(amountMIN.equals("pricemin10")) 
            {
                out.println("<option selected=\"yes\" value=\"amountMIN25\">$25\n</option></select> to");
            }
            else 
            {
                out.println("<option value=\"amountMIN25\">$25\n</option></select> to");
            }

            out.println("<select size=\"1\" name=\"amountMAX\" >");
            out.println("<option value=\"null\">No Limit\n</option>");

            if(amountMAX.equals("amountMAX1k")) 
            {
                out.println("<option selected=\"yes\" value=\"amountMAX1k\">$1000\n</option></select>");
            }
            else 
            {
                out.println("<option value=\"amountMAX1k\">$1000\n</option></select>");
            }

            out.println("<h2 align=\"center\">Status</h2>");
            out.println("<select name=\"status\">");
            out.println("<option value=\"null\">Select</option>");

            if(status.equals("paid")) 
            {
                out.println("<option selected=\"yes\" value=\"paid\">Paid</option>");
                out.println("<option value=\"unpaid\">Unpaid</option></select><br>");
            }
            else if (status.equals("unpaid")) 
            {
                out.println("<option value=\"paid\">Paid</option>");
                out.println("<option selected=\"yes\" value=\"upaid\">Unpaid</option></select><br>");
            }
            else 
            {
                out.println("<option value=\"paid\">Paid</option>");
                out.println("<option value=\"unpaid\">Unpaid</option></select><br>");
            }

            out.println("<p>");
            out.println("<input type=submit name=\"findcitation\" value=\"Find\" >");
            out.println("</p>");

            out.println("</form>");

        }

    }
*/
    public void drawSelectMenu(HttpServletRequest req, PrintWriter out)
    {
        HttpSession session = req.getSession();
        String searchOption = (String)session.getAttribute("sOption");

System.out.println("CSC460: in drawSelect searchOption___" + searchOption+"___");

        //String artifactID = (String)session.getAttribute("artifactID");
        //double width = (double)session.getAttribute("width");
        //String title = (String)session.getAttribute("title");
        //String owner = (String)session.getAttribute("owner");
        //String price = (String)session.getAttribute("pprice");

        out.println("<h2 align=\"center\">Choose Search Option</h2>");

        out.println("<form name=\"artifactSearch\" action=FindArtifactServlet method=get>");

        out.println("<select name=\"sOption\">");

        if (searchOption.equals("artifactID")) 
        {
            out.println("<option selected=\"yes\" value=\"artifactID\">Artifact ID\n</option>");
            out.println("Enter Artifact ID: ");
            out.println("</select>");

            out.println("<input type=text size=30 name=\"artifactID\">");
            out.println("<p>");
            out.println("<input type=submit name=\"findartifact\" value=\"Find\" >");
            out.println("</p>");
            out.println("</form>");
        }
        else if(searchOption.equals("title"))
        {
            out.println("<option selected=\"yes\" value=\"title\">Title\n</option>");
            out.println("Enter Title: ");
            out.println("</select>");

            out.println("<input type=text size=30 name=\"title\">");
            out.println("<p>");
            out.println("<input type=submit name=\"findtitle\" value=\"Find\" >");
            out.println("</p>");
            out.println("</form>");
        }
        else //if (searchOption == null || searchOption.equals(""))
        {
            out.println("<option value=\"choose_option\">Choose Search Option:\n</option>"); 
            out.println("<option value=\"artifactID\">Artifact ID\n</option>");
            //out.println("<option value=\"others\">Others\n</option></select>");
            out.println("<option value=\"title\">Title\n</option>");
            out.println("<option value=\"owner\">Owner\n</option>");
            out.println("<option value=\"pprice\">Purchase Price\n</option>");
            out.println("</select>");

            out.println("<p>");
            out.println("<input type=submit name=\"searchop\" value=\"Select\" >");
            out.println("</p>");
            out.println("</form>");

        }
    }





    //DONE
    public void drawArtifactInfo(HttpServletRequest req, PrintWriter out)
    {

       //Artifact(Artifact_ID, Title, Image, Width, Height, Length)
        String width = "3" + " inches";
        String length = "40" + " inches";
        String height = "20" + " inches";
        String title = "Guernica";
        String artifact_id = "12344";
        String image_source = "http://www.cs.arizona.edu/classes/cs460/fall07/resources/images/Guernica.jpg";

        String owner = "Museo Reina Sofia-Madrid"; //this is the visitor_name
        String price = "$4500000"; //this is purchase price

        out.println("<br>");
        out.println("<hr>");

        out.println("<p><b>Artifact ID:</b>" + artifact_id + "</p>");
        out.println("<p><b>Title:</b>  " + title + "</p>");
        out.println("<p><b>Image:</b> </br>");
        out.println("<img src=\"" + image_source + "\" width = \"500\" /> </p>");
        out.println("<p><b>Width:</b>  " + width + "</p>");
        out.println("<p><b>Height:</b>  " + height + "</p>");
        out.println("<p><b>Length:</b>  " + length + "</p>");

        out.println("<p><b>Owner:</b>  " + owner + "</p>");
        out.println("<p><b>Purchase Price:</b>  " + price + "</p>");
    }


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();

        drawHeader(req,out);

        if(req.getParameter("findartifact") != null)
        {
            session.setAttribute("sOption", req.getParameter("sOption"));
            session.setAttribute("artifactID", req.getParameter("artifactID"));

            System.out.println("CSC460: inside doGet findartifact____" + req.getParameter("artifactID") +"___");

            drawArtifactInfo(req,out);

        }
        else if(req.getParameter("findtitle") != null)
        {
            session.setAttribute("sOption", req.getParameter("sOption"));
            session.setAttribute("title", req.getParameter("title"));
            drawArtifactInfo(req,out);
        }
        else if (req.getParameter("searchop") != null) 
        {
            session.setAttribute("sOption", req.getParameter("sOption"));
            session.setAttribute("artifactID", req.getParameter("artifactID"));
            session.setAttribute("owner", req.getParameter("owner"));
            session.setAttribute("pprice", req.getParameter("pprice"));

            drawSelectMenu(req,out);
        }
        else
        {
            String clearinput="";
            session.setAttribute("sOption", clearinput);
            session.setAttribute("artifactID", clearinput);

            drawSelectMenu(req,out);
        }
        drawFooter(req,out);
    }
}



