/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.CategoryDAO;
import dal.newsDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Account;
import models.Category;
import models.News;

/**
 *
 * @author black
 */
@WebServlet(name = "myWall", urlPatterns = {"/myWall"})
public class myWall extends HttpServlet {

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
        HttpSession session = request.getSession();
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> listA = dao.getAllCategoriesNo1();
        ArrayList<Category> listB = dao.getAllCategoriesNo2();
        request.setAttribute("listCate", listA);
        request.setAttribute("listCa", listB);
        Account a = (Account) session.getAttribute("account");
        String mess = "Các bài đã lưu";
        newsDAO deo = new newsDAO();
        int i = Integer.parseInt(session.getAttribute("Uid").toString());
        ArrayList<Integer> listId = deo.getSavedNewsId(i);
        ArrayList<News> listNews = deo.getSavedNews(listId);
        if (listNews.size() == 0) {
            mess = "Không có bài lưu";
        }
        request.setAttribute("listOne", listNews);
        request.setAttribute("mess", mess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("myWall.jsp");
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
