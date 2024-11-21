<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String user_id = request.getParameter("user_id");
    String category = request.getParameter("category");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Movies</title>
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

        <div class="container">
            <h1 style="color: red; font-weight: bold">Movies</h1>
            <br />

            <span class="details"><b>Category</b></span>
            &nbsp;
            <span>
                <select style=" height:27px;" name="category" id="category" required>
                    <%
                        Connection con = ConnectionProvider.getCon();
                        PreparedStatement pst = con.prepareStatement("select movie_type from category order by movie_type");
                        ResultSet rs = pst.executeQuery();

                        if (category != null) {
                    %>
                    <option value="<%=category%>"><%=category%></option>
                    <%
                        }

                        while (rs.next()) {
                            if (! rs.getString(1).equals(category)) {
                    %>

                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                    <%
                            }
                        }
                    %>    

                </select>
            </span>

            &nbsp;
            <button class="btn btn-primary" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 0" type="submit" onclick="goToProperPage()"> search </button>

            <br /> <br />

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="6%">S. No.</th>
                        <th>Name</th>
                        <th>Actor</th>
                        <th>Platform</th>
                        <th width="15%">Release Date</th>
                        <th>Category</th>
                        <th>Director</th>
                    </tr>
                </thead>
                <tbody id="movie_tbody">

                    <%
                        int sno = 1;
                        if (category != null) {
                            pst = con.prepareStatement("select m.movie_name, m.movie_actor, m.movie_platform, m.movie_release_date, c.movie_type, d.d_name, m.movie_id from movie m, category c, director d where m.c_id = c.c_id and m.d_id = d.d_id and c.movie_type='" + category + "' order by m.movie_release_date desc");
                        } else {
                            pst = con.prepareStatement("select m.movie_name, m.movie_actor, m.movie_platform, m.movie_release_date, c.movie_type, d.d_name, m.movie_id from movie m, category c, director d where m.c_id = c.c_id and m.d_id = d.d_id order by m.movie_release_date desc");
                        }
                        rs = pst.executeQuery();

                        while (rs.next()) {
                    %>        

                    <tr>
                        <th scope="row"><%=sno%></th>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>

                        <%
                            String dob = rs.getString(4);
                            String day = "" + dob.charAt(8) + dob.charAt(9);
                            String month = "" + dob.charAt(5) + dob.charAt(6);
                            String year = "" + dob.charAt(0) + dob.charAt(1) + dob.charAt(2) + dob.charAt(3);
                            String temp_dob = day + "-" + month + "-" + year;
                        %>

                        <td><%=temp_dob%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                    </tr>

                    <%
                            sno++;
                        }
                    %>

                </tbody>
            </table>
        </div>

        <script type="text/javascript">

            function goToProperPage() {
                let x = document.getElementById("category").value;
                let y = "<%=user_id%>";
                window.location = "./movie.jsp?user_id=" + y + "&category=" + x;
            }

        </script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>             
