<%-- 
    Document   : sum.jsp
    Created on : 23 Dec, 2023, 11:16:04 AM
    Author     : PSST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sum</title>
    </head>
    <body>
        <% int sum=0;
        if(request.getParameter("btnsub")!=null)
        {
            int Num1= Integer.parseInt(request.getParameter("txt_name"));
          int Num2= Integer.parseInt(request.getParameter("txt_name1"));
          sum=Num1+Num2;
        }
        %>
        
        <form method="post">
            <table border="1">
                <tr>
                    <td>number1</td>
                    <td><input type="text" name="txt_name"></td>
                </tr>
                <tr>
                    <td>number2</td>
                   <td><input type="text"name="txt_name1"></td>
                    
            </tr>
            <tr>
                <td colspan="2"align="center">
                    <input type="submit"name="btnsub"value="sum">
                    <input type="reset"name="btncan"value="cancel"></td>
                
            </tr>    
            </table>
        </form>
        Result=<%=sum%>
              
            
    </body>
</html>
