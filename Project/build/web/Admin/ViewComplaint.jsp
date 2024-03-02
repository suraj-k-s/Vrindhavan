<%-- 
    Document   : ViewComplaint
    Created on : 12 Feb, 2024, 10:20:49 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewComplaint</title>
    </head>
     <%@include file="Head.jsp" %>
    <body >
        <h1>NewComplaint</h1>
        <%
            if(request.getParameter("vcid")!=null)
            {
                String upQry="update tbl_complaint set complaint_content='"+request.getParameter("txt_complaint")+"','"+session.getAttribute("uid")+"'";
              conn.executeCommand(upQry);
              response.sendRedirect("ViewComplaint.jsp");
            }
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>SLNO</td>
                    <td>ComplaintType</td>
                    <td>Complaint</td>
                    <td>Date</td>
                    <td>UserName</td>
                    <td>Action</td>
                </tr>
                <%
                    int i=0;
                    String selQry="select *from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id";
                    ResultSet rss=conn.selectCommand(selQry);
                    while(rss.next())
                    {
                        i++;
                     %>
                     <tr>
                         <td><%=i%></td>
                         <td><%=rss.getString("complainttype_id")%></td>
                         <td><%=rss.getString("complaint_content")%></td>
                         <td><%=rss.getString("complaint_date")%></td>
                         <td><%=rss.getString("user_name")%></td>
                         <td><a href="ViewComplaint.jsp?vcid=<%=rss.getString("complaint_id")%>">Reply</a>
                     </tr>
                     <%
                 }
                    %>
            </table>
        </form>
    </body>
      <%@include file="Foot.jsp" %>
</html>
