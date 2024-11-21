<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String user_id = request.getParameter("user_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String movie = request.getParameter("movie");
        String star = request.getParameter("star");
        String review_text = request.getParameter("review_text");
        String movie_id = "";

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("select movie_id from movie where movie_name=?");
        pst.setString(1, movie);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            movie_id = rs.getString(1);
        }

        pst = con.prepareStatement("insert into review(r_star, r_text, movie_id, user_id) values(?,?,?,?)");
        pst.setString(1, star);
        pst.setString(2, review_text);
        pst.setString(3, movie_id);
        pst.setString(4, user_id);
        pst.executeUpdate();
%>

<script>
    alert("Review added successfully");
    window.location = "./review.jsp?user_id=<%=user_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Review</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Review</div>
            <div class="content">
                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Movie</span>
                            <select name="movie" id="movie" required>
                                <%
                                    Connection con = ConnectionProvider.getCon();
                                    PreparedStatement pst = con.prepareStatement("select movie_name from movie order by movie_name");
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
                            <span class="details">Star</span>
                            <input
                                type="number"
                                name="star"
                                min="1"
                                max="5"
                                placeholder="Enter value between 1 to 5"
                                required
                                />
                        </div>
                                <div class="input-box" style="width: 650px">
                            <span class="details">Review Text</span>
                            <input
                                type="text"
                                name="review_text"
                                placeholder="Enter movie review"
                                required
                                />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Submit" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
