<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String user_id = request.getParameter("user_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone_number = request.getParameter("phone_number");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update user set user_name=?, user_password=?, user_phone=?, user_age=?, user_gender=?, user_address=?, user_email=? where user_id=" + user_id);
        pst.setString(1, name);
        pst.setString(2, password);
        pst.setString(3, phone_number);
        pst.setString(4, age);
        pst.setString(5, gender);
        pst.setString(6, address);
        pst.setString(7, email);
        pst.executeUpdate();
%>

<script>
    alert("Profile updated successfully");
    window.location = "./profile.jsp?user_id=<%=user_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Profile</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="../css/navbar.css" />
        <link rel="stylesheet" href="../css/signup.css" />
    </head>
    <body>
        <ul>
            <li class="l1">
                <a style="pointer-events: none; color: red">
                    <i style="color: red"
                       class="fa fa-user"
                       aria-hidden="true"
                       ></i>
                    &nbsp; User</a
                >
            </li>
            <li class="l1"><a href="./movie.jsp?user_id=<%=user_id%>">Movies</a></li>
            <li class="l1"><a href="./review.jsp?user_id=<%=user_id%>">Reviews</a></li>
            <li class="l1"><a href="./profile.jsp?user_id=<%=user_id%>">Profile</a></li>
            <li class="l2" style="float: right">
                <a href="../index.jsp"
                   >Logout &nbsp;
                    <i
                        style="color: red"
                        class="fa fa-sign-out"
                        aria-hidden="true"
                        ></i
                    ></a>
            </li>
        </ul>
        <div class="container" style="margin-top: 55px; padding-bottom: 0; padding-top: 10px">
            <div class="title">Update Profile</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from user where user_id = ?");
                    pst.setString(1, user_id);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
                %>

                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                name="name"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct name"
                                value="<%=rs.getString(2)%>"
                                placeholder="Enter name"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input
                                type="password"
                                name="password"
                                value="<%=rs.getString(3)%>"
                                placeholder="Enter password"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input
                                type="text"
                                name="phone_number"
                                pattern="[6789][0-9]{9}"
                                title="Enter correct phone number"
                                value="<%=rs.getString(4)%>"
                                placeholder="Enter phone number"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Age</span>
                            <input
                                type="number"
                                name="age"
                                min="10"
                                max="100"
                                value="<%=rs.getString(5)%>"
                                placeholder="Enter age"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input
                                type="text"
                                name="address"
                                value="<%=rs.getString(7)%>"
                                placeholder="Enter address"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input
                                type="email"
                                name="email"
                                value="<%=rs.getString(8)%>"
                                placeholder="Enter email"
                                required
                                />
                        </div>
                    </div>
                    <div class="gender-details">

                        <%
                            if (rs.getString(6).equals("Male")) {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" checked />
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
                        <%
                        } else if (rs.getString(6).equals("Female")) {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" />
                        <input type="radio" name="gender" value="Female" id="dot-2" checked />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
                        <%
                        } else {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" />
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" checked />
                        <%
                            }
                        %>
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">Other</span>
                            </label>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Update" />
                    </div>
                </form>

                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>