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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anil
 */
public class addToCart extends HttpServlet {

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
            out.println("<title>Servlet addToCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToCart at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
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
                
                int itemID = Integer.parseInt(request.getParameter("itemID"));
                out.println( " f");
                int userID = (int) session.getAttribute("userID");
                int quan =  Integer.parseInt(request.getParameter("quantity"));
                
                PreparedStatement ps = con.prepareStatement("select ID,item, quantity,total from cart where userID = ? and itemID = ?");
                ps.setInt(1,userID);
                ps.setInt(2, itemID);
                ResultSet rs = ps.executeQuery();
                int checkIfRs = 0;
                String strMsg = "";
                if(rs.next()) {
                    checkIfRs = 1;
                    int ID = rs.getInt("ID");
                    int quantity = rs.getInt("quantity");
                    int total = rs.getInt("total");
                    String item = rs.getString("item");
                    rs.close();
                    int newTotal = total + quan*(total/quantity);
                    quantity += quan;
                    ps = con.prepareStatement("update cart set quantity = ?,total = ? where ID = ?");
                    ps.setInt(1, quantity);
                    ps.setInt(2, newTotal);
                    ps.setInt(3, ID);
                    ps.executeUpdate();
                    strMsg = item + " added to the cart!";
                    
                }
                    
                
                
                if(checkIfRs == 0) {
                    rs.close();
                    ps = con.prepareStatement("select item,price from items where itemID = ?");
                    ps.setInt(1, itemID);
                    ResultSet rS = ps.executeQuery();
                    rS.next();
                    String price = rS.getString("price");
                    String item = rS.getString("item");
                    String actualPrice = price.split("/")[0];
                    int totalPrice =quan * Integer.parseInt(actualPrice);

                    ps = con.prepareStatement("insert into cart(userID,itemID,item,price,quantity,total) values(?,?,?,?,?,?)");
                    ps.setInt(1, userID);
                    ps.setInt(2, itemID);
                    ps.setString(3,item);
                    ps.setString(4,actualPrice);
                    ps.setInt(5,quan);
                    ps.setInt(6,totalPrice);
                    ps.executeUpdate();
                    rS.close();
                    strMsg = item + " added to the cart!";
                }   
                    
                    con.close();
                    String submit = request.getParameter("submit");
                    if(submit.equals("Buy Now")) {
                        response.sendRedirect("cart?step=1");
                    } else {
                        message.add("success");
                        message.add(strMsg);
                        messages.add(message);
                        session.setAttribute("messages",messages);
                        response.sendRedirect("index.jsp");
                    }
            } catch(Exception e) {
                out.print(e);
            }
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
