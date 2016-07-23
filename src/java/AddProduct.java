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
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
                
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            String item = request.getParameter("item");
            String type = request.getParameter("type");
            String brand = request.getParameter("brand");
            String price = request.getParameter("price");
            String image = request.getParameter("image");
            int stock = Integer.parseInt(request.getParameter("stock"));
            out.println(item);
            out.println(type);
            out.println(brand);
            out.println(price);
            out.println(stock);
            out.println(image);
            PreparedStatement ps = con.prepareStatement("insert into items(item,type,brand,price,stock,image) values(?,?,?,?,?,?)");
            ps.setString(1, item);
            ps.setString(2, type);
            ps.setString(3,brand);
            ps.setString(4, price);
            ps.setInt(5, stock);
            ps.setString(6,"static/images/"+image);
            ps.executeUpdate();
            HttpSession session = request.getSession();
            message.add("success");
            message.add("New item added!");
            messages.add(message);
            session.setAttribute("messages",messages);
            response.sendRedirect("admin");
        } catch(Exception e) {
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
