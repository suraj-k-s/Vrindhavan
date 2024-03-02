<%-- 
    Document   : AdminRegistration
    Created on : 28 Dec, 2023, 11:46:16 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
    <%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminRegistration</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <% 
            String id="",name="",contact="",Email="",password="";
            if(request.getParameter("btnsub")!=null)
            {
                if(request.getParameter("txt_hidden").equals(""))
                {
                String insQry="insert into tbl_admin(admin_name,admin_contact,admin_email,admin_password)values('"+request.getParameter("txt_name")+"','"+request.getParameter("txt_contact")+"','"+request.getParameter("txt_Email")+"','"+request.getParameter("txt_password")+"')";
             conn.executeCommand(insQry);
            }
                else
                {
                    String upQry="update tbl_admin set where admin_name='"+request.getParameter("txt_name")+"',admin_contact'"+request.getParameter("txt_contact")+"',admin_email='"+request.getParameter("txt_Email")+"',admin_password='"+request.getParameter("txt_password")+"'where admin_id='"+request.getParameter("txt_hidden")+"'";
                    conn.executeCommand(upQry);
                }   response.sendRedirect("AdminRegistration.jsp");
            }
            if(request.getParameter("admn")!=null)
            {
                String delQry="delete from tbl_admin where admin_id ='"+request.getParameter("admn")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("AdminRegistration.jsp");
            }
            if(request.getParameter("adid")!=null)
            {
                String selQ="select * from tbl_admin where admin_id='"+request.getParameter("adid")+"'";
                ResultSet rss =conn.selectCommand(selQ);
                rss.next();
                id=rss.getString("admin_id");
                name=rss.getString("admin_name");
                contact=rss.getString("admin_contact");
                Email=rss.getString("admin_Email");
                password=rss.getString("admin_password");
                
            }
                        %>

        <form method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" value="<%=name%>" required="" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$">>
                     <input type="hidden" name="txt_hidden" value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact" required="" pattern="[7-9]{1}[0-9]{9}" title="Phone number with 7-9 and remaing 9 digit with 0-9"/></td>
                      
                </tr>
                <tr>
                <td>Email</td>
                <td><input type="email" name="txt_Email">
             </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" name="txt_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="txt_pass" /></td>
                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsub" value="submit">
                        <input type="reset" name="btncan" value="cancel"></td>
           </tr>
            </table> 
            <table>
                <table border="1" align="center">
                <tr>
                    <td>SLNO</td>
                    <td>Name</td>
                    <td>Contact</td>
                    <td>Email</td>
                    <td>Password</td>
                    <td>Action</td>
                </tr>
                <%
                  int i=0;
                  String selQry="select *from tbl_admin";
                  ResultSet rs= conn.selectCommand(selQry);
                  while(rs.next())
                  {
                      i++;
                      %>
               <tr>
                   <td><%=i%></td>
                   <td> <%= rs.getString("admin_name")%></td>
                   <td> <%= rs.getString("admin_contact")%></td>
                   <td> <%= rs.getString("admin_email")%></td>
                   <td> <%= rs.getString("admin_password")%></td>
                   <td><a href="AdminRegistration.jsp?admn=<%= rs.getString("admin_id")%>">Delete</a>
                       <a href="AdminRegistration.jsp?adid=<%=rs.getString("admin_id")%>">Edit</a></td>
           </tr>
               <%
                  }
                  %>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
