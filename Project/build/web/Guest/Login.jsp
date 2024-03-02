<%-- 
    Document   : Login
    Created on : 11 Jan, 2024, 11:35:22 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
        if(request.getParameter("btnsub")!=null)
        {
            String email=request.getParameter("txt_Email");
            String password=request.getParameter("txt_Password");
            String selAdmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
            ResultSet rsAdmin=conn.selectCommand(selAdmin);
            String selTemple="select*from tbl_temple where temple_email='"+email+"'and temple_password='"+password+"'";
            ResultSet rsTemple=conn.selectCommand(selTemple);
            String selUser="select *from tbl_user where user_email='"+email+"'and user_password='"+password+"'";
            ResultSet rsUser=conn.selectCommand(selUser);
            if(rsAdmin.next())
            {
                session.setAttribute("adid", rsAdmin.getString("admin_id"));
                session.setAttribute("adname", rsAdmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
            }else if(rsTemple.next()){
                session.setAttribute("Tid", rsTemple.getString("temple_id"));
                session.setAttribute("Tname", rsTemple.getString("temple_name"));
                response.sendRedirect("../Temple/HomePage.jsp");
            }
            else if(rsUser.next()){
                session.setAttribute("uid", rsUser.getString("user_id"));
                session.setAttribute("uname", rsUser.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }
            else{
                %>
                <script>
                    alert("Invalid User")
                    windows.locations="Login.jsp";
                </script>
                <%
            }
        }
        
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_Email"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_Password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"name="btnsub"value="Login">
                        <input type="reset" name="btncan" value="cancel">
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
