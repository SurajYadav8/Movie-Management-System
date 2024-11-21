<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user_id = request.getParameter("user_id");
    String category = request.getParameter("category");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <h4><%=user_id%></h4>
        <h4><%=category%></h4>
    </body>
</html>
