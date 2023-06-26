import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection settings
    private static final String DB_URL = "jdbc:mysql://localhost:3306/emp";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullName");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        String department = request.getParameter("department");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            String sql = "INSERT INTO Employee (id, full_name, birthday, address, position, department) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setString(2, fullName);
            stmt.setString(3, birthday);
            stmt.setString(4, address);
            stmt.setString(5, position);
            stmt.setString(6, department);
            
            stmt.executeUpdate();
            
            response.sendRedirect("list.jsp"); // Redirect to list.jsp after successful insertion
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
