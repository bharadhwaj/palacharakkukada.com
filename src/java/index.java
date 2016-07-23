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
import javax.servlet.http.HttpSession;

/**
 *
 * @author anil
 */
public class index extends HttpServlet {

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
            out.println("<title>Servlet index</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet index at " + request.getContextPath() + "</h1>");
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
        ArrayList<HashMap<String,String>> items = new ArrayList<HashMap<String,String>>();
        HashMap<String,String> item;
        HashMap<String,ArrayList<String>> categories = new HashMap<String,ArrayList<String>>();
        ArrayList<String> categoryItems;
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(dbUrl);
            PreparedStatement ps = con.prepareStatement("select * from items");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String type = rs.getString("type");
                String name = rs.getString("item");
                item = new HashMap<String,String>();
                item.put("itemID",rs.getInt("itemID")+"");
                item.put("item",name);
                item.put("type",type);
                item.put("brand",rs.getString("brand"));
                item.put("price",rs.getString("price"));
                item.put("stock",rs.getString("stock"));
                item.put("image",rs.getString("image"));
                items.add(item);
                //out.println(item.get(0));
                if(categories.get(type) == null) {
                    categoryItems = new ArrayList<String>();
                    categoryItems.add(name);
                    categories.put(type, categoryItems);
                } else if (!categories.get(type).contains(name)){
                    categories.get(type).add(name);
                }
            }
            rs.close();
            HttpSession session=request.getSession();
            session.setAttribute("items",items);
            session.setAttribute("categories", categories);
            response.sendRedirect("index.jsp");
        } catch(Exception e) {
            out.print(e);
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
        processRequest(request, response);
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
