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
            String sel = "select * from tbl_prasadambooking pb inner join tbl_prasadam p on p.prasadam_id=pb.prasadam_id inner join tbl_temple t on t.temple_id=p.temple_id  where user_id='" + session.getAttribute("uid") + "'";
            ResultSet rs = conn.selectCommand(sel);
            ResultSet rs1 = conn.selectCommand(sel);
            if (rs1.next()) {

        %>
        <h2>View Prasadam Booking</h2>
        <br>
        <table border="1">
            <tr>
                <th>Sl.No</th>
                <th>Date</th>
                <th>Time</th>
                <th>Temple</th>
                <th>Prasadham</th>
                <th>Qty</th>
                <th>Amount</th>
            </tr>
            <%              int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("pbooking_date")%></td>
                <td><%=rs.getString("pbooking_time")%></td>
                <td><%=rs.getString("temple_name")%></td>      
                <td><%=rs.getString("prasadam_name")%></td>
                <td><%=rs.getString("pbooking_unit")%></td>
                <td><%=rs.getString("pbooking_amount")%></td>
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


