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
        <title>Myprofile</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
       
             <%
String selUser="select* from tbl_user where user_id='"+session.getAttribute("uid")+"'";
          ResultSet rsuser=conn.selectCommand(selUser);
         rsuser.next();
            
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/UserPhoto/<%=rsuser.getString("user_photo")%>" width="150" height="150">
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td ><%=rsuser.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rsuser.getString("user_address")%></td>
            </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%=rsuser.getString("user_contact")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rsuser.getString("user_email")%></td>
                    </tr>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>

     
