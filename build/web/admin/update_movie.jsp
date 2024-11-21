<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String movie_id = request.getParameter("movie_id");
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

        pst = con.prepareStatement("update movie set movie_name=?, movie_actor=?, movie_platform=?, movie_release_date=?, c_id=?, d_id=? where movie_id=?");
        pst.setString(1, name);
        pst.setString(2, actor);
        pst.setString(3, platform);
        pst.setString(4, release_date);
        pst.setString(5, c_id);
        pst.setString(6, d_id);
        pst.setString(7, movie_id);
        pst.executeUpdate();
%>

<script>
    alert("Movie updated successfully");
    window.location = "./manage_movie.jsp?admin_id=<%=admin_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Update Movie</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Update Movie</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from movie where movie_id = ?");
                    pst.setString(1, movie_id);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
                %>

                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input
                                type="text"
                                value="<%=rs.getString(2)%>"
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
                                value="<%=rs.getString(3)%>"
                                placeholder="Enter actor"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Platform</span>
                            <input
                                type="text"
                                name="platform"
                                value="<%=rs.getString(4)%>"
                                placeholder="Enter platform"
                                required
                                />
                        </div>
                        <div class="input-box">
                            <span class="details">Release Date</span>
                            <input type="date" value="<%=rs.getString(5)%>" name="release_date" placeholder="" required />
                        </div>

                        <%
                            String c_id = rs.getString(6);
                            String d_id = rs.getString(7);

                            String db_m_type = "", db_d_name = "";

                            pst = con.prepareStatement("select movie_type from category where c_id=?");
                            pst.setString(1, c_id);
                            rs = pst.executeQuery();
                            if (rs.next()) {
                                db_m_type = rs.getString(1);
                            }

                            pst = con.prepareStatement("select d_name from director where d_id=?");
                            pst.setString(1, d_id);
                            rs = pst.executeQuery();
                            if (rs.next()) {
                                db_d_name = rs.getString(1);
                            }
                        %>

                        <div class="input-box">
                            <span class="details">Category</span>
                            <select name="category" id="category" required>
                                <option value="<%=db_m_type%>"><%=db_m_type%></option>

                                <%
                                    pst = con.prepareStatement("select movie_type from category order by movie_type");
                                    rs = pst.executeQuery();

                                    while (rs.next()) {
                                        if (!rs.getString(1).equals(db_m_type)) {
                                %>

                                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                                <%
                                        }
                                    }
                                %>    

                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Director</span>
                            <select name="director" id="director" required>
                                <option value="<%=db_d_name%>"><%=db_d_name%></option>
                                <%
                                    pst = con.prepareStatement("select d_name from director order by d_name");
                                    rs = pst.executeQuery();

                                    while (rs.next()) {
                                        if (!rs.getString(1).equals(db_d_name)) {
                                %>

                                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                                <%
                                        }
                                    }
                                %>    

                            </select>
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
