<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String director_id = request.getParameter("director_id");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Review</title>
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
    </head>
    <body>
        <ul>
            <li class="l1">
                <a style="pointer-events: none; color: red" href="page.html"
                   ><i
                        style="color: red"
                        class="fa fa-user"
                        aria-hidden="true"
                        ></i>
                    &nbsp; Director</a
                >
            </li>
            <li class="l1"><a href="./movie.jsp?director_id=<%=director_id%>">Movies</a></li>
            <li class="l1"><a href="./review.jsp?director_id=<%=director_id%>">Reviews</a></li>
            <li class="l1"><a href="./profile.jsp?director_id=<%=director_id%>">Profile</a></li>
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

        <div class="container">
            <h1 style="color: red; font-weight: bold">Manage Review</h1>
            <br />
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>S. No.</th>
                        <th>Movie Name</th>
                        <th>User Name</th>
                        <th>Star</th>
                        <th>Text</th>
                        <th>Replied Text</th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int sno = 1;
                        Connection con = ConnectionProvider.getCon();
                        PreparedStatement pst = con.prepareStatement("select u.user_name, r.r_star, r.r_text, r.r_id, m.movie_name, r.reply from user u, review r, movie m where u.user_id = r.user_id and m.movie_id = r.movie_id and m.d_id =" + director_id);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                    %>        

                    <tr>
                        <th scope="row"><%=sno%></th>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%>
                            &nbsp;
                            <i
                                style="color: yellow"
                                class="fa fa-star"
                                aria-hidden="true"
                                ></i
                            ></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td>
                            <a href="./reply.jsp?review_id=<%=rs.getString(4)%>&director_id=<%=director_id%>"
                               ><i class="fa fa-edit" aria-hidden="true"></i
                                ></a>
                        </td>
                    </tr>

                    <%
                            sno++;
                        }
                    %>

                </tbody>
            </table>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
