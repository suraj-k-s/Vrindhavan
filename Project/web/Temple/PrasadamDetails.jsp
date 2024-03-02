<%-- 
    Document   : PrasadamDetails
    Created on : 18 Jan, 2024, 10:37:09 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PrasadamDetails</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%   
            String id="",Name="" ,amount="",description="",unit="";
            if(request.getParameter("btnsub")!=null){
               if(request.getParameter("txt_hidden").equals("")) {
   String insQry="insert into tbl_prasadam(prasadam_name,prasadam_amount,prasadam_description,prasadam_unit,temple_id,prasadamtype_id)values('"+request.getParameter("txt_name")+"','"+request.getParameter("txt_amount")+"','"+request.getParameter("txt_description")+"','"+request.getParameter("txt_unit")+"','"+session.getAttribute("Tid")+"','"+request.getParameter("sel_prasadam")+"')";
               conn.executeCommand(insQry);
//               out.print(insQry);
            }
            else
            {
                String upQry="update tbl_prasadam set prasadam_name='"+request.getParameter("txt_name")+"',prasadam_amount='"+request.getParameter("txt_amount")+"',prasadam_description='"+request.getParameter("txt_description")+"',prasadam_unit='"+request.getParameter("txt_unit")+"'where prasadam_id='"+request.getParameter("txt_hidden")+"'";
                conn.executeCommand(upQry);
                response.sendRedirect("PrasadamDetails.jsp");
            }
            }
            if(request.getParameter("pdid")!=null)
            {
                String delQry="delete from tbl_prasadam where prasadam_id='"+request.getParameter("pdid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("PrasadamDetails.jsp");
            }
            if(request.getParameter("bid")!=null)
            {
                String selQ="select *from tbl_prasadam where prasadam_id='"+request.getParameter("bid")+"'";
                ResultSet rss=conn.selectCommand(selQ);
                rss.next();
                id=rss.getString("prasadam_id");
                Name=rss.getString("prasadam_name");
                amount=rss.getString("prasadam_amount");
                description=rss.getString("prasadam_description");
                unit=rss.getString("prasadam_unit");
            
            }
            
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>PrasadamType</td>
                            <td><select name="sel_prasadam">
                                    <option>select</option>
                                    <%
                                        String selQ="select*from tbl_prasadamtype";
                                        ResultSet rs=conn.selectCommand(selQ);
                                        while(rs.next())
                                        {
                                        %>
          <option value="<%=rs.getString("prasadamtype_id")%>"<% if(rs.getString("prasadamtype_id").equals(id)){out.print("selected") ;}%>><%=rs.getString("prasadamtype_name")%></option>
                                        <%
                                        }
                                        %>
                                </select></td>
                    </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text"name="txt_name" value="<%=Name%>">
                    <input type="hidden"name="txt_hidden"value="<%=id%>"</td>
                </tr>
               
                <tr>
                    <td>Amount</td>
                    <td><input type="text"name="txt_amount"value="<%=amount%>"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text"name="txt_description"value="<%=description%>"></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td><input type="text"name="txt_unit"value="<%=unit%>"></td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
                                <table border="1"align="center">
                                    <tr>
                                        <td>SLNO</td>
                                        <td>PrasadamType</td>
                                        <td>Name</td>
                                        <td>Amount</td>
                                        <td>Description</td>
                                        <td>Unit</td>
                                        <td>Action</td>
                                    </tr>
                                    <%
                                        int i=0;
                                        String selQry="select * from tbl_prasadam p inner join tbl_prasadamtype h on h.prasadamtype_id=p.prasadamtype_id";
                                        ResultSet rss=conn.selectCommand(selQry);
                                        while(rss.next())
                                        {
                                            i++;
                                     %>
                                     <tr>
                                         <td><%=i%></td>
                                         <td><%=rss.getString("prasadamtype_name")%></td>
                                         <td><%=rss.getString("prasadam_name")%></td>
                                         <td><%=rss.getString("prasadam_amount")%></td>
                                         <td><%=rss.getString("prasadam_description")%></td>
                                         <td><%=rss.getString("prasadam_unit")%></td>
                                        <td><a href="PrasadamDetails.jsp?pdid=<%=rss.getString("prasadam_id")%>">Delete</a>
                                             <a href="PrasadamDetails.jsp?bid=<%=rss.getString("prasadam_id")%>">Edit</a></td>
                                     </tr>
                                     <%
                                        }
                                        %>
                                </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
