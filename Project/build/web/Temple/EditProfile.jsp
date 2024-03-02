<%-- 
    Document   : EditProfile
    Created on : 15 Jan, 2024, 10:15:14 AM
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
              String selTemple="select *from tbl_temple where temple_id='"+session.getAttribute("Tid")+"'";
                ResultSet rsTemple=conn.selectCommand(selTemple);
                rsTemple.next();
                
            if(request.getParameter("btnsub")!=null)
            {
         
                String upQry="update tbl_temple set where temple_name='"+session.getAttribute("temple_name")+"'where temple_id='"+session.getAttribute("Tid")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("EditProfile.jsp");
            }
            
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" value="<%=rsTemple.getString("temple_name")%>"</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text"name="txt_Address"value="<%=rsTemple.getString("temple_address")%>"</td>
              </tr>
              <tr>
                  <td>Email</td>
                  <td><input type="text"name="txt_Email"value="<%=rsTemple.getString("temple_email")%>"</td>
              </tr>
              <tr>
                  <td>Contact</td>
                  <td><input type="text"name="txt_contact"value="<%=rsTemple.getString("temple_contact")%>"</td>
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
