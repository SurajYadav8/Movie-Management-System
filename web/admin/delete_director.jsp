<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String director_id = request.getParameter("director_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from director where d_id = ?");
    pst.setString(1, director_id);
    pst.executeUpdate();
%>

<script>
    alert("Director deleted successfully");
    window.location = "./manage_director.jsp?admin_id=<%=admin_id%>";
</script>
