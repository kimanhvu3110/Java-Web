/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.UserDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author black
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
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
        String username = request.getParameter("userLog");
        String pass = request.getParameter("passLog");
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        String mess = "";
        Boolean check = null;
        HashMap<Integer, Account> map = dao.getAllAccount();
        for (Map.Entry<Integer, Account> entry : map.entrySet()) {
            if (username.equalsIgnoreCase(entry.getValue().getUsername())) {
                if (pass.equals(entry.getValue().getPassword())) {
                    check = true;
                    session.setAttribute("account", new Account(username, pass));
                    session.setAttribute("Uid", entry.getKey());
                    session.setAttribute("emailS", entry.getValue().getEmail());
                    session.setMaxInactiveInterval(60 * 60 * 24 * 30);//7 days
                    break;
                } else {
                    check = false;
                }
            } else {
                check = false;
            }
        }
        if (check == true) {
            if (session.getAttribute("urlC") != null) {
                response.sendRedirect(session.getAttribute("urlC").toString());
                session.removeAttribute("urlC");
            } else {
                response.sendRedirect("Home");
            }

        } else {
            mess = "Username hoặc password đã sai. Vui lòng thử lại";
            request.setAttribute("acc", new Account(username, pass));
            request.setAttribute("mess", mess);
            processRequest(request, response);
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
