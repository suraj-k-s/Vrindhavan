<%-- 
    Document   : MyProfile
    Created on : 15 Jan, 2024, 12:45:37 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Booking</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>

        <%
            String sel = "select * from tbl_templechart where templ_id='" + request.getParameter("tid") + "'";
            ResultSet rs = conn.selectCommand(sel);
            ResultSet rs1 = conn.selectCommand(sel);
            if (rs1.next()) {

        %>
        <h2>View Temple Chart</h2>
        <br>
        <table border="1">
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Date</th>
                <th>Details</th>
            </tr>
            <%              int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("tchart_name")%></td>
                <td><%=rs.getString("tchart_date")%></td>
                <td><%=rs.getString("tchart_description")%></td>    
            </tr>
            <%
                }

            %>
        </table>
        <%        } else {
        %>
        <h2 align="center">No data Found</h2>
        <%
            }
        %>
    </body>
    <%@include file="Foot.jsp" %>
</html>


