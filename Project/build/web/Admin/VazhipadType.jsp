
<%-- 
    Document   : VazhipadType
    Created on : 4 Jan, 2024, 11:27:24 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VazhipadType</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <% 
            String id="",vazhipadName="";
            if(request.getParameter("btnsub")!=null) {
               if(request.getParameter("txt_hidden").equals("")){
            String insQry="insert into tbl_vazhipadtype(vazhipadtype_name)values('"+request.getParameter("txt_vazhipad")+"')";
               conn.executeCommand(insQry);
            }
               else
               {
                   String upQry="update tbl_vazhipadtype set vazhipadtype_name='"+request.getParameter("txt_vazhipad")+"'where vazhipadtype_id='"+request.getParameter("txt_hidden")+"'";
                 conn.executeCommand(upQry);
                 response.sendRedirect("VazhipadType.jsp");
               }
            }
            if(request.getParameter("vid")!=null)
            {
                String delQry="delete from tbl_vazhipadtype where vazhipadtype_id='"+request.getParameter("vid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("VazhipadType.jsp");
                
            }
            if(request.getParameter("fid")!=null)
            {
           String selQ="select*from tbl_vazhipadtype where vazhipadtype_id='"+request.getParameter("fid")+"'";
           ResultSet rss=conn.selectCommand(selQ);
           rss.next();
           id=rss.getString("vazhipadtype_id");
           vazhipadName=rss.getString("vazhipadtype_name");
            }
            %>
        <form method="post">
            <table border="1"align="center">
                <tr>
                    <td>Vazhipadtype</td>
                    <td><input type="text"name="txt_vazhipad"value="<%=vazhipadName%>">
                        <input type="hidden" name="txt_hidden"value="<%=id%>"</td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNo</td>
                    <td>Vazhipadtype</td>
                    <td>Action</td>
                </tr>
                <%
                    int i=0;
                    String selQry="select *from tbl_vazhipadtype";
                    ResultSet rs=conn.selectCommand(selQry);
                    while(rs.next())
                    {
                      i++;  
                      %>
                      <tr>
                          <td><%=i%></td>
                          <td><%=rs.getString("vazhipadtype_name")%></td>
             <td><a href="VazhipadType.jsp?vid=<%=rs.getString("vazhipadtype_id")%>">Delete</a>
             <a href="VazhipadType.jsp?fid=<%=rs.getString("vazhipadtype_id")%>">Edit</a></td>
              </tr>
              <%
                    }
                    %>
            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
