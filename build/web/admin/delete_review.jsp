<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String review_id = request.getParameter("review_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from review where r_id = ?");
    pst.setString(1, review_id);
    pst.executeUpdate();
%>

<script>
    alert("Review deleted successfully");
    window.location = "./manage_review.jsp?admin_id=<%=admin_id%>";
</script>
