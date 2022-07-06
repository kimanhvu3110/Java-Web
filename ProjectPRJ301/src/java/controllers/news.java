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
@WebServlet(name = "news", urlPatterns = {"/news"})
public class news extends HttpServlet {

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
        String tCheck = "";
        int tempID = 0;
        if (request.getParameter("id") == null) {
            nextPage = "Home";
        } else {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                nextPage = "news.jsp";
                newsDAO deo = new newsDAO();
                News a = deo.getNewsById(id);
                System.out.println("ab");
                HttpSession session = request.getSession();
                if(session.getAttribute("Uid")!=null){
                   tempID = Integer.parseInt(session.getAttribute("Uid").toString());
                }
                Account temp = (Account)session.getAttribute("account");
                System.out.println("abvd");
                if(temp!=null){
                    int check = deo.checkSaved(tempID, id);
                    System.out.println(temp.getId());
                    System.out.println(id);
                    if(check > 0) {
                        tCheck = "yes";
                        System.out.println("abdhfgh");
                    }
                }
                CategoryDAO dao = new CategoryDAO();
                ArrayList<Category> listA = dao.getAllCategoriesNo1();
                ArrayList<Category> listB = dao.getAllCategoriesNo2();
                request.setAttribute("listCate", listA);
                request.setAttribute("listCa", listB);
                request.setAttribute("currentNew", a);
                request.setAttribute("checkSave", tCheck);
                request.setAttribute("idNew",id);
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
