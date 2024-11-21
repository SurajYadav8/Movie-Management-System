<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select * from director where d_name=? and d_password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String director_id = rs.getString(1);
            response.sendRedirect("./director/movie.jsp?director_id=" + director_id);
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
        <title>Director Login</title>
        <link rel="stylesheet" href="./css/login.css" />
    </head>
    <body>
        <div class="wrapper">
            <div class="title">Director Login</div>
            <form action="#" method="post">
                <div class="field">
                    <input type="text" name="username" required />
                    <label>Username</label>
                </div>
                <div class="field">
                    <input type="password" name="password"required />
                    <label>Password</label>
                </div>
                <div class="field">
                    <input type="submit" name="submit" value="Login" />
                </div>
                <div class="signup-link">
                    Not a member? <a href="./director_signup.jsp">Signup</a>
                </div>
                <div class="home-link">
                    <a href="./index.jsp">Back to Home</a>
                </div>
            </form>
        </div>
    </body>
</html>

