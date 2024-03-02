<%-- 
    Document   : SendFeedback
    Created on : 10 Feb, 2024, 2:55:28 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SendFeedback</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",feedback="";
           if(request.getParameter("btnsub")!=null){
              if(request.getParameter("txt_hidden").equals(""))
              {
                 String insQry="insert into tbl_feedback(feedback_content,user_id,feedback_date)values('"+request.getParameter("txt_feedback")+"','"+session.getAttribute("uid")+"',curdate())";
                 conn.executeCommand(insQry);
              {
                  String upQry="update tbl_feedback set feedback_content='"+request.getParameter("txt_feedback")+"'where feedback_id='"+request.getParameter("txt_hidden")+"'";
              conn.executeCommand(upQry);
              response.sendRedirect("SendFeedback.jsp");
              }
              }
           }
            if(request.getParameter("sfid")!=null)
            {
                String delQry="delete from tbl_feedback where feedback_id='"+request.getParameter("sfid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("SendFeedback.jsp");
            }
            if(request.getParameter("sbid")!=null)
            {
                
                String selQ="select * from tbl_feedback where feedback_id='"+request.getParameter("sbid")+"'";
                ResultSet rss1=conn.selectCommand(selQ);
                System.out.print(selQ);
                rss1.next();
              id= rss1.getString("feedback_id");
              feedback=rss1.getString("feedback_content");
            }
          
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>FeedBack</td>
                    <td><input type="text" name="txt_feedback" value="<%=feedback%>">
                    <input type="hidden" name="txt_hidden" value="<%=id%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset" name="btncan" value="cancel"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td>SLNO</td>
                    <td>Feedback</td>
                    <td>Date</td>
                    <td>Action</td>
                </tr>
                <%
                  int i=0;
                  String selQry="select * from tbl_feedback ";
                  ResultSet rss=conn.selectCommand(selQry);
                  while(rss.next())
                  {
                      i++;
                  
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rss.getString("feedback_content")%></td>
                  <td><%=rss.getString("feedback_date")%></td>
               <td><a href="SendFeedback.jsp?sfid=<%=rss.getString("feedback_id")%>">Delete</a>
                   <a href="SendFeedback.jsp?sbid=<%=rss.getString("feedback_id")%>">Edit</a></td>
                </tr>
                <%
                  }
                  %>
          </table>
        </form>
            
    </body>
     <%@include file="Foot.jsp" %>
</html>
