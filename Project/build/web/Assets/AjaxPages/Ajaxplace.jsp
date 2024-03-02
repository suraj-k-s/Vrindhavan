<jsp:useBean class="DB.ConnectionClass" id="conn"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<select name="sel_place">
    <option>Select</option>
    <%
    String SelQ="select * from tbl_place where district_id='"+request.getParameter("pid") +"'";
    ResultSet rs=conn.selectCommand(SelQ);
    while(rs.next())
    {
        %> 
        <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
        <%
    }
    %>
</select>