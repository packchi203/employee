<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>

<%

    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp", "root", "");
        Statement st = con.createStatement();
        String deleteQuery = "DELETE FROM Employee WHERE id = " + id;
        st.executeUpdate(deleteQuery);
        response.sendRedirect("list.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
