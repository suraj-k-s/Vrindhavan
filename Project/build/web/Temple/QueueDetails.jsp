<%-- 
    Document   : QueueDetails
    Created on : 29 Jan, 2024, 11:36:14 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QueueDetails</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",Time="",count="",Amount="";
            if(request.getParameter("btnsub")!=null){
              if(request.getParameter("txt_hidden").equals(""))
              {
                String insQry="insert into tbl_queue(queue_time,queue_count,temple_id,queuetype_id,queue_amount)values('"+request.getParameter("txt_time")+"','"+request.getParameter("txt_count")+"','"+session.getAttribute("Tid")+"','"+request.getParameter("sel_queue")+"','"+request.getParameter("txt_amount")+"')";
              conn.executeCommand(insQry);
              //out.print(insQry);
            }
              else
              {
                  String upQry="update tbl_queue set queue_time='"+request.getParameter("txt_time")+"',queue_count='"+request.getParameter("txt_count")+"',queue_amount='"+request.getParameter("txt_amount")+"'where queue_id='"+request.getParameter("txt_hidden")+"'";
              conn.executeCommand(upQry);
              response.sendRedirect("QueueDetails.jsp");
              }
            }
            if(request.getParameter("Qdid")!=null)
            {
                String delQry="delete from tbl_queue where queue_id='"+request.getParameter("Qdid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("QueueDetails.jsp");
            }
            if(request.getParameter("mid")!=null)
            {
                String selQ="select * from tbl_queue where queue_id='"+request.getParameter("mid")+"'";
                ResultSet rss1=conn.selectCommand(selQ);
                System.out.print(selQ);
                rss1.next();
              id=rss1.getString("queue_id");
               Time= rss1.getString("queue_time");
               count= rss1.getString("queue_count");
               Amount= rss1.getString("queue_amount");
            }
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>QueueType</td>
                    <td><select name="sel_queue">
                            <option>select</option>
                           <%
                                        String selQ="select*from tbl_queuetype";
                                        ResultSet rs=conn.selectCommand(selQ);
                                        while(rs.next())
                                        {
                                        %>
          <option value="<%=rs.getString("queuetype_id")%>"<% if(rs.getString("queuetype_id").equals(id)){out.print("selected") ;}%>><%=rs.getString("queuetype_name")%></option>
                                        <%
                                        }
                                        %> 
                        </select>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="text"name="txt_time"value="<%=Time%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"</td>
                </tr>
                <tr>
                    <td>Count</td>
                    <td><input type="text"name="txt_count"value="<%=count%>" ></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text"name="txt_amount"value="<%=Amount%>"></td>
                </tr>
                <tr>
                    <td colspan ="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel">
                </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>QueueType</td>
                    <td>Time</td>
                    <td>Count</td>
                    <td>Amount</td>
                    <td>Action</td>
                </tr>
                <%
                  int i=0;
                  String selQry="select * from tbl_queue q inner join tbl_queuetype n on n.queuetype_id=q.queuetype_id";
                  ResultSet rss=conn.selectCommand(selQry);
                  while(rss.next())
                  {
                      i++;
                  
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rss.getString("queuetype_name")%></td>
                    <td><%=rss.getString("queue_time")%></td>
                  <td><%=rss.getString("queue_count")%></td>
                  <td><%=rss.getString("queue_amount")%></td>
                 <td><a href="QueueDetails.jsp?Qdid=<%=rss.getString("queue_id")%>">Delete</a>
                   <a href="QueueDetails.jsp?mid=<%=rss.getString("queue_id")%>">Edit</a></td>
                </tr>
                <%
                  }
                  %>
          </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
