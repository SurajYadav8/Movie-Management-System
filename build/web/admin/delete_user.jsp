<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String user_id = request.getParameter("user_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from user where user_id = ?");
    pst.setString(1, user_id);
    pst.executeUpdate();
%>

<script>
    alert("User deleted successfully");
    window.location = "./manage_user.jsp?admin_id=<%=admin_id%>";
</script>
