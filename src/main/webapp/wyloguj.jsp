<%-- 
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("./index.jsp");
%>
    </head>
    <body>

    </body>
</html>
