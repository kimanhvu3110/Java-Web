/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.ProductDAO;
import dal.ShipperDAO;
import java.io.IOException;
import java.time.LocalDate;
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
import logic.OrderLogic;
import models.Order;
import models.OrderDetails;
import models.Product;
import models.Shipper;

/**
 *
 * @author black
 */
@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

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
        ShipperDAO dae = new ShipperDAO();
        ArrayList<Shipper> shippers = dae.getAllShippers();
        request.setAttribute("shipper", shippers);
        request.setAttribute("products", proList);
        request.setAttribute("mess", mess);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
        dispatcher.forward(request, response);
        
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
        request.setAttribute("suc", "");
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
        //processRequest(request, response);
        Shipper shipper = new Shipper(Integer.parseInt(request.getParameter("Shipper")));
        Order order = new Order(
                LocalDate.parse(request.getParameter("RequiredDate")), 
                shipper, 
                request.getParameter("ShipName"), 
                request.getParameter("ShipAddress"));
        
        ArrayList<Integer> productIds = getProductInCart(request, response);
        ArrayList<OrderDetails> orderDetailses = new ArrayList<>();
        HttpSession session = request.getSession();
        HashMap<Integer, Integer> products = (HashMap<Integer, Integer>) session.getAttribute("cart");
        ProductDAO dao = new ProductDAO();
        for(Integer productInteger : productIds){            
            Product c = dao.getProductsById(productInteger);
            if(request.getParameter("new"+productInteger) != null){
                String i = "new" + productInteger;
                double newPrice = Double.parseDouble(request.getParameter(i));
                System.out.println(newPrice);
                c.setUnitPrice(newPrice);
            }
            OrderDetails o = new OrderDetails(productInteger, products.get(productInteger), c.getUnitPrice());
            orderDetailses.add(o);
        }
        OrderLogic orderLogic = new OrderLogic(order, orderDetailses);
        orderLogic.insertOrder();
        clearCart(request);
        String mess = "Order successful!";
        request.setAttribute("suc", mess);
        processRequest(request, response);
    }
    
    private void clearCart(HttpServletRequest request){
         HttpSession session = request.getSession();
         HashMap<Integer, Integer> cart = new HashMap<>();
        if(session.getAttribute("cart")!=null)
            session.setAttribute("cart", new HashMap<>());
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
