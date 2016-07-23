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
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
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
                
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            String form = request.getParameter("form");
            if(form.equals("login")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                PreparedStatement ps = con.prepareStatement("select * from users where emailID = ?");
                ps.setString(1,email);
                ResultSet rs = ps.executeQuery();
                String orginalPassword= "", name = "";
                int userID = 0,isAdmin = 0;
                if(rs.next()) {
                    orginalPassword = rs.getString("password");
                    name = rs.getString("name");
                    isAdmin = rs.getInt("isAdmin");
                    userID = rs.getInt("userID");
                }
                if(orginalPassword.equals(password)) {
                    HttpSession session=request.getSession();
                    session.setAttribute("username",name);
                    session.setAttribute("isAdmin",isAdmin);
                    message.add("success");
                    message.add("You have successfully logged in!");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    session.setAttribute("userID",userID);
                    session.setAttribute("emailID",email);
                    //request.getRequestDispatcher("index.jsp").forward(request,response);
                    response.sendRedirect("index.jsp");
                }else {
                    HttpSession session=request.getSession();
                    message.add("danger");
                    message.add("Invalid email or password");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    //request.getRequestDispatcher("login.jsp").forward(request,response);
                    response.sendRedirect("login.jsp");
                }
                
            } else {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                PreparedStatement ps = con.prepareStatement("insert into users(name,emailID,password) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,password);
                int userID,n = ps.executeUpdate();
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next() && n==1) {
                    userID = generatedKeys.getInt(1);
                    HttpSession session=request.getSession();
                    session.setAttribute("username",name);
                    session.setAttribute("isAdmin",0);
                    session.setAttribute("userID",userID);
                    session.setAttribute("emailID",email);
                    message.add("success");
                    message.add("You have successfully signed in!");
                    messages.add(message);
                    session.setAttribute("messages",messages);
                    //request.getRequestDispatcher("index.jsp").forward(request,response);
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }
            }
        } catch(Exception e) {
            System.err.println(e);
            //System.out.println(dbUrl);
            HttpSession session=request.getSession();
            message.add("danger");
            message.add("Email already in use!");
            messages.add(message);
            session.setAttribute("messages",messages);
            //request.getRequestDispatcher("login.jsp").forward(request,response);
            //response.sendRedirect("login.jsp");
            out.print(e);
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
