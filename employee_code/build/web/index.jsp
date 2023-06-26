<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>Add Employee</title>
</head>

<body>
     <style>
         *{
              font-size: 18px;
          }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        width: 400px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f2f2f2;
    }

    form label {
        display: block;
        margin-bottom: 10px;
    }

    form input[type="text"] {
        width: 100%;
        padding: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    form input[type="submit"],
    form input[type="reset"] {
        width: 100%;
        padding: 8px 12px;
        margin-top: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
     .buton a {
        display: inline-block;
        padding: 10px 20px;
        margin-right: 10px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }

    .buton a:hover {
        background-color: #45a049;
    }
</style>
<div class="buton">
  
    <a href="list.jsp">Employee List</a>
     <a href="index.jsp">Add Employee</a>
</div>  
    <h1>Add Employee</h1>
 <div class="container">
  <form action="" method="post">
    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" required placeholder="Enter full name"><br>
    
    <label for="birthday">Birthday:</label>
    <input type="text" id="birthday" name="birthday" pattern="\d{4}-\d{2}-\d{2}" required placeholder="Enter birthdat(Year-Month-Day)"><br>
    
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required placeholder="Enter address"><br>
    
    <label for="position">Position:</label>
    <input type="text" id="position" name="position" required placeholder="Enter position"><br>
    
    <label for="department">Department:</label>
    <input type="text" id="department" name="department" required placeholder="Enter department"><br>
    
    <input type="submit" value="Submit">
    <input type="reset" value="Reset">
</form>

</div>

      <%
    if (request.getMethod().equals("POST")) {
        try {
           
            String fullName = request.getParameter("fullName");
            String birthday = request.getParameter("birthday");
            String address = request.getParameter("address");
            String position = request.getParameter("position");
            String department = request.getParameter("department");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp", "root", "");
            Statement st = con.createStatement();

            
            String insertQuery = "INSERT INTO Employee ( full_name, birthday, address, position, department) VALUES ( '" + fullName + "', '" + birthday + "', '" + address + "', '" + position + "', '" + department + "')";
            st.executeUpdate(insertQuery);
            
            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
    
    
 
</body>
</html>
