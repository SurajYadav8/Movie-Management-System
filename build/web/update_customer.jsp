<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
    String c_id = request.getParameter("c_id");
    String id = request.getParameter("a_id");
%>

<% 
    if(request.getParameter("submit")!=null) 
    {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile_number = request.getParameter("mobile_number");
        String shipping_address = request.getParameter("shipping_address");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovm","root","");
        PreparedStatement pst = con.prepareStatement("update customer set first_name=?, last_name=?, email=?, password=?, mobile_number=?, shipping_address=? where c_id=?");
        pst.setString(1, first_name);
        pst.setString(2, last_name);
        pst.setString(3, email);
        pst.setString(4, password);
        pst.setString(5, mobile_number);
        pst.setString(6, shipping_address);
        pst.setString(7, c_id);
        pst.executeUpdate();
%>

<script>
    alert("Customer Record Updated Successfully");
    window.location= "manage_customer.jsp?id=<%=id%>";
</script>

<%
    }
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title> Update Customer </title>
     <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: linear-gradient(135deg, #ffff1a, #99ffdd);
}
.container{
  max-width: 700px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #9b59b6;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
   justify-content: space-between;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #9b59b6;
   border-color: #d9d9d9;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 30%;
   border-radius: 5px;
   border: none;
   color: #0000b3;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: linear-gradient(135deg, #ff6666, #00e600);
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
    </style>
  </head>
<body>
  <div class="container">
    <div class="title"> Update Customer </div>
    <div class="content">
      <form action="#" method="post">
          <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovm","root","");
            PreparedStatement pst = con.prepareStatement("select * from customer where c_id = ?");
            pst.setString(1, c_id);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
          %>
          
          <div class="user-details">
          <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" pattern="^[a-zA-Z]+$" title="Enter Character Only" name="first_name" value="<%=rs.getString("first_name")%>" required>
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" pattern="^[a-zA-Z]+$" title="Enter Character Only" name="last_name" value="<%=rs.getString("last_name")%>" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" value="<%=rs.getString("email")%>" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" value="<%=rs.getString("password")%>" required>
          </div>
          <div class="input-box">
            <span class="details">Mobile Number</span>
            <input type="number" min="7000000000" max="9999999999" name="mobile_number" value="<%=rs.getString("mobile_number")%>" required>
          </div>
          <div class="input-box">
            <span class="details">Shipping Address</span>
            <input type="text" name="shipping_address" value="<%=rs.getString("shipping_address")%>" required>
          </div>
          
          <%
              }
          %>
          
          </div>
        <div class="button">
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; 
          <input type="submit" value="Update" name="submit">
          &nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="Reset">
        </div>
        </form>
    </div>
  </div>
</body>
</html>

