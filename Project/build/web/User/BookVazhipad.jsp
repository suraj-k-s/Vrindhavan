<%-- 
    Document   : EditProfile
    Created on : 15 Jan, 2024, 1:59:48 PM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vrindhavan</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%

            if (request.getParameter("btnsub") != null) {
                String id = request.getParameter("vid");
                String mode = "vazhipad";
                String date = request.getParameter("txt_date");
                String time = request.getParameter("txt_time");
                String amount = request.getParameter("txt_amount");
                String nid = request.getParameter("sel_naksha");
                String name = request.getParameter("txt_name");

                String insQry = "insert into tbl_vazhipadbooking(vazhipad_id,user_id,vbooking_date,vbooking_time,vbooking_amount,nakshathram_id,vbooking_name)"
                        + "values('" + id + "','" + session.getAttribute("uid") + "','" + date + "','" + time + "','" + amount + "','" + nid + "','" + name + "')";
                if (conn.executeCommand(insQry)) {
                    String sel = "select max(vbooking_id) as id from tbl_vazhipadbooking";
                    ResultSet rs = conn.selectCommand(sel);
                    rs.next();
                    id = rs.getString("id");
        %>
        <script>
            alert('Pay Now <%=amount%>');
            window.location = "Payment.jsp?id=<%=id%>&mode=<%=mode%>";
        </script>
        <%
        } else {
        %>
        <script>
            alert('Booking Failed');
            window.location = "HomePage.jsp";
        </script>
        <%
                }
            }

        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" ></td>
                </tr>
                <tr>
                    <td>Nakshathram</td>
                    <td>
                        <select name="sel_naksha">
                            <option value="">----Select----</option>
                            <%                            String selQry = "select * from tbl_nakshatram";
                                ResultSet rs = conn.selectCommand(selQry);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("nakshatram_id")%>"><%=rs.getString("nakshatram_name")%></option>
                            <%

                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="txt_date" ></td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="time" name="txt_time"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" readonly="" name="txt_amount" id="txt_amount" value="<%=request.getParameter("amount")%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" value="save">
                        <input type="reset" name="btncan" value="cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>

