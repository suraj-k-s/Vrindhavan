<%-- 
    Document   : MyProfile
    Created on : 13 Jan, 2024, 10:16:14 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
String selTemple="select* from tbl_temple where temple_id='"+session.getAttribute("Tid")+"'";
          ResultSet rsTemple=conn.selectCommand(selTemple);
         rsTemple.next();
            
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/TemplePhoto/<%=rsTemple.getString("temple_photo")%>" width="150" height="150">
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td ><%=rsTemple.getString("temple_name")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rsTemple.getString("temple_address")%></td>
            </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%=rsTemple.getString("temple_contact")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rsTemple.getString("temple_email")%></td>
                    </tr>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
