<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%
    
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp", "root", "");
        Statement st = con.createStatement();

  
        String query = "SELECT * FROM Employee WHERE id = " + id;
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            String fullName = rs.getString("full_name");
            String birthday = rs.getString("birthday");
            String address = rs.getString("address");
            String position = rs.getString("position");
            String department = rs.getString("department");

          
%>
<html>
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
<head>
    <div class="buton">
  
    <a href="list.jsp">Employee List</a>
     <a href="index.jsp">Add Employee</a>
</div>  
    <title>Edit Employee</title>
</head>
<body> <h2>Edit Employee</h2>
    <div class="container" >
  

    <form action="update.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>"> 

        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" value="<%= fullName %>" required><br>

        <label for="birthday">Birthday:</label>
        <input type="text" id="birthday" name="birthday" value="<%= birthday %>" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= address %>" required><br>

        <label for="position">Position:</label>
        <input type="text" id="position" name="position" value="<%= position %>" required><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" value="<%= department %>" required><br>

        <input type="submit" value="Update">
        <input type="reset" value="Reset">
    </form>
        </div>
</body>
</html>
<%
        } else {
           
            out.println("Employee not found");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
