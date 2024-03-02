<%-- 
    Document   : StaffRegistration
    Created on : 29 Jan, 2024, 2:39:39 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StaffRegistration</title>
    </head>
     <%@include file="Head.jsp" %>
    <body>
        <%
        String id="",Name="",Contact="",Email="",Address="",Designation="",Photo="",Proof="",District="",Place="",Pincode="";
            if(request.getParameter("btnsub")!=null){
              if(request.getParameter("txt_hidden").equals(""))
              {
                String insQry="insert into tbl_staff(staff_name,staff_contact,staff_email,staff_address,staff_designation)values('"+request.getParameter("txt_name")+"','"+request.getParameter("txt_contact")+"','"+request.getParameter("txt_email")+"','"+request.getParameter("txt_address")+"','"+request.getParameter("sel_designation")+"'";
              conn.executeCommand(insQry);
              //out.print(insQry);
            }
              else
              {
                  String upQry="update tbl_staff set staff_name='"+request.getParameter("txt_name")+"',staff_contact='"+request.getParameter("txt_contact")+"',staff_email='"+request.getParameter("txt_email")+"',staff_address='"+request.getParameter("txt_address")+"',staff_designation='"+request.getParameter("sel_designation")+"' where staff_id='"+request.getParameter("txt_hidden")+"'";
              conn.executeCommand(upQry);
              response.sendRedirect("StaffRegistration.jsp");
              }
            }
            if(request.getParameter("srid")!=null)
            {
                String delQry="delete from tbl_staff where staff_id='"+request.getParameter("srid")+"'";
                conn.executeCommand(delQry);
                response.sendRedirect("StaffRegistration.jsp");
            }
            if(request.getParameter("sid")!=null)
            {
                String selQ="select * from tbl_staff where staff_id='"+request.getParameter("sid")+"'";
                ResultSet rss1=conn.selectCommand(selQ);
                System.out.print(selQ);
                rss1.next();
              id=rss1.getString("staff_id");
               Name= rss1.getString("staff_name");
               Contact=rss1.getString("staff_contact");
               Email= rss1.getString("staff_email");
               Address=rss1.getString("staff_address");
               Photo=rss1.getString("staff_photo");
               Proof=rss1.getString("staff_idproof");
            }
            %>
     <form method="post"enctype="multipart/form-data"action="../Assets/ActionPage/StaffAction.jsp">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text"name="txt_name"value="<%=Name%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text"name="txt_email"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text"name="txt_contact"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text"name="txt_address"></td>
                </tr>
                <tr>
                    <td>Designation</td>
                            <td><select name="sel_designation">
                                    <option>select</option>
                                    <%
                                  String selQr="select* from tbl_designation";
                                  ResultSet rs=conn.selectCommand(selQr);
                                  while(rs.next())
                                  {
                                    %>
                                    <option value="<%=rs.getString("designation_id")%>"><%=rs.getString("designation_name")%></option>
                                    <%
                                  }
                                  %>
                        </select>
                </tr>
                <tr>
                    <td>District</td>
                            <td><select name="sel_district" onchange="getPlace(this.value)">
                                    <option>select<option>
                           <%
                               String selQ="select* from tbl_district";
                               ResultSet rss=conn.selectCommand(selQ);
                               while(rss.next())
                               {
                                %>   
                               
                                    <option value="<%=rss.getString("district_id")%>"><%=rss.getString("district_name")%></option>
                                    <%
                                    }
                               %>
                                </select></td>
                         </tr>
                         <tr>
                             <td>Place</td>
                             <td><select name="sel_place">
                                  <%
                               String selQry="select *from tbl_place";
                               ResultSet rss1=conn.selectCommand(selQry);
                               while(rss1.next())
                               {
                                %>   
                                <option value="<%=rss1.getString("place_id")%>"><%=rss1.getString("place_name")%></option>
                                <%
                               }
                               %>
                                 </select></td>
                                     
                         </tr>
                         <tr>
                             <td>Photo</td>
                             <td><input type="file" name="file_photo"></td>
                         </tr>
                         <tr>
                             <td>Proof</td>
                             <td><input type="file"name="file_proof"></td>
                         <tr>
                             <td>Pincode</td>
                             <td><input type="text"name="txt_pincode"></td>
                         </tr>
                         <tr>
                             <td>UserName</td>
                             <td><input type="text"name="txt_username"></td>
                         </tr>
                         <tr>
                             <td>Password</td>
                             <td><input type="text"name="txt_password"></td>
                         </tr>
                         
                    
                         <tr>
                             <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                                 <input type="reset"name="btncan"value="cancel"></td>
                         </tr>
            </table>
                                 <table border="1"align="center">
                                     <tr>
                                         <td>SLNO</td>
                                         <td>Name</td>
                                         <td>Contact</td>
                                         <td>Email</td>
                                         <td>Address</td>
                                         <td>Designation</td>
                                         <td>Photo</td>
                                         <td>Proof</td>
                                         <td>District</td>
                                         <td>Place</td>
                                         <td>Pincode</td>
                                         <td>Action</td>
                                     </tr>
                                     <%
                                     int i=0;
                                     String SelQ1="select * from tbl_staff s inner join tbl_designation d on d.designation_id= s.designation_id inner join tbl_place p on p.place_id = s.place_id inner join  tbl_district dt on dt.district_id=p.district_id";
                                     ResultSet rs1=conn.selectCommand(SelQ1);
                                     while(rs1.next())
                                     {
                                         i++;
                                     
                                     %>
                                     <tr>
                                         <td><%=i%></td>
                                         <td><%=rs1.getString("staff_name")%></td>
                                         <td><%=rs1.getString("staff_contact")%></td>
                                         <td><%=rs1.getString("staff_email")%></td>
                                         <td><%=rs1.getString("staff_address")%></td>
                                         <td><%=rs1.getString("designation_name")%></td>
                                         <td><img src="../Assets/Files/StaffPhoto/<%=rs1.getString("staff_photo")%>" width="50" height="50"></td>
                                         <td><img src="../Assets/Files/Staffproof/<%=rs1.getString("staff_idproof")%>"width="50"height="50"></td>
                                         <td><%=rs1.getString("district_name")%></td>
                                         <td><%=rs1.getString("place_name")%></td>
                                         <td><%=rs1.getString("staff_pincode")%></td>
                                      <td><a href="StaffRegistration.jsp?srid=<%=rs1.getString("staff_id")%>">Delete</a>
                                             <a href="StaffRegistration.jsp?sid=<%=rs1.getString("staff_id")%>">Edit</a>
                                     </tr>
                                     <%
                                     
                                     }
                                     %>
                                 </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
     <script src="../Assets/JQuery/jQuery.js"></script>
                        <script>
                            function getPlace(did)
                            {
                                $.ajax({url:"../Assets/AjaxPages/Ajaxplace.jsp?pid=" + did,
                                success: function(result){
                                    $("#sel_place").html(result);
                                }
                            })
                            }
                           
                        </script>
</html>

</html>
