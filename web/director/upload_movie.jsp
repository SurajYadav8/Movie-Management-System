<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String director_id = request.getParameter("director_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String actor = request.getParameter("actor");
        String platform = request.getParameter("platform");
        String release_date = request.getParameter("release_date");
        String category = request.getParameter("category");
        String c_id = "";
        
        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select c_id from category where movie_type=?");
        pst.setString(1, category);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            c_id = rs.getString(1);
        }
        
        pst = con.prepareStatement("insert into movie(movie_name, movie_actor, movie_platform, movie_release_date, c_id, d_id) values(?,?,?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, actor);
        pst.setString(3, platform);
        pst.setString(4, release_date);
        pst.setString(5, c_id);
        pst.setString(6, director_id);
        pst.executeUpdate();
%>

<script>
    alert("Movie uploaded successfully");
    window.location = "./movie.jsp?director_id=<%=director_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Upload Movie</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Upload Movie</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct movie name"
                                placeholder="Enter name"
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
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Upload" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
