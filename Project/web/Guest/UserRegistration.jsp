<%-- 
    Document   : UserRegistration
    Created on : 6 Jan, 2024, 3:06:46 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserRegistration</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPage/userAction.jsp">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required="" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$">></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_name"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_name" required="" title="Phone number with 7-9 and remaing 9 digit with 0-9"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address" required=""></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="sel_district" onchange="getPlace(this.value)" required="">
                            <option>select<option>
                                <%
                                    String selQ = "select* from tbl_district";
                                    ResultSet rs = conn.selectCommand(selQ);
                                    while (rs.next()) {
                                %>   

                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><select name="sel_place" id="sel_place" required="">
                            <option>Select</option></select></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file" required=""></td>
                </tr>
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="txt_username" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="txt_pass" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" value="save">
                        <input type="reset" name="btncan" value="cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
            function getPlace(did)
            {
                $.ajax({url: "../Assets/AjaxPages/Ajaxplace.jsp?pid=" + did,
                    success: function(result) {
                        $("#sel_place").html(result);
                    }
                })
            }

    </script>
</html>
