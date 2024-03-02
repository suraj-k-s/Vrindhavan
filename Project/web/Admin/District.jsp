<%-- 
    Document   : District
    Created on : 27 Dec, 2023, 10:49:33 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",district="";
        if(request.getParameter("btnsub")!=null)
        {
            if(request.getParameter("txt_hidden").equals(""))
            {
            String insQry="insert into tbl_district(district_name)values('"+request.getParameter("district")+"')";
            conn.executeCommand(insQry);
            }
            else{
                String upQry="update tbl_district set district_name='"+request.getParameter("district")+"' where district_id='"+request.getParameter("txt_hidden")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("District.jsp");
            }
            
            
        }
        if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
            conn.executeCommand(delQry);
            response.sendRedirect("District.jsp");
        }
        
        
        
        if(request.getParameter("eid")!=null)
        {
            String selQ="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
            ResultSet rss=conn.selectCommand(selQ);
            rss.next();
            id=rss.getString("district_id");
            district=rss.getString("district_name");
        }
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>District</td>
                    <td><input type="text" name="district" value="<%=district%>">
                        <input type="hidden" name="txt_hidden" value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
            </tr>
            </table>
            <table border="1" align="center">
                
             <tr>
                    <td>SLno</td>
                    <td>District</td>
                    <td>Action</td>
                </tr>
                <%
                int i=0;
                String selQry="select * from tbl_district";
                ResultSet rs=conn.selectCommand(selQry);
                while(rs.next())
                {
                    i++;
                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs.getString("district_name")%></td>
                    <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>
                        <a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
                </tr>
                <%
                
                }
                %>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>

</html>
