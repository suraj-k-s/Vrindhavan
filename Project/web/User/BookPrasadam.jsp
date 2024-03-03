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
                String id = request.getParameter("pid");
                String mode = "prasadam";
                String date = request.getParameter("txt_date");
                String time = request.getParameter("txt_time");
                String amount = request.getParameter("txt_amount");
                String unit = request.getParameter("txt_qty");

                String insQry = "insert into tbl_prasadambooking(prasadam_id,user_id,pbooking_date,pbooking_time,pbooking_amount,pbooking_unit)"
                        + "values('" + id + "','" + session.getAttribute("uid") + "','" + date + "','" + time + "','" + amount + "','" + unit + "')";
                if (conn.executeCommand(insQry)) {
                    String sel = "select max(pbooking_id) as id from tbl_prasadambooking";
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
                    <td>Date</td>
                    <td><input type="date" name="txt_date" ></td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="time" name="txt_time"></td>
                </tr>
                <tr>
                    <td>Qty</td>
                    <td><input type="number" name="txt_qty" onkeyup="calculateAmount(this.value)" value="1" min="1" onchange="calculateAmount(this.value)"></td>
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
    <script>
        function calculateAmount(qty)
        {
            var amount = <%=request.getParameter("amount")%>;
            var total = qty * amount;
            document.getElementById("txt_amount").value=total;
        }
    </script>
    <%@include file="Foot.jsp" %>
</html>

