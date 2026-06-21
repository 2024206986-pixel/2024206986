package controller;

import bean.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private static final String URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private static final String USER = "studentapp";
    private static final String PASSWORD = "studentapp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProfileBean p = new ProfileBean(
                request.getParameter("studentId"),
                request.getParameter("name"),
                request.getParameter("program"),
                request.getParameter("email"),
                request.getParameter("hobbies"),
                request.getParameter("intro"));

        String sql = "INSERT INTO Profile (studentID, name, programme, email, hobbies, introduction) VALUES (?,?,?,?,?,?)";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getStudentID());
            ps.setString(2, p.getName());
            ps.setString(3, p.getProgram());
            ps.setString(4, p.getEmail());
            ps.setString(5, p.getHobbies());
            ps.setString(6, p.getIntro());
            ps.executeUpdate();

            request.setAttribute("profile", p);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        List<ProfileBean> list = new ArrayList<>();

        String sql = (keyword != null && !keyword.trim().isEmpty())
                ? "SELECT * FROM Profile WHERE studentID LIKE ? OR name LIKE ?"
                : "SELECT * FROM Profile";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProfileBean(
                            rs.getString("studentID"),
                            rs.getString("name"),
                            rs.getString("programme"),
                            rs.getString("email"),
                            rs.getString("hobbies"),
                            rs.getString("introduction")));
                }
            }

            request.setAttribute("profiles", list);
            request.getRequestDispatcher("viewprofiles.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }
}