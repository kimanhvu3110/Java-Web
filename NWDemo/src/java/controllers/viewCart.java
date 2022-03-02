/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Category;
import models.Product;

/**
 *
 * @author black
 */
@WebServlet(name = "viewCart", urlPatterns = {"/viewCart"})
public class viewCart extends HttpServlet {

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
        ArrayList<Integer> proID = getProductInCart(request, response);
        String mess ;
        ArrayList<Product> proList = new ArrayList<>();
        if(proID == null || proID.size()==0) mess = "No product in cart";
        else {
            mess = "List of products in cart";       
            ProductDAO dao = new ProductDAO();
            proList = dao.getProducts(proID);
        }
        request.setAttribute("products", proList);
        request.setAttribute("mess", mess);
        loadCategories(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewcart.jsp");
        dispatcher.forward(request, response);
    }
    
     private void loadCategories(HttpServletRequest request, HttpServletResponse response){
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> c = dao.getAllCategories();
        request.setAttribute("cats", c);
    }
     
     private ArrayList<Integer> getProductInCart(HttpServletRequest request, HttpServletResponse response){
        HashMap<Integer, Integer> products = new HashMap<>();
        ArrayList<Integer> list = new ArrayList<>();
        HttpSession session = request.getSession();
        if(session.getAttribute("cart")!=null)
        {
            products = (HashMap<Integer, Integer>) session.getAttribute("cart");
            Set<Integer> keySet = products.keySet();
            for(Integer key: keySet){
                list.add(key);
            }
        }       
        return list;
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
