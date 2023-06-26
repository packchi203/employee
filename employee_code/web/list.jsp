<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<html>
<head>
    <title>Employee List</title>
</head>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    table th,
    table td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #f2f2f2;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
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

<body>
    <div class="buton">
  
    <a href="list.jsp">Employee List</a>
     <a href="index.jsp">Add Employee</a>
</div>  
    <h2>Employee List</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Birthday</th>
            <th>Address</th>
            <th>Position</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp", "root", "");
            Statement st = con.createStatement();
            String query = "SELECT * FROM Employee";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("birthday") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("position") %></td>
            <td><%= rs.getString("department") %></td>
            <td>
                <a href="edit.jsp?id=<%= rs.getInt("id") %>">Edit</a> | 
                <a href="delete.jsp?id=<%= rs.getInt("id") %>">Delete</a> 
            </td>
        </tr>

        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
