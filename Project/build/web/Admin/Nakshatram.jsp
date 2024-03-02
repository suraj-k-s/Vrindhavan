<%-- 
    Document   : Nakshatram
    Created on : 30 Dec, 2023, 2:01:59 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nakshatram</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",nakshatram="";
           if(request.getParameter("btnsub")!=null)
        {
            if(request.getParameter("txt_hidden").equals(""))
            {
                
            String insQry="insert into tbl_nakshatram(nakshatram_name)values('"+request.getParameter("txt_name")+"')";
            conn.executeCommand(insQry);
           }
            else
            {
                String upQry="update tbl_nakshatram set nakshatram_name='"+request.getParameter("txt_name")+"'where nakshatram_id='"+request.getParameter("txt_hidden")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("Nakshatram.jsp");
            }
           }
            if(request.getParameter("nid")!=null)
            {
                String delQry="delete from tbl_nakshatram where nakshatram_id='"+request.getParameter("nid")+"'";
                conn.executeCommand(delQry);
                out.print(delQry);
                response.sendRedirect("Nakshatram.jsp");
            }
            if(request.getParameter("kid")!=null)
            {
                String selQ= "select* from tbl_nakshatram where nakshatram_id='"+request.getParameter("kid")+"'";
                ResultSet rss=conn.selectCommand(selQ);
//                out.print(selQ);
               rss.next();
               id= rss.getString("nakshatram_id");
               nakshatram= rss.getString("nakshatram_name");
//               System.out.print(nakshatram);
            }
       
        %>
        <form method ="post">
            <table border="1"><tr>
                    <td>Nakshatram</td>
                    <td> <input type="text"name="txt_name" value="<%=nakshatram%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr></table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>Nakshatram</td>
                    <td>Action</td>
                    
                </tr>
                <%
                int i=0;
                String selQry="select * from tbl_nakshatram";
                ResultSet rs=conn.selectCommand(selQry);
                while(rs.next())
                {
                    i++;
                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs.getString("nakshatram_name")%></td>
                    <td><a href="Nakshatram.jsp?nid=<%=rs.getString("nakshatram_id")%>">Delete</a>
                        <a href="Nakshatram.jsp?kid=<%=rs.getString("nakshatram_id")%>">Edit</a></td>
                </tr>
                <%
                
                }
                %>
                
        </form>
    </body>
    
<%@include file="Foot.jsp" %>
</html>
