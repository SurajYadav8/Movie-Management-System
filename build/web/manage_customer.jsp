<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Manage Customer</title>
        <style>
            ul {
              list-style-type: none;
              overflow: hidden;
              background-color: #333;
              position: static;
              top: 0;
            }
            
            li.l1 a {
              display: block;
              color: white;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              float: left;
            }
            
            li.l3 a {
              display: block;
              color: white;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              background-color: green;
            }
            
            li.l2 a {
              display: block;
              color: white;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              background-color: red;
            }

            li a:hover {
              background-color: gray;
            }
            
        </style>
    </head>
    <body>
        <ul>
            <li class="l1"><a href="admin.jsp?id=<%=id%>">Home</a></li>
            <li class="l1"><a href="manage_admin.jsp?id=<%=id%>">Manage Admin</a></li>
            <li class="l1"><a href="manage_customer.jsp?id=<%=id%>">Manage Customer</a></li>
            <li class="l1"><a href="manage_vegetable.jsp?id=<%=id%>">Manage Vegetable</a></li>
            <li class="l1"><a href="sales.jsp?id=<%=id%>">Sales</a></li>
            <li class="l2" style="float:right;"><a href="index.jsp">Logout</a></li>
            <li class="l3" style="float:right;"><a href="admin_profile.jsp?id=<%=id%>">My Profile</a></li>
        </ul>
        
        <div class="container">
            <h1 style="color: #666633"> Manage Customer </h1> 
            <br> 
            <a class="btn btn-success" href="add_customer.jsp?id=<%=id%>"><h4>Add Customer</h4></a>                      
            <br> <br> <br>
        
            <table class="table table-sm">
            <thead>
              <tr>
                <th>S No.</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email Id</th>
                <th>Mobile Number</th>
                <th>Shipping Address</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>

<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovm","root","");
    PreparedStatement pst = con.prepareStatement("select * from customer");
    ResultSet rs = pst.executeQuery();
    
    int i = 1;
    
    while(rs.next())
    {
%>
                
                <tr>
                <th scope="row"><%=i%></th>
                <td><%=rs.getString("first_name")%></td>
                <td><%=rs.getString("last_name")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("mobile_number")%></td>
                <td><%=rs.getString("shipping_address")%></td>
                <td>
                    <a class="btn btn-warning" href="update_customer.jsp?c_id=<%=rs.getString("c_id")%>&a_id=<%=id%>">Update Customer</a>
                    <br> <br> 
                    <a style="padding-left: 16px; padding-right: 16px" class="btn btn-danger" href="delete_customer.jsp?c_id=<%=rs.getString("c_id")%>&a_id=<%=id%>">Delete Customer</a>                      
               </td>
              </tr>
              
<% 
    i++;
    }
%>
              
            </tbody>
        </table>
    </div>
    </body>
</html>

