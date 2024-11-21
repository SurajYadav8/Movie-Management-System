<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select * from admin where admin_name=? and admin_password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String admin_id = rs.getString(1);
            response.sendRedirect("./admin/manage_user.jsp?admin_id=" + admin_id);
        } else {
%>

<script>
    alert("Invalid username and Password");
</script>

<%
        }
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>Admin Login</title>
        <link rel="stylesheet" href="./css/login.css" />
    </head>
    <body>
        <div class="wrapper">
            <div class="title">Admin Login</div>
            <form action="#" method="post">
                <div class="field">
                    <input type="text" name="username" required />
                    <label>Username</label>
                </div>
                <div class="field">
                    <input type="password" name="password" required />
                    <label>Password</label>
                </div>
                <div class="field">
                    <input type="submit" name="submit" value="Login" />
                </div>
                <br>
                <div class="home-link">
                    <a href="./index.jsp">Back to Home</a>
                </div>
            </form>
        </div>
    </body>
</html>
