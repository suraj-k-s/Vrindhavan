<%-- 
    Document   : QueueType
    Created on : 1 Jan, 2024, 12:15:48 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QueueType</title>
    </head>
        <%@include file="Head.jsp" %>

    <body>
        <%
            String id="",QueueName="";
            if(request.getParameter("btnsub")!=null){
                if(request.getParameter("txt_hidden").equals("")) {
                String insQry="insert into tbl_queuetype(queuetype_name)value('"+request.getParameter("txt_name")+"')";
                conn.executeCommand(insQry);
            }
            else
                {
                    String upQry="update tbl_queuetype set queuetype_name='"+request.getParameter("txt_name")+"'where queuetype_id='"+request.getParameter("txt_hidden")+"'";
                  conn.executeCommand(upQry);
                  response.sendRedirect("QueueType.jsp");
                  
                }
            }
            if(request.getParameter("Qid")!=null){
                String delQry="delete from tbl_queuetype where queuetype_id='"+request.getParameter("Qid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("QueueType.jsp");
            }
             if(request.getParameter("Lid")!=null)
             {
                 String selQ="select*from tbl_queuetype where queuetype_id='"+request.getParameter("Lid")+"'";
                 ResultSet rss=conn.selectCommand(selQ);
                 rss.next();
                 id= rss.getString("queuetype_id");
                 QueueName=rss.getString("queuetype_name");
             }
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>QueueType</td>
                    <td><input type="text"name="txt_name"value="<%=QueueName%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"</td>
               </tr>
               <tr>
                   <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                       <input type="reset"name="btncan"value="cancel"></td>
               </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>QueueType</td>
                    <td>Action</td>
                    </tr>
                    <%
                    int i = 0;
                    String selQry="select *from tbl_queuetype";
                     ResultSet rs = conn.selectCommand(selQry);

                    while (rs.next()) {
                        i++;
                %> 
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("queuetype_name")%></td>
                    <td><a href="QueueType.jsp?Qid=<%=rs.getString("queuetype_id")%>">Delete</a>
                        <a href="QueueType.jsp?Lid=<%=rs.getString("queuetype_id")%>">Edit</a></td>
                </tr>
                <%
                    }
                    %>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %> 
</html>
