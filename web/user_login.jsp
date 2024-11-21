<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select * from user where user_email=? and user_password=?");
        pst.setString(1, email);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String user_id = rs.getString(1);
            response.sendRedirect("./user/movie.jsp?user_id=" + user_id);
        } else {
%>

<script>
    alert("Invalid email and password");
</script>

<%
        }
    }
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>User Login</title>
        <link rel="stylesheet" href="./css/login.css" />
    </head>
    <body>
        <div class="wrapper">
            <div class="title">User Login</div>
            <form action="#" method="post">
                <div class="field">
                    <input type="email" name="email" required />
                    <label>Email</label>
                </div>
                <div class="field">
                    <input type="password" name="password" required />
                    <label>Password</label>
                </div>
                <div class="field">
                    <input type="submit" name="submit" value="Login" />
                </div>
                <div class="signup-link">
                    Not a member? <a href="./user_signup.jsp">Signup</a>
                </div>
                <div class="home-link">
                    <a href="./index.jsp">Back to Home</a>
                </div>
            </form>
        </div>
    </body>
</html>

