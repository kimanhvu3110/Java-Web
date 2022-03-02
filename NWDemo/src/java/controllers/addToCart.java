/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.DBContext;
import dal.ProductDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;

/**
 *
 * @author black
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
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
        int categoryID = 0;
        int quantity = 1;
        try{
            int productID = Integer.parseInt(request.getParameter("pid"));
            categoryID = Integer.parseInt(request.getParameter("cid"));
            boolean check = true;
            ProductDAO dao = new ProductDAO();
            Product c = dao.getProductsById(productID);
            if(c.getUnitInStock() <= 0 ){
                System.out.println("addd");
            }else{
            HashMap<Integer, Integer> products = getProductInCart(request, response);
            Set<Integer> keySet = products.keySet();
            for(Integer key: keySet){
                if(key == (Integer)productID){
                    Integer temp = products.get(key);
                    temp = temp + 1;
                    products.put(key, temp);
                    check = false;
                    break;
                }
            }
            if(check == true){
            products.put(productID, quantity);  
            }
            HttpSession session = request.getSession();
            session.setAttribute("cart", products);          
        }
        }
        catch(Exception ex){
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("Products?cid="+categoryID);
    }
    
    private HashMap<Integer,Integer> getProductInCart(HttpServletRequest request, HttpServletResponse response){
        HashMap<Integer, Integer> products = new HashMap<>();
        HttpSession session = request.getSession();
        if(session.getAttribute("cart")!=null)
            products = (HashMap<Integer, Integer>) session.getAttribute("cart");
        return products;
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
