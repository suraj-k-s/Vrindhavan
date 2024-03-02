<%-- 
    Document   : Designation
    Created on : 4 Jan, 2024, 12:33:01 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designation</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",designation="";
            if(request.getParameter("btnsub")!=null){
            
                if(request.getParameter("txt_hidden").equals(""))
                {
                String insQry="insert into tbl_designation(designation_name)values('"+request.getParameter("txt_designation")+"')";
           conn.executeCommand(insQry);
//           out.print(insQry);
         }
                else
                {
                    String upQry="update tbl_designation set designation_name='"+request.getParameter("txt_designation")+"' where designation_id='"+request.getParameter("txt_hidden")+"' ";
                    conn.executeCommand(upQry);
                    response.sendRedirect("Designation.jsp");
                }
                }
                if(request.getParameter("hid")!=null)
                {
                    String delQry="delete from tbl_designation where designation_id='"+request.getParameter("hid")+"'";
                    conn.executeCommand(delQry);
                    response.sendRedirect("Designation.jsp");
                }
                if(request.getParameter("jid")!=null)
                {
                    String selQ="select*from tbl_designation where designation_id='"+request.getParameter("jid")+"'";
                    ResultSet rss=conn.selectCommand(selQ);
                    rss.next();
                    id=rss.getString("designation_id");
                    designation=rss.getString("designation_name");
                }
            %>   
        <form method="post">
            <table border="1">
                <tr>
                    <td>Designation</td>
                    <td><input type="text"name="txt_designation"value="<%=designation%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"></td>
                </tr> 
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>Designation</td>
                    <td>Action</td>
                </tr>
                    <%
                        int i=0;
                        String selQry="select *from tbl_designation";
                     ResultSet rs= conn.selectCommand(selQry);
                     while(rs.next())
                     {
                         i++;
                     %>
                     <tr>
                         <td><%=i%></td>
                         <td><%=rs.getString("designation_name")%></td>
                         <td><a href="Designation.jsp?hid=<%=rs.getString("designation_id")%>">Delete</a>
                             <a href="Designation.jsp?jid=<%=rs.getString("designation_id")%>">Edit</a></td>
                     </tr>
                     <%
                     }
                     %>
          </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
