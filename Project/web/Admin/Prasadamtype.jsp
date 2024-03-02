<%-- 
    Document   : prasadamtype
    Created on : 1 Jan, 2024, 10:31:43 AM
    Author     : PSST
--%>
<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prasadamtype</title>
    </head>
    <%@include file="Head.jsp" %>
    <body>

        <%
            String id = "", prasadamtype = "";
            if (request.getParameter("btnsub") != null) {
                if (request.getParameter("txt_hidden").equals("")) {
                    String insQry = "insert into tbl_prasadamtype(prasadamtype_name)values('" + request.getParameter("txt_name") + "')";
                    conn.executeCommand(insQry);

                } else {
                    String upQry = "update tbl_prasadamtype set prasadamtype_name='" + request.getParameter("txt_name") + "'where prasadamtype_id='" + request.getParameter("txt_hidden") + "'";
                    conn.executeCommand(upQry);
                    response.sendRedirect("Prasadamtype.jsp");
                }
            }
            if (request.getParameter("pid") != null) {
                String delQry = "delete from tbl_prasadamtype where prasadamtype_id='" + request.getParameter("pid") + "'";
                conn.executeCommand(delQry);
                response.sendRedirect("Prasadamtype.jsp");

            }
            if (request.getParameter("jid") != null) {
                String selQ = "select *from tbl_prasadamtype where prasadamtype_id='" + request.getParameter("jid") + "'";
                ResultSet rss = conn.selectCommand(selQ);
                rss.next();
                id = rss.getString("prasadamtype_id");
                prasadamtype = rss.getString("prasadamtype_name");
            }

        %>
        <form method="post">
            <table border="1"align="center">
                <tr>
                    <td> parasadamtype</td>
                    <td><input type="text"name="txt_name"value="<%=prasadamtype%>">
                        <input type="hidden"name="txt_hidden"value="<%=id%>"></td>
                </tr>
                <tr>
                    <td colspan="2"align="center"><input type="submit"name="btnsub"value="save">
                        <input type="reset"name="btncan"value="cancel"></td>
                </tr>
            </table>
            <table border="1"align="center">
                <tr>
                    <td>SLNO</td>
                    <td>prasadamtype</td>
                    <td>Action</td>
                </tr>
                <%
                    int i = 0;
                    String selQry = "select * from tbl_prasadamtype";
                    ResultSet rs = conn.selectCommand(selQry);

                    while (rs.next()) {
                        i++;
                %> 
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("prasadamtype_name")%></td>
                    <td><a href="Prasadamtype.jsp?pid=<%=rs.getString("prasadamtype_id")%>">Delete</a>
                        <a href="Prasadamtype.jsp?jid=<%=rs.getString("prasadamtype_id")%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %> 
</html>
