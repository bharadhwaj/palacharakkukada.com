/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anil
 */
public class editUserDetails extends HttpServlet {

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
            out.println("<title>Servlet editUserDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editUserDetails at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();

        Path currentRelativePath = Paths.get("");
        String path = currentRelativePath.toAbsolutePath().toString();

        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append("jdbc:sqlite:");
        stringBuilder.append(path);
        stringBuilder.append("/palacharakkukada.db");

        String dbUrl = stringBuilder.toString();
        ArrayList<ArrayList<String>> messages = new ArrayList<ArrayList<String>>();
        ArrayList<String> message = new ArrayList<String>();
        HttpSession session = request.getSession();
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            String form = request.getParameter("form");
            int userID = (int)session.getAttribute("userID");
            if(form.equals("edituserdetails")) {
                String newName = request.getParameter("name");
                String password = request.getParameter("password");
                PreparedStatement ps = con.prepareStatement("select password from users where userID = ?");
                ps.setInt(1,userID);
                ResultSet rs = ps.executeQuery();
                String orginalPassword= "";
                
                if(rs.next()) {
                    orginalPassword = rs.getString("password");         
                }
                rs.close();
                if(orginalPassword.equals(password)) {
                    ps = con.prepareStatement("update users set name = ? where userId = ?");
                    ps.setString(1,newName);
                    ps.setInt(2, userID);
                    ps.executeUpdate();
                    message.add("success");
                    message.add("Username successfuly changed!");
                    messages.add(message);
                    session.setAttribute("username",newName);
                    session.setAttribute("messages",messages);
                    response.sendRedirect("edituserdetails.jsp");
                } else {
                    message.add("danger");
                    message.add("Password incorrect!");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    response.sendRedirect("edituserdetails.jsp");
                    //out.print(password +" " + orginalPassword);
                }
            } else {
                String password = request.getParameter("password");
                String oldPassword = request.getParameter("old-password");
                PreparedStatement ps = con.prepareStatement("select password from users where userID = ?");
                ps.setInt(1,userID);
                ResultSet rs = ps.executeQuery();
                String orginalPassword= "";
                if(rs.next()) {
                    orginalPassword = rs.getString("password");         
                }
                rs.close();
                if(orginalPassword.equals(oldPassword)) {
                    ps = con.prepareStatement("update users set password = ? where userId = ?");
                    ps.setString(1,password);
                    ps.setInt(2, userID);
                    ps.executeUpdate();
                    message.add("success");
                    message.add("Password successfuly changed!");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    response.sendRedirect("edituserdetails.jsp");
                } else {
                    message.add("danger");
                    message.add("Password incorrect!");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    response.sendRedirect("edituserdetails.jsp");
                    //out.print("inside else");
                }
            }
            con.close();
        } catch(Exception e) {
            
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
