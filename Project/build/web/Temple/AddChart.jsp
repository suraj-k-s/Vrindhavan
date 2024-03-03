<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Addcart</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>
        <%
            String id = "", name = "";
            if (request.getParameter("btnsub") != null) {
                String insQry = "insert into tbl_templechart(tchart_name,tchart_date,tchart_description,templ_id)"
                        + "values('" + request.getParameter("name") + "','" + request.getParameter("date") + "','" + request.getParameter("details") + "','" + session.getAttribute("Tid") + "')";
                conn.executeCommand(insQry);
            }
            if (request.getParameter("did") != null) {
                String delQry = "delete from tbl_templechart where tchart_id ='" + request.getParameter("did") + "'";
                conn.executeCommand(delQry);
                response.sendRedirect("AddChart.jsp");
            }

        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name">
                    </td>
                </tr> 
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="date">
                    </td>
                </tr>
                <tr>
                    <td>details</td>
                    <td>
                        <textarea name="details"></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="1" align="center">

                <tr>
                    <td>SLno</td>
                    <td>Date</td>
                    <td>Name</td>
                    <td>Details</td>
                    <td>Action</td>
                </tr>
                <%                    int i = 0;
                    String selQry = "select * from tbl_templechart where templ_id='" + session.getAttribute("Tid") + "'";
                    ResultSet rs = conn.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs.getString("tchart_date")%></td>
                    <td><%=rs.getString("tchart_name")%></td>
                    <td><%=rs.getString("tchart_description")%></td>
                    <td><a href="AddChart.jsp?did=<%=rs.getString("tchart_id")%>">Delete</a></td>
                </tr>
                <%

                    }
                %>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>

</html>
