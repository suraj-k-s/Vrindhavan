<%-- 
    Document   : smallestandlargest
    Created on : 23 Dec, 2023, 12:47:15 PM
    Author     : PSST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>smallestandlargest</title>
    </head>
    <body>
        <% int smallest=0;
           int largest=0;
        if(request.getParameter("btnsub")!= null)
        {
          int Num1= Integer.parseInt(request.getParameter("txt_name"));
          int Num2= Integer.parseInt(request.getParameter("txt_name3"));
         if(Num1<Num2)
         {
            
         smallest = Num1;            
         }
         else
         {
             smallest = Num2;
         
            }
         if(Num2>Num1)
         {
             largest= Num2;
         }
         else
         {
             largest= Num1;
         }
         }
          %>        
        <form method="post">
            <table border="1">
                <tr>
                    <td>Number-1</td>
                    <td><input type="text"name="txt_name"></td>
                    </tr>
                    <tr>
                        <td>Number-2</td>
                        <td><input type="text"name="txt_name3"></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit"name="btnsub"value="find">
                            <input type="reset"name="btncan"value="cancel"></td>
                        
                    </tr>
            </table>
        </form>
        smallest =<%=smallest %>
        largest =<%=largest%>
    </body>
</html>
