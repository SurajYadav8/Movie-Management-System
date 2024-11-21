<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String director_id = request.getParameter("director_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone_number = request.getParameter("phone_number");

        String day = "" + dob.charAt(8) + dob.charAt(9);
        String month = "" + dob.charAt(5) + dob.charAt(6);
        String year = "" + dob.charAt(0) + dob.charAt(1) + dob.charAt(2) + dob.charAt(3);
        String temp_dob = day + "-" + month + "-" + year;

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update director set d_name=?, d_password=?, d_date_of_birth=?, d_gender=?, d_ph_num=? where d_id=" + director_id);
        pst.setString(1, name);
        pst.setString(2, password);
        pst.setString(3, temp_dob);
        pst.setString(4, gender);
        pst.setString(5, phone_number);
        pst.executeUpdate();
%>

<script>
    alert("Director updated successfully");
    window.location = "./manage_director.jsp?admin_id=<%=admin_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Update Director</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Update Director</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from director where d_id = ?");
                    pst.setString(1, director_id);
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
                                value="<%=rs.getString(6)%>"
                                placeholder="Enter phone number"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Date of Birth</span>
                            <input
                                type="date"
                                name="dob"

                                <%
                                    String dob = rs.getString(4);
                                    String day = "" + dob.charAt(0) + dob.charAt(1);
                                    String month = "" + dob.charAt(3) + dob.charAt(4);
                                    String year = "" + dob.charAt(6) + dob.charAt(7) + dob.charAt(8) + dob.charAt(9);
                                    String temp_dob = year + "-" + month + "-" + day;

                                %>

                                value="<%=temp_dob%>"
                                required
                                />
                        </div>
                    </div>
                    <div class="gender-details">

                        <%
                            if (rs.getString(5).equals("Male")) {
                        %>
                        <input type="radio" name="gender" value="Male" id="dot-1" checked />
                        <input type="radio" name="gender" value="Female" id="dot-2" />
                        <input type="radio" name="gender" value="Other" id="dot-3" />
                        <%
                        } else if (rs.getString(5).equals("Female")) {
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
