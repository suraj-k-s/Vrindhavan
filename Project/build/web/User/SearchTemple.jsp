<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Temple</title>
        <link rel="stylesheet" href="../Assets/Template/form.css">
        <style>
            .zoom {
                padding: 50px;
                background-color: #fff8db;
                transition: transform .2s; 
                width: 300px;
                height: 200px;
                margin: 0 auto;
            }
            .zoom:hover {
                transform: scale(1.5); 
            }
            .btn {
                background-color: null ;
                border: none;
                color: black;
                padding: 16px 32px;
                text-align: center;
                font-size: 16px;
                margin: 4px 2px;
                opacity: 0.6;
                transition: 0.3s;
                text-decoration: none;
            }
            a{
                text-decoration: none;
            }

            .btn:hover {opacity: 1}
        </style>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
            function getPlace(did)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/Ajaxplace.jsp?pid=" + did,
                    success: function(html) {
                        $("#place").html(html);
                    }
                });
            }
            function getTemple()
            {
                var did = document.getElementById("district").value;
                var pid = document.getElementById("place").value;
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxTemple.jsp?did=" + did + "&pid=" + pid,
                    success: function(html) {
                        $("#search").html(html);
                    }
                });
            }
        </script>
    </head>
    <body onload="getTemple()">
        <%@include file="Head.jsp" %>
        <h1>Search Temple</h1>
        <div id="tab">
            <form name="frmsearch" method="post">
                <table align="center" cellpadding="10" style="border-collapse: collapse">
                    <tr>
                        <td>
                            District
                            <select name="district" id="district" onchange="getPlace(this.value), getTemple()">
                                <option value="" selected>--Select--</option>
                                <%
                                    String st = "select * from tbl_district";
                                    ResultSet r = con.selectCommand(st);
                                    while (r.next()) {
                                %>
                                <option value="<%=r.getString("district_id")%>"><%=r.getString("district_name")%></option>
                                <%
                                    }
                                %>
                            </select>    
                        </td>
                        <td>
                            Place
                            <select name="place" id="place" onchange="getTemple()">
                                <option value="" selected>--Select--</option>
                            </select>    
                        </td>
                    </tr> 
                </table>
            </form>
            <hr>
            <br>
            <div id="search">

            </div>

        </div>
    </body>
    <%@include file="Foot.jsp" %>
</html>