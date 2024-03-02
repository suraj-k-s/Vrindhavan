<%-- 
    Document   : EditProfile
    Created on : 15 Jan, 2024, 1:59:48 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
    <%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditProfile</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
              String selUser="select *from tbl_user where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rsuser=conn.selectCommand(selUser);
                rsuser.next();
                
            if(request.getParameter("btnsub")!=null)
            {
         
                String upQry="update tbl_user set where user_name='"+session.getAttribute("user_name")+"'where user_id='"+session.getAttribute("uid")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("EditProfile.jsp");
            }
            
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" value="<%=rsuser.getString("user_name")%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text"name="txt_Address"value="<%=rsuser.getString("user_address")%>"></td>
              </tr>
              <tr>
                  <td>Email</td>
                  <td><input type="text"name="txt_Email"value="<%=rsuser.getString("user_email")%>"></td>
              </tr>
              <tr>
                  <td>Contact</td>
                  <td><input type="text"name="txt_contact"value="<%=rsuser.getString("user_contact")%>"></td>
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

    