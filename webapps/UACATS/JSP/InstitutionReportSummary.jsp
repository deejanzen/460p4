<%@ page language="java" contentType="text/html" %>

<html>

    <head><title>UA CATS Institution Report Summary</title></head>
    <body link=#f0f0ff alink vlink=#f0f0ff>
        <p>
            <center>
            <font size=7 face="Arial, Helvetica, sans-serif" color="#000066">
            <b>UA CATS</b><br>
            <font size=4>
                The University of Arizona Collection of Artworks</br>
            </font>
            </font>
            <hr>
            <br>

            <b>Institution Information in UA CATS System</b>
            <br>

        <%
/*              String customerfirstname="Tommy";
                String customerlastname="Brown";
                String customeraddress="989 East Beverly Hill, Los Angeles, CA 28374";
                String customergender="Male";
                String customeremail="tommy@hotmail.com";
                String customerphone="5207651111";
*/
                //Institution(City, Institution_Name, Visitor_Name, Endowment, G_or_M)
                String institution_name = "Museo Reina Sofia";
                String city = "Madrid";
                String g_or_m = "Museum";
                String endowment = "$10000000";

                //Artifact(Artifact_ID, Title, Image, Width, Height, Length)
                String width = "3" + " inches";
                String length = "40" + " inches";
                String height = "20" + " inches";
                String title = "Guernica";
                String artifact_id = "12344";
                String image_source = "http://www.cs.arizona.edu/classes/cs460/fall07/resources/images/Guernica.jpg";

/*              String vehicleVIN="ABC1234567890";
                String vehicleMake="BMW";
                String vehicleModel="325i";
                String vehicleYear="2006";
                String vehicleColor="Black";
                String vehicleState="AZ";
                String vehicleLP="AZ1928O";

                String citationID="11111";
                String citationAmount="100.00";
                String citationStatus="Paid";
                String citationDI="08/12/2004";

                String pType="Zone 1";
                String pRate="$250";
                String pPurchaseDate="08/08/2006";
                String pExpirationDate="08/08/2007";
*/

                out.println("<br>");
                out.println("<hr>");
//                out.println("<p><b>Name:</b>  " + customerfirstname + " " + customerlastname + "</p>");
//                out.println("<p><b>Address:</b> " + customeraddress + "</p>");
//                out.println("<p><b>Gender:</b>  " + customergender + "</p>");
//                out.println("<p><b>Email:</b>  " + customeremail + "</p>");
//                out.println("<p><b>Phone:</b>  " + customerphone + "</p>");
                out.println("<p><b>Institution Name:</b>  " + institution_name + "</p>");
                out.println("<p><b>Institution City:</b>  " + city + "</p>");
                out.println("<p><b>Museum / Gallery:</b>  " + g_or_m + "</p>");
                out.println("<p><b>Endowment:</b>  " + endowment + "</p>");

                out.println("<br>");

/*                out.println("<p><b> VIN:</b>  " + vehicleVIN + "</p>");
                out.println("<p><b> Make & Model:</b>  " + vehicleMake + " " + vehicleModel +"</p>");
                out.println("<p><b> Color:</b>  " + vehicleColor + "</p>");
                out.println("<p><b> State:</b>  " + vehicleState + "</p>");
                out.println("<p><b> Licence Plate:</b>  " + vehicleLP + "</p>");
                out.println("<br>");

                out.println("<p><b> Citation ID:</b>  " + citationID + "</p>");
                out.println("<p><b> Amount:</b>  $" + citationAmount +"</p>");
                out.println("<p><b> Status:</b>  " + citationStatus + "</p>");
                out.println("<p><b> Date Issued:</b>  " + citationDI + "</p>");
                out.println("<br>");

                out.println("<p><b>Permit Number:</b>PN12345</p>");
                out.println("<p><b>Permit Type:</b>  " + pType + "</p>");
                out.println("<p><b>Permit Rate:</b>  " + pRate + "</p>");
                out.println("<p><b>Purchase Date:</b> " + pPurchaseDate + "</p>");
                out.println("<p><b>Expiration Date:</b>  " + pExpirationDate +"</p>");
*/
                out.println("<p><b>Artifact ID:</b>" + artifact_id + "</p>");
                out.println("<p><b>Title:</b>  " + title + "</p>");
                out.println("<p><b>Image:</b></br>");
                out.println("<img src=\"" + image_source + "\" width = \"500\" /> </p>");
                out.println("<p><b>Width:</b>  " + width + "</p>");
                out.println("<p><b>Height:</b>  " + height + "</p>");
                out.println("<p><b>Length:</b>  " + length + "</p>");

                out.println("<hr>");
                out.println("<br><br>");

                out.println("<table>");
                        out.println("<tr>");
                        out.println("<td>");
                                out.println("<form name=\"mainmenu\" action=../LoginServlet method=get>");
                                out.println("<input type=submit name=\"MainMenu\" value=\"Main Menu\">");
                                out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");

                        out.println("<tr>");
                        out.println("<td>");
                                out.println("<form name=\"logout\" action=../index.html>");
                                out.println("<input type=submit name=\"logoutUACATS\" value=\"Logout\">");
                                out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");
                out.println("</table>");

        %>

            </center>
        </p>
    </body>
</html>


