<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String category_id = request.getParameter("category_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String movie_type = request.getParameter("movie_type");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update category set movie_type=? where c_id=" + category_id);
        pst.setString(1, movie_type);
        pst.executeUpdate();
%>

<script>
    alert("Category updated successfully");
    window.location = "./manage_category.jsp?admin_id=<%=admin_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Update Category</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Update Category</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from category where c_id = ?");
                    pst.setString(1, category_id);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
                %>

                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Movie Type</span>
                            <input
                                type="text"
                                name="movie_type"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct category name"
                                value="<%=rs.getString(2)%>"
                                placeholder="Enter movie type"
                                required
                                />
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
