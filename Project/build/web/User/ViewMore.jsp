<%-- 
    Document   : ViewMore
    Created on : 2 Mar, 2024, 1:38:04 AM
    Author     : suraj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .zoom {
                padding: 10px;
                background-color: #fff8db;
                transition: transform .2s; 
                width: 300px;
                height: 200px;
                margin: 0 auto;
            }

            .btn {
                background-color: null ;
                border: none;
                color: white;
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
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <table class="zoom" border="1">
            <%
                String sel = "select * from tbl_temple t inner join tbl_place p on p.place_id=t.place_id inner join tbl_district d on d.district_id=p.district_id where temple_id='" + request.getParameter("tid") + "'";
                ResultSet rw = con.selectCommand(sel);
                rw.next();
            %>
            <tr>
                <td colspan="2" align="center">
                    <img src="../Assets/Files/TemplePhoto/<%=rw.getString("temple_photo")%>" width="100" height="100">
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <%=rw.getString("temple_name")%>
                </td>
            </tr>

            <tr>
                <td>
                    Contact
                </td>
                <td>
                    <%=rw.getString("temple_contact")%>
                </td>
            </tr>        
            <tr>
                <td>
                    Contact
                </td>
                <td>
                    <%=rw.getString("temple_address")%>,<%=rw.getString("temple_pincode")%>
                </td>
            </tr>    
            <tr>
                <td colspan="2" align="center">
                    <a href="ViewChart.jsp?tid=<%=rw.getString("temple_id")%>">View Chart</a>
                </td>
            </tr>    
        </table>
        <br><br><br>
        <h2>Prasadam</h2>
    <marquee
        direction="left"
        width="500"
        behavior="scroll"
        onmouseover="this.stop();"
        onmouseout="this.start();"
        onmousedown="scrollSpeed = 0;"
        onmouseup="scrollSpeed = 3;">

        <table >
            <tr>
                <%
                    String selP = "select * from tbl_prasadam p inner join tbl_prasadamtype pt on pt.prasadamtype_id=p.prasadamtype_id where temple_id='" + request.getParameter("tid") + "'";
                    ResultSet rwP = con.selectCommand(selP);
                    while (rwP.next()) {
                %>
                <td>
                    <table class="zoom" border="1">
                        <tr>
                            <td>
                                Type
                            </td>
                            <td>
                                <%=rwP.getString("prasadamtype_name")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name
                            </td>
                            <td>
                                <%=rwP.getString("prasadam_name")%>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Details
                            </td>
                            <td>
                                <%=rwP.getString("prasadam_description")%>
                            </td>
                        </tr>        
                        <tr>
                            <td>
                                Qty
                            </td>
                            <td>
                                <%=rwP.getString("prasadam_amount")%>/<%=rwP.getString("prasadam_unit")%>
                            </td>
                        </tr>   
                        <tr>
                            <td colspan="2" align="center">
                                <a href="BookPrasadam.jsp?pid=<%=rwP.getString("prasadam_id")%>">Book</a>
                            </td>
                        </tr>   
                    </table>
                </td>
                <%
                    }
                %>
            </tr>
        </table>
    </marquee>
    <br><br><br>
    <h2>Queue</h2>
    <marquee
        direction="left"
        width="500"
        behavior="scroll"
        onmouseover="this.stop();"
        onmouseout="this.start();"
        onmousedown="scrollSpeed = 0;"
        onmouseup="scrollSpeed = 3;">

        <table >
            <tr>
                <%
                    String selQ = "select * from tbl_queue q inner join tbl_queuetype qt on qt.queuetype_id=q.queuetype_id where temple_id='" + request.getParameter("tid") + "'";
                    ResultSet rwQ = con.selectCommand(selQ);
                    while (rwQ.next()) {
                %>
                <td>
                    <table class="zoom" border="1">
                        <tr>
                            <td>
                                Type
                            </td>
                            <td>
                                <%=rwQ.getString("queuetype_name")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Time
                            </td>
                            <td>
                                <%=rwQ.getString("queue_time")%>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Amount
                            </td>
                            <td>
                                <%=rwQ.getString("queue_amount")%>
                            </td>
                        </tr>  
                        <tr>
                            <td colspan="2" align="center">
                                <a href="BookQueue.jsp?qid=<%=rwQ.getString("queue_id")%>">Book</a>
                            </td>
                        </tr>   
                    </table>
                </td>
                <%
                    }
                %>
            </tr>
        </table>
    </marquee>
    <br><br><br>
    <h2>Vazhipad</h2>
    <marquee
        direction="left"
        width="500"
        behavior="scroll"
        onmouseover="this.stop();"
        onmouseout="this.start();"
        onmousedown="scrollSpeed = 0;"
        onmouseup="scrollSpeed = 3;">

        <table >
            <tr>
                <%
                    String selV = "select * from tbl_vazhipad v inner join tbl_vazhipadtype vt on vt.vazhipadtype_id=v.vazhipadtype_id where temple_id='" + request.getParameter("tid") + "'";
                    ResultSet rwV = con.selectCommand(selV);
                    while (rwV.next()) {
                %>
                <td>
                    <table class="zoom" border="1">
                        <tr>
                            <td>
                                Type
                            </td>
                            <td>
                                <%=rwV.getString("vazhipadtype_name")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name
                            </td>
                            <td>
                                <%=rwV.getString("vazhipad_name")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Details
                            </td>
                            <td>
                                <%=rwV.getString("vazhipad_description")%>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Amount
                            </td>
                            <td>
                                <%=rwV.getString("vazhipad_amount")%>
                            </td>
                        </tr>  
                        <tr>
                            <td colspan="2" align="center">
                                <a href="BookVazhipad.jsp?vid=<%=rwV.getString("vazhipad_id")%>">Book</a>
                            </td>
                        </tr>   
                    </table>
                </td>
                <%
                    }
                %>
            </tr>
        </table>
    </marquee>
    <script>
        var scrollSpeed = 3; // Adjust this value to change the scroll speed

        document.addEventListener('mousemove', function(e) {
            if (e.buttons === 1) {
                var marquee = document.querySelector('marquee');
                if (marquee) {
                    var delta = e.movementX || e.mozMovementX || e.webkitMovementX || 0;
                    marquee.scrollLeft -= (delta * scrollSpeed);
                }
            }
        });
    </script>

</body>
<%@include file="Foot.jsp" %>
</html>
