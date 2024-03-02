<%-- 
    Document   : ComplaintType
    Created on : 10 Feb, 2024, 10:48:49 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ComplaintType</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <% 
            String id="",ComplaintType="";
            if(request.getParameter("btnsub")!= null)
            {
                if(request.getParameter("txt_hidden").equals(""))
                {
                String insQry="insert into tbl_complainttype(complainttype_name)values('"+request.getParameter("txt_complainttype")+"')";
            conn.executeCommand(insQry);
            }
                else
                {
                    String upQry="update tbl_complainttype set complainttype_name='"+request.getParameter("txt_complainttype")+"'where complaint type_id='"+request.getParameter("txt_hidden")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("ComplaintType.jsp");
            }
            }
                if (request.getParameter("ctid")!= null) {
                String delQry = "delete from tbl_complainttype where complainttype_id='" + request.getParameter("ctid") + "'";
                conn.executeCommand(delQry);
                response.sendRedirect("ComplaintType.jsp");

            }
            if (request.getParameter("clid") != null) {
                String selQ = "select *from tbl_complainttype where complainttype_id='" + request.getParameter("clid") + "'";
                ResultSet rss = conn.selectCommand(selQ);
                rss.next();
                id = rss.getString("complainttype_id");
                ComplaintType = rss.getString("complainttype_name");
            }
                
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>ComplaintType</td>
                    <td><input type="text"name="txt_complainttype"value="<%=ComplaintType%>">
                         <input type="hidden"name="txt_hidden"value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="2"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>ComplaintType</td>
                    <td>Action</td>
                </tr>
                 <%
                int i=0;
                String selQry="select * from tbl_complainttype";
                ResultSet rs2=conn.selectCommand(selQry);
                while(rs2.next())  {
                    i++;
                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs2.getString("complainttype_name")%></td>
                    <td><a href="ComplaintType.jsp?ctid=<%=rs2.getString("complainttype_id")%>">Delete</a>
                        <a href="ComplaintType.jsp?clid=<%=rs2.getString("complainttype_id")%>">Edit</a></td>
                </tr>
                <%
                }
                %>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
