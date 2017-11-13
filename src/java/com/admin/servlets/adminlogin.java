package com.admin.servlets;

import com.dbutil.DBsingletone;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adminlogin", urlPatterns = {"/adminlogin"})
public class adminlogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass");
            System.out.println("name: " + uname + " Password: " + upass);

            DBsingletone dbs = DBsingletone.getDbSingletone();
            Connection con = dbs.getConnection();
            PreparedStatement stmt = con.prepareStatement("Select * from admin where a_name='" + uname + "' and a_pass='" + upass + "'");
            ResultSet rs = stmt.executeQuery();
            HttpSession session = request.getSession();
            if (rs.next()) {

                // System.out.println("uname pass " + rs.getString("Aname") + "  " + rs.getString("Apassword"));
                session.setAttribute("a_id", rs.getString("a_id"));
                session.setAttribute("a_name", rs.getString("a_name"));
                
                String nam=(String)session.getAttribute("a_name");
                System.out.print("Welcome" + nam);
                response.sendRedirect("adminpages/adminhome.jsp");
                //RequestDispatcher rd=request.getRequestDispatcher("adminpages/adminhome.jsp");
                //rd.include(request, response);
                // response.sendRedirect("adminpages/adminhome.jsp");
            } else {

                response.sendRedirect("adminlogin.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
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
