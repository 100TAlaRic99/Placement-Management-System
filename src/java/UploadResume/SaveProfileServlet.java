/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UploadResume;

import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.Part;
import java.io.File;

/**
 *
 * @author defaultuser0
 */
@MultipartConfig
public class SaveProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaveProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     //   processRequest(request, response);
    
        String studentId = request.getParameter("id");

        // Session validation: if studentId is null or "null", redirect to login
        if (studentId == null || studentId.trim().isEmpty() || studentId.equals("null")) {
            response.sendRedirect("studentlogin.jsp");
            return;
        }

        String fname   = request.getParameter("fname");
        String mname   = request.getParameter("mname");
        String lname   = request.getParameter("lname");
        String email   = request.getParameter("email");
        String gender  = request.getParameter("gender");
        String address = request.getParameter("address");
        String marks10 = request.getParameter("marks10");
        String marks12 = request.getParameter("marks12");
        String diploma = request.getParameter("diploma");
        String graduation = request.getParameter("graduation");
        String branch  = request.getParameter("branch");
        String dob     = request.getParameter("dob");
        String phone   = request.getParameter("phone");
        String skills  = request.getParameter("skills");

        // File upload
        Part filePart = request.getPart("resume");
        String resumePath = null;

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);

            resumePath = "uploads/" + fileName;
        }

        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String host = System.getenv("DB_HOST");

if (host != null) {
    // Railway (Online DB)
    String port = System.getenv("DB_PORT");
    String db = System.getenv("DB_NAME");
    String user = System.getenv("DB_USER");
    String pass = System.getenv("DB_PASS");

    String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    con = DriverManager.getConnection(url, user, pass);

} else {
    // Localhost
    String url = "jdbc:mysql://localhost:3306/myprofile_db";
    String user = "root";
    String pass = "spdt";

    con = DriverManager.getConnection(url, user, pass);
}
            PreparedStatement check = con.prepareStatement("SELECT * FROM student_profile WHERE id=?");
            check.setInt(1, Integer.parseInt(studentId));
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // UPDATE
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE student_profile SET fname=?, mname=?, lname=?, email=?, gender=?, address=?, marks10=?, marks12=?, diploma=?, graduation=?, branch=?, dob=?, phone=?, skills=?, resume_path=? WHERE id=?"
                );

                ps.setString(1, fname);
                ps.setString(2, mname);
                ps.setString(3, lname);
                ps.setString(4, email);
                ps.setString(5, gender);
                ps.setString(6, address);
                ps.setFloat(7, marks10==null||marks10.isEmpty()?0:Float.parseFloat(marks10));
                ps.setFloat(8, marks12==null||marks12.isEmpty()?0:Float.parseFloat(marks12));
                ps.setFloat(9, diploma==null||diploma.isEmpty()?0:Float.parseFloat(diploma));
                ps.setFloat(10, graduation==null||graduation.isEmpty()?0:Float.parseFloat(graduation));
                ps.setString(11, branch);
                ps.setDate(12, (dob==null||dob.isEmpty())?null:java.sql.Date.valueOf(dob));
                ps.setString(13, phone);
                ps.setString(14, skills);
                ps.setString(15, resumePath != null ? resumePath : rs.getString("resume_path"));
                ps.setInt(16, Integer.parseInt(studentId));

                ps.executeUpdate();
                ps.close();

            } else {
                // INSERT with explicit column names
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO student_profile (id, fname, mname, lname, email, gender, address, marks10, marks12, diploma, graduation, branch, dob, phone, skills, resume_path) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
                );

                ps.setInt(1, Integer.parseInt(studentId));
                ps.setString(2, fname);
                ps.setString(3, mname);
                ps.setString(4, lname);
                ps.setString(5, email);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setFloat(8, marks10==null||marks10.isEmpty()?0:Float.parseFloat(marks10));
                ps.setFloat(9, marks12==null||marks12.isEmpty()?0:Float.parseFloat(marks12));
                ps.setFloat(10, diploma==null||diploma.isEmpty()?0:Float.parseFloat(diploma));
                ps.setFloat(11, graduation==null||graduation.isEmpty()?0:Float.parseFloat(graduation));
                ps.setString(12, branch);
                ps.setDate(13, (dob==null||dob.isEmpty())?null:java.sql.Date.valueOf(dob));
                ps.setString(14, phone);
                ps.setString(15, skills);
                ps.setString(16, resumePath);

                ps.executeUpdate();
                ps.close();
            }

            rs.close();
            check.close();
            con.close();

            response.sendRedirect("myprofile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
