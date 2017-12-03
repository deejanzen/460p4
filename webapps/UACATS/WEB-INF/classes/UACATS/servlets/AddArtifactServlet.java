package UACATS.servlets;
import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import UACATS.servlets.*;
import UACATS.utils.*;


public class AddArtifactServlet extends HttpServlet
{
    public AddArtifactServlet()
    {
        super();
    }


    public void drawUpdateMessage(HttpServletRequest req, PrintWriter out)
    {
        //String dobmonth="05";
        //String dobday="15";
        //String dobyear="1985";
        String width = "3" + " inches";
        String length = "40" + " inches";
        String height = "20" + " inches";
        String title = "Guernica";
        String artifact_id = "12344";
        String image_source = "http://www.cs.arizona.edu/classes/cs460/fall07/resources/images/Guernica.jpg";

        //String firstname="Tommy";
        //String lastname="Brown";
        //String address="989 East Beverly Hill, Los Angeles, CA 28374";
        //String gender="Male";
        //String email="tommy@hotmail.com";
        //String phone="5207651111";

        //String vehicleVIN="ABC1234567890";
        //String vehicleMake="BMW";
        //String vehicleModel="325i";
        //String vehicleYear="2006";
        //String vehicleColor="Black";
        //String vehicleState="AZ";
        //String vehicleLP="AZ1928O";

        out.println("<h2 align=\"center\">New artifact added!</h2>");
        out.println("<br>");

        out.println("<p><b>Artifact ID:</b>" + artifact_id + "</p>");
        out.println("<p><b>Title:</b>  " + title + "</p>");
        out.println("<p><b>Image:</b> </p>");
	out.println("<p><img src= \"" + image_source + "\" width = \"500\" /> </p>");
        out.println("<p><b>Width:</b>  " + width + "</p>");
        out.println("<p><b>Height:</b>  " + height + "</p>");
        out.println("<p><b>Length:</b>  " + length + "</p>");

        //out.println("<p><b>Name:</b>  " + firstname + lastname + "</p>");
        //out.println("<p><b>Address:</b>  " + address + "</p>");
        //out.println("<p><b>Gender:</b> " + gender + "</p>");
        //out.println("<p><b>Email:</b>  " + email+"</p>");
        //out.println("<p><b>Phone Number:</b>  " + phone +"</p>");


        //out.println("<br><br><br>");

        //out.println("<p><b> VIN:</b>  " + vehicleVIN + "</p>");
        //out.println("<p><b> Make & Model:</b>  " + vehicleMake + " " + vehicleModel +"</p>");
        //out.println("<p><b> Color:</b>  " + vehicleColor + "</p>");
        //out.println("<p><b> State:</b>  " + vehicleState + "</p>");
        //out.println("<p><b> Licence Plate:</b>  " + vehicleLP + "</p>");

        out.println("<br>");

        out.println("<form name=\"MainMenu\" action=LoginServlet>");
        out.println("<input type=submit name=\"MainMenu\" value=\"MainMenu\">");
        out.println("</form>");

        out.println("<br>");

        out.println("<form name=\"logout\" action=index.html>");
        out.println("<input type=submit name=\"logoutUACATS\" value=\"Logout\">");
        out.println("</form>");
    }


    public void drawHeader(HttpServletRequest req, PrintWriter out)
    {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Artifact Addition</title>");
        out.println("</head>");

        out.println("<body>");
        out.println("<p>");
        out.println("<center>");
        out.println("<font size=7 face=\"Arial, Helvetica, sans-serif\" color=\"#000066\">");
        out.println("<b>UA CATS - Add new artifact to UA CATS</b><br></font>");

        out.println("<hr>");
        out.println("<br><br>");
    }


    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("</center>");
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }


    public void drawAddArtifactMenu(HttpServletRequest req, PrintWriter out)
    {
            out.println("<form name=\"AddArtifact\" action=AddArtifactServlet method=get>");
                    out.println("<br><br>");
                    out.println("<font size=3 face=\"Arial, Helvetica, sans-serif\" color=\"#000066\">");
                    out.println("New Artifact Information:<br>");
                    out.println("<p>");
                            out.println("<b>Artifact ID:</b>");
                            out.println("<input type=text name=\"artifactid\">");
                            out.println("<br>");
                    out.println("</p>");

                    out.println("<p>");
                            out.println("<b>Title:</b>");
                            out.println("<input type=text name=\"title\">");
                            out.println("<br>");
                    out.println("</p>");

                    out.println("<p>");
                            out.println("<b>Image file:</b>");
                            out.println("<input type=text name=\"imagepath\">");
                            out.println("<br>");
                    out.println("</p>");

                    //out.println("<p align=\"center\">");
                    //        out.println("<b>Gender:</b>");
                    //        out.println("<select size=\"1\" name=\"Gender\">");
                    //            out.println("<option selected value=\"null\">Male</option>");
                    //            out.println("<option value=\"Jan\">Female</option>");
                    //        out.println("</select>");
                   // out.println("</p>");

                    out.println("<b> Width:</b>");
                    out.println("<input type=text name=\"width\" ><br><br>");
                    out.println("<b> Height:</b>");
                    out.println("<input type=text name=\"height\"><br><br>");
                    out.println("<b> Length:</b>");
                    out.println("<input type=text name=\"length\"><br><br>");

                    /*
                    out.println("<p><br><b> Password:</b>");
                            out.println("<input type=text name=\"pw\"><br><br>");

                            out.println("<b> Confirm Password:</b>");
                            out.println("<input type=text name=\"pwconfirm\"><br><br>");
                    out.println("</p>");

                    out.println("Customer' Vehicles:<br>");
                    out.println("<b>VIN:</b>");
                            out.println("<input type=text name=\"vin1\" size=20><br><br>");
                    out.println("<b>Make:</b>");
                            out.println("<input type=text name=\"make1\" size=20><br><br>");
                    out.println("<b>Model:</b>");
                            out.println("<input type=text name=\"model1\" size=20><br><br>");
                    out.println("<b>Year:</b>");
                            out.println("<input type=text name=\"year1\" size=4><br><br>");
                    out.println("<b>Color:</b>");
                            out.println("<input type=text name=\"color1\" size=20><br><br>");
                    out.println("<b>State:</b>");
                            out.println("<input type=text name=\"state1\" size=2><br><br>");
                    out.println("<b>LicenPlate:</b>");
                            out.println("<input type=text name=\"licenceplate1\" size=20><br><br>");
                    out.println("<br>");

                    out.println("<b>VIN:</b>");
                            out.println("<input type=text name=\"vin2\" size=20><br><br>");
                    out.println("<b>Make:</b>");
                            out.println("<input type=text name=\"make2\" size=20><br><br>");
                    out.println("<b>Model:</b>");
                            out.println("<input type=text name=\"model2\" size=20><br><br>");
                    out.println("<b>Year:</b>");
                            out.println("<input type=text name=\"year2\" size=4><br><br>");
                    out.println("<b>Color:</b>");
                            out.println("<input type=text name=\"color2\" size=20><br><br>");
                    out.println("<b>State:</b>");
                            out.println("<input type=text name=\"state2\" size=2><br><br>");
                    out.println("<b>LicenPlate:</b>");
                            out.println("<input type=text name=\"licenceplate2\" size=20><br><br>");
                    */
                    out.println("<table>");
                            out.println("<tr>");
                                    out.println("<td>");
                                        out.println("<input type=submit name=\"Submit\" value=\"Insert\">&nbsp&nbsp");
                                    out.println("</td>");
                            out.println("</tr>");

                    out.println("</form>");

                            out.println("<tr>");
                                    out.println("<td>");
                                        out.println("<form name=\"Cancel\" action=AddArtifactServlet method=get>");
                                        out.println("<input type=submit name=\"Cancel\" value=\"Cancel\">&nbsp&nbsp");
                                        out.println("</form>");
                                    out.println("</td>");
                            out.println("</tr>");

                            out.println("<tr>");
                                out.println("<td>");
                                    out.println("<form name=\"MainMenu\" action=LoginServlet>");
                                    out.println("<input type=submit name=\"MainMenu\" value=\"Return to Main Menu\">");
                                    out.println("</form>");
                                out.println("</td>");
                            out.println("</tr>");

                    out.println("</table>");
            out.println("<br><br><br>");
    }


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        drawHeader(req,out);

        if(req.getParameter("Submit") == null)
        {
            drawAddArtifactMenu(req,out);
        }
        else
        {
            drawUpdateMessage(req,out);
        }

        drawFooter(req,out);
    }
}
