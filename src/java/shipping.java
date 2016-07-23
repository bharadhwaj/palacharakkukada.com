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
public class shipping extends HttpServlet {

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
            out.println("<title>Servlet shipping</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shipping at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String pin = request.getParameter("pin");
            String phone = request.getParameter("phone");
            PreparedStatement ps = con.prepareStatement("insert into shipping_details(userID,name,emailID,address,pin,phone) values(?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            int userId = (int) session.getAttribute("userID");
            ps.setInt(1,userId);
            ps.setString(2,name);
            ps.setString(3,email);
            ps.setString(4,address);
            ps.setString(5,pin);
            ps.setString(6,phone);
            int shippingID = 0,n = ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next() && n==1) {
                    shippingID = generatedKeys.getInt(1);                    
            }
            generatedKeys.close();
            ps = con.prepareStatement("select item from cart where userID = ?");
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> shippedItems = new ArrayList<String>();
            while(rs.next()) {
                shippedItems.add(rs.getString("item"));
            }
            rs.close();
            ps = con.prepareStatement("delete from cart where userID = ?");
            ps.setInt(1,userId);
            ps.executeUpdate();
            request.setAttribute("shippingID", "PK" + userId + shippingID);
            request.setAttribute("shippedItems",shippedItems);
            request.getRequestDispatcher("orderconfirm.jsp").forward(request,response);
        } catch (Exception e) {
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
