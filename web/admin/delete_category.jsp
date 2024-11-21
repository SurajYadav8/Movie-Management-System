<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_connection.ConnectionProvider" %>

<%
    String admin_id = request.getParameter("admin_id");
    String category_id = request.getParameter("category_id");
%>

<%
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("delete from category where c_id = ?");
    pst.setString(1, category_id);
    pst.executeUpdate();
%>

<script>
    alert("Category deleted successfully");
    window.location = "./manage_category.jsp?admin_id=<%=admin_id%>";
</script>
