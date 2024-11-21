<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String movie_id = request.getParameter("movie_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from movie where movie_id = ?");
    pst.setString(1, movie_id);
    pst.executeUpdate();
%>

<script>
    alert("Movie deleted successfully");
    window.location = "./manage_movie.jsp?admin_id=<%=admin_id%>";
</script>
