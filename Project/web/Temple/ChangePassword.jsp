<%-- 
    Document   : ChangePassword
    Created on : 15 Jan, 2024, 12:33:36 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChangePassword</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String selTemple="select* from tbl_temple where temple_id='"+session.getAttribute("Tid")+"'";
            ResultSet rsTemple=conn.selectCommand(selTemple);
            rsTemple.next();
            if(request.getParameter("btnsub")!=null)
            {
                String upQry="update tbl_temple set  temple_password='"+request.getParameter("txt_new password")+"'where temple_id='"+session.getAttribute("Tid")+"'";
              conn.executeCommand(upQry);
              response.sendRedirect("ChangePassword.jsp");
            }
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Current password</td>
                    <td><input type="text"name="txt_currentpassword" value="<%=rsTemple.getString("temple_password")%>"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text"name="txt_newpassword"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="text"name="txt_confirmpassword"></td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
