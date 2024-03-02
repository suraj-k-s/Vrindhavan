<%-- 
    Document   : SendComplaint
    Created on : 10 Feb, 2024, 11:40:16 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SendComplaint</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String id="", complaint="";
            if(request.getParameter("btnsub")!= null)
            {
                String insQry="insert into tbl_complaint(complainttype_id,complaint_content,user_id,complaint_date)values('"+request.getParameter("sel_complainttype")+"','"+request.getParameter("txt_complaint")+"','"+session.getAttribute("uid")+"',curdate())";
            conn.executeCommand(insQry);
//            out.print(insQry);
            }
            if(request.getParameter("scid")!=null)
            {
            String delQry="delete from tbl_complaint where complaint_id='"+request.getParameter("scid")+"'";
            conn.executeCommand(delQry);
            response.sendRedirect("SendComplaint.jsp");
            }
               
             %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>ComplaintTpe</td>
                            <td><select name="sel_complainttype">
                                    <option>select</option>
                                  <%
                                        String selQ="select*from tbl_complainttype";
                                        ResultSet rs=conn.selectCommand(selQ);
                                        while(rs.next())
                                        {
                                        %>
          <option value="<%=rs.getString("complainttype_id")%>"<% if(rs.getString("complainttype_id").equals(id)){out.print("selected") ;}%>><%=rs.getString("complainttype_name")%></option>
                                        <%
                                        }
                                        %>    
                        </select>
                </tr>
                <tr>
                    <td>complaint</td>
                    <td><input type="textarea"name="txt_complaint"value="<%=complaint%>">
                         <input type="hidden"name="txt_hidden"value="<%=id%>"</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
                        <table border="1"align="center">
                            <tr>
                                <td>SLNO</td>
                                <td>ComplaintType</td>
                                <td>Complaint</td>
                                <td>Date</td>
                                <td>Action</td>
                                
                            </tr>
                           <%
                int i=0;
                String selQry="select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id";
                ResultSet rs2=conn.selectCommand(selQry);
                while(rs2.next())  {
                    i++;
                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs2.getString("complainttype_name")%></td>
                    <td><%=rs2.getString("complaint_content")%></td>
                    <td><%=rs2.getString("complaint_date")%></td>
                    <td><a href="SendComplaint.jsp?scid=<%=rs2.getString("complaint_id")%>">Delete</a>
                        
                </tr>
                <%
                }
                %>  
                        </table>
        </form>
        
    </body>
    <%@include file="Foot.jsp" %>
</html>
