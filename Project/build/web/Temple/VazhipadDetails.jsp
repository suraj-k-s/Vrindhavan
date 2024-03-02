

<%-- 
    Document   : VazhipadDetails
    Created on : 1 Feb, 2024, 2:34:02 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VazhipadDetails</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
            String id="",Name="",description="",Amount="";
            if(request.getParameter("btnsub")!=null){
              if(request.getParameter("txt_hidden").equals(""))
              {
                String insQry="insert into tbl_vazhipad(vazhipad_name,vazhipad_description,temple_id,vazhipadtype_id,vazhipad_amount)values('"+request.getParameter("txt_name")+"','"+request.getParameter("txt_description")+"','"+session.getAttribute("Tid")+"','"+request.getParameter("sel_vazhipad")+"','"+request.getParameter("txt_amount")+"')";
              conn.executeCommand(insQry);
              out.print(insQry);
              
            }
              else
              {
                  
                  String upQry="update tbl_vazhipad set vazhipad_name='"+request.getParameter("txt_name")+"',vazhipad_description='"+request.getParameter("txt_description")+"',vazhipad_amount='"+request.getParameter("txt_amount")+"',temple_id='"+session.getAttribute("Tid")+"',vazhipadtype_id='"+request.getParameter("sel_vazhipad")+"' where vazhipad_id='"+request.getParameter("txt_hidden")+"'";
              conn.executeCommand(upQry);
//              out.println(upQry);
              response.sendRedirect("VazhipadDetails.jsp");
              }
            }
            if(request.getParameter("Vdid")!=null)
            {
                String delQry="delete from tbl_vazhipad where vazhipad_id='"+request.getParameter("Vdid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("VazhipadDetails.jsp");
            }
            if(request.getParameter("zid")!=null)
            {
                String selQ="select * from tbl_vazhipad where vazhipad_id='"+request.getParameter("zid")+"'";
                ResultSet rss1=conn.selectCommand(selQ);
                System.out.print(selQ);
                rss1.next();
              id=rss1.getString("vazhipad_id");
               Name= rss1.getString("vazhipad_name");
               description= rss1.getString("vazhipad_description");
               Amount= rss1.getString("vazhipad_amount");
            }
            
        %>
         <form method="post">
            <table border="1">
                <tr>
                    <td>VazhipadType</td>
                    <td><select name="sel_vazhipad">
                            <option>select</option>
                           <%
                                        String selQ="select*from tbl_vazhipadtype";
                                        ResultSet rs=conn.selectCommand(selQ);
                                        while(rs.next())
                                        {
                                        %>
          <option value="<%=rs.getString("vazhipadtype_id")%>"<% if(rs.getString("vazhipadtype_id").equals(id)){out.print("selected") ;}%>><%=rs.getString("vazhipadtype_name")%></option>
                                        <%
                                        }
                                        %> 
                        </select>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text"name="txt_name"value="<%=Name%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"></td>
                    
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text"name="txt_description"value="<%=description%>" ></td>
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
                    <td>VazhipadType</td>
                    <td>Description</td>
                    <td>Amount</td>
                    <td>Action</td>
                </tr>
                <%
                  int i=0;
                  String selQry="select * from tbl_vazhipad v inner join tbl_vazhipadtype vt on vt.vazhipadtype_id=v.vazhipadtype_id";
                  ResultSet rss=conn.selectCommand(selQry);
                  while(rss.next())
                  {
                      i++;
                  
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rss.getString("vazhipadtype_name")%></td>
                    <td><%=rss.getString("vazhipad_description")%></td>
                      <td><%=rss.getString("vazhipad_amount")%></td>
                 <td><a href="VazhipadDetails.jsp?Vdid=<%=rss.getString("vazhipad_id")%>">Delete</a>
                   <a href="VazhipadDetails.jsp?zid=<%=rss.getString("vazhipad_id")%>">Edit</a></td>
                </tr>
                <%
                  }
                  %>
          </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>

    

