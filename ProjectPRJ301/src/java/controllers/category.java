/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.CategoryDAO;
import dal.newsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.News;

/**
 *
 * @author black
 */
@WebServlet(name = "category", urlPatterns = {"/category"})
public class category extends HttpServlet {

    private int index = 1;

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
        String nextPage;
        if (request.getParameter("cid") == null) {
            nextPage = "Home";
        } else {
            try {

                if (request.getParameter("page") != null) {
                    index = Integer.parseInt(request.getParameter("page"));
                } else {
                    index = 1;
                }

                int id = Integer.parseInt(request.getParameter("cid"));
                nextPage = "category.jsp";
                newsDAO deo = new newsDAO();
                ArrayList<News> listN = deo.getAllNewsByIdC(index, id);
                CategoryDAO dao = new CategoryDAO();
                int total = dao.getTotalCateById(id);
                int nbPage = total / 2;
                System.out.println(nbPage);
                if (total % 2 != 0) {
                    nbPage = nbPage + 1;
                }
                String nameC = dao.getNameById(id);
                ArrayList<Category> listA = dao.getAllCategoriesNo1();
                ArrayList<Category> listB = dao.getAllCategoriesNo2();
                request.setAttribute("listCate", listA);
                request.setAttribute("listCa", listB);
                request.setAttribute("idC", id);
                request.setAttribute("nameC", nameC);
                request.setAttribute("nbPage", nbPage);
                request.setAttribute("tol", total);
                request.setAttribute("cpage", index);
                request.setAttribute("listNew", listN);
            } catch (Exception ex) {
                nextPage = "error.html";
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
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
