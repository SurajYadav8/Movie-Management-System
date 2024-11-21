<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String actor = request.getParameter("actor");
        String platform = request.getParameter("platform");
        String release_date = request.getParameter("release_date");
        String category = request.getParameter("category");
        String director = request.getParameter("director");
        String c_id = "", d_id = "";
        
        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select c_id from category where movie_type=?");
        pst.setString(1, category);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            c_id = rs.getString(1);
        }
        
        pst = con.prepareStatement("select d_id from director where d_name=?");
        pst.setString(1, director);
        rs = pst.executeQuery();
        if (rs.next()) {
            d_id = rs.getString(1);
        }
        
        pst = con.prepareStatement("insert into movie(movie_name, movie_actor, movie_platform, movie_release_date, c_id, d_id) values(?,?,?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, actor);
        pst.setString(3, platform);
        pst.setString(4, release_date);
        pst.setString(5, c_id);
        pst.setString(6, d_id);
        pst.executeUpdate();
%>

<script>
    alert("Movie added successfully");
    window.location = "./manage_movie.jsp?admin_id=<%=admin_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Movie</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Movie</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                placeholder="Enter name"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct movie name"
                                name="name"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Actor</span>
                            <input
                                type="text"
                                name="actor"
                                placeholder="Enter actor"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Platform</span>
                            <input
                                type="text"
                                name="platform"
                                placeholder="Enter platform"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Release Date</span>
                            <input type="date" name="release_date" placeholder="" required />
                        </div>
                        <div class="input-box">
                            <span class="details">Category</span>
                            <select name="category" id="category" required>
                                <%
                                    Connection con = ConnectionProvider.getCon();
                                    PreparedStatement pst = con.prepareStatement("select movie_type from category order by movie_type");
                                    ResultSet rs = pst.executeQuery();

                                    while (rs.next()) {
                                %>

                                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                                <%
                                    }
                                %>    

                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Director</span>
                            <select name="director" id="director" required>
                                <%
                                    pst = con.prepareStatement("select d_name from director order by d_name");
                                    rs = pst.executeQuery();

                                    while (rs.next()) {
                                %>

                                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                                <%
                                    }
                                %>    

                            </select>
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
