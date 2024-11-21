<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
    String c_id = request.getParameter("c_id");
    String id = request.getParameter("a_id");
%>

<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovm","root","");
    PreparedStatement pst = con.prepareStatement("delete from customer where c_id = ?");
    pst.setString(1, c_id);
    pst.executeUpdate();
%>

<script>
    alert("Customer Record Deleted Successfully");
    window.location= "manage_customer.jsp?id=<%=id%>";
</script>
