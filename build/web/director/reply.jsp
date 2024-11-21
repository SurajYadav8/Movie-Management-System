<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String director_id = request.getParameter("director_id");
    String review_id = request.getParameter("review_id");
%>

<%
    if (request.getParameter("submit") != null) {
        String reply = request.getParameter("reply");

        Connection con = ConnectionProvider.getCon();
        PreparedStatement pst = con.prepareStatement("update review set reply=? where r_id=" + review_id);
        pst.setString(1, reply);
        pst.executeUpdate();
%>

<script>
    alert("Reply added successfully");
    window.location = "./review.jsp?director_id=<%=director_id%>";
</script>

<%
    }
%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8" />
        <title>Add Reply</title>
        <link rel="stylesheet" href="../css/signup.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="title">Add Reply</div>
            <div class="content">

                <%
                    Connection con = ConnectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select reply from review where r_id = ?");
                    pst.setString(1, review_id);
                    ResultSet rs = pst.executeQuery();
                    if (rs.next()) {
                %>

                <form action="#" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Text</span>
                            <input
                                type="text"
                                name="reply"
                                pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
                                title="Enter correct reply"
                                value="<%=rs.getString(1)%>"
                                placeholder="Enter reply text"
                                required
                                />
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" name="submit" value="Change" />
                    </div>
                </form>

                <%
                    }
                %>

            </div>
        </div>
    </body>
</html>
