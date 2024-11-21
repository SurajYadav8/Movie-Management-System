<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String movie_type = request.getParameter("movie_type");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("insert into category(movie_type) values(?)");
        pst.setString(1, movie_type);
        pst.executeUpdate();
%>

<script>
    alert("Category added successfully");
    window.location = "./manage_category.jsp?admin_id=<%=admin_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Category</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Category</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Movie Type</span>
                            <input
                                type="text"
                                name="movie_type"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct category name"
                                placeholder="Enter movie type"
                                required
                                />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Add" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
