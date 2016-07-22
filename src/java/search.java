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
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anil
 */
public class search extends HttpServlet {

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
            out.println("<title>Servlet search</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        Path currentRelativePath = Paths.get("");
        String path = currentRelativePath.toAbsolutePath().toString();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("jdbc:sqlite:");
        stringBuilder.append(path);
        stringBuilder.append("/palacharakkukada.db");
        String dbUrl = stringBuilder.toString();
        ArrayList<HashMap<String,String>> searchResults = new ArrayList<HashMap<String,String>>();
        HashMap<String,String> product;
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            String search = request.getParameter("search");
            PreparedStatement ps = con.prepareStatement("select * from items where type like ?");
            ps.setString(1, search);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                product = new HashMap<String,String>();
                product.put("itemID",rs.getInt("itemID")+"");
                product.put("item", rs.getString("item"));
                product.put("type",rs.getString("type"));
                product.put("brand",rs.getString("brand"));
                product.put("price",rs.getString("price"));
                product.put("stock",rs.getString("stock"));
                product.put("image",rs.getString("image"));
                searchResults.add(product);
                out.println(product.get("name"));
            }
            if(searchResults.size() != 0)
                request.setAttribute("searchResults",searchResults);
            request.setAttribute("searchKey",search);
            request.getRequestDispatcher("search.jsp").forward(request,response);
        } catch(Exception e) {
            System.err.println(e);
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
