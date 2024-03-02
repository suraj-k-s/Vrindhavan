<%-- 
    Document   : Place
    Created on : 4 Jan, 2024, 2:35:09 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>place</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <% 
            String id="",place="",district="";
           if(request.getParameter("btnsub")!=null)
            {
                if(request.getParameter("txt_hidden").equals(""))
                {
                String insQry="insert into tbl_place(place_name,district_id)values('"+request.getParameter("txt_place")+"','"+request.getParameter("sel_district")+"')";
                conn.executeCommand(insQry);
            }
                else
                {
                    String upQry="update tbl_place set place_name='"+request.getParameter("txt_place")+"',district_id='"+request.getParameter("sel_district")+"' where place_id='"+request.getParameter("txt_hidden")+"'";
                    conn.executeCommand(upQry);
                    response.sendRedirect("Place.jsp");
                }
            }
            if(request.getParameter("pid")!=null)
            {
             String delQry="delete from tbl_place where place_id='"+request.getParameter("pid")+"'";
             conn.executeCommand(delQry);
             response.sendRedirect("Place.jsp");
            }
            if(request.getParameter("gid")!=null)
            {
                String selQ="select* from tbl_place where place_id='"+request.getParameter("gid")+"'";
                ResultSet rss=conn.selectCommand(selQ);
                rss.next();
                id=rss.getString("place_id");
                place=rss.getString("place_name");
                district=rss.getString("district_id");
            }
            %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>District</td>
                            <td><select name="sel_district">
                                    <option>Select</option>
                                    <%
                                    String SelQ="select * from tbl_district";
                                    ResultSet rs=conn.selectCommand(SelQ);
                                    while(rs.next())
                                    {
                                      %>  
                                        
                                      <option value="<%=rs.getString("district_id")%>" <% if(rs.getString("district_id").equals(district)){out.print("selected"); }%>><%=rs.getString("district_name")%></option>
                                      <%
                                    }
                                    
                                    %>
                        </select></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text"name="txt_place" value="<%=place%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"></td>
                        
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Action</td>
                </tr>
                <%
                int i=0;
                String selQry="select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id  ";
               ResultSet rss=conn.selectCommand(selQry);
               while(rss.next())
               {
                 i++;  
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rss.getString("district_name")%></td>
                   <td><%=rss.getString("place_name")%></td>
                   <td><a href="Place.jsp?pid=<%=rss.getString("place_id")%>">Delete</a>
                       <a href="Place.jsp?gid=<%=rss.getString("place_id")%>">Edit</a>
               </tr>
               <%
               }
               %>
            </table> 
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
