<%-- 
    Document   : ViewFeedback
    Created on : 12 Feb, 2024, 12:09:01 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewfeedback</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>SLNO</td>
                    <td>Feedback</td>
                    <td>Date</td>
                    <td>Username</td>
                </tr>
                 <%
                    int i=0;
                    String selQry="select *from tbl_feedback f inner join tbl_user u on u.user_id=f.user_id";
                    ResultSet rss1=conn.selectCommand(selQry);
                    while(rss1.next())
                    {
                        i++;
                     %>
                     <tr>
                         <td><%=i%></td>
                         
                         <td><%=rss1.getString("feedback_content")%></td>
                         <td><%=rss1.getString("feedback_date")%></td>
                         <td><%=rss1.getString("user_name")%></td>
                        
                     </tr>
                     <%
                 }
                    %>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
