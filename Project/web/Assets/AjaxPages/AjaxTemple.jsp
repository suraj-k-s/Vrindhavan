<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <table align="center">
        <tr>
        <%
            String sel = "select * from tbl_temple t inner join tbl_place p on p.place_id=t.place_id inner join tbl_district d on d.district_id=p.district_id where true";
            String did = request.getParameter("did");
            String pid = request.getParameter("pid");
            if (!did.equals("")) {
                sel += "d.district_id='" + did + "'";
            }
            if (!pid.equals("")) {
                sel += "p.place_id='" + pid + "'";
            }
            ResultSet rw = con.selectCommand(sel);
            int i = 0;
            while (rw.next()) {
                i++;
        %>
        <td class="zoom" >
            <p style="text-align:center;margin:22px;padding:10px">
                <img src="../Assets/Files/TemplePhoto/<%=rw.getString("temple_photo")%>" width="100" height="100"><br>
                Name   : <%=rw.getString("temple_name")%><br>
                Contact: <%=rw.getString("temple_contact")%><br>
                Address: <%=rw.getString("temple_address")%><br>
                <br>
                <button class="btn"> <a href="ViewMore.jsp?tid=<%=rw.getString("temple_id")%>">View More</a></button>
            </p>
        </td>
        <%
                if (i % 4 == 0) {
                    out.println("</tr>");

                    out.println("<tr>");
                    i = 0;
                }
            }
        %>
</table>