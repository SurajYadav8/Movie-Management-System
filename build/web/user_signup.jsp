<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

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
        PreparedStatement pst = con.prepareStatement("insert into user(user_name,user_password,user_phone,user_age,user_gender,user_address,user_email) values(?,?,?,?,?,?,?)");
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
    alert("User registered successfully");
    window.location = "./user_login.jsp";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>User Signup</title>
        <link rel="stylesheet" href="./css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">User Signup</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                name="name"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct name"
                                placeholder="Enter name"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input
                                type="password"
                                name="password"
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
                                placeholder="Enter phone number"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Age</span>
                            <input
                                type="number"
                                min="10"
                                max="100"
                                name="age"
                                placeholder="Enter age"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input
                                type="text"
                                name="address"
                                placeholder="Enter address"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input
                                type="email"
                                name="email"
                                placeholder="Enter email"
                                required
                                />
                        </div>
                    </div>
                    <div class="gender-details">
                        <input type="radio" name="gender" value="Male" id="dot-1" checked/>
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
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
                        <input type="submit" name="submit" value="Register" />
                    </div>
                    <div class="signup-link">
                        Already a member? <a href="./user_login.jsp">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
