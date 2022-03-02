/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.subjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Subject;

/**
 *
 * @author black
 */
@WebServlet(name = "subjects", urlPatterns = {"/subjects"})
public class subjects extends HttpServlet {
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
        try (PrintWriter out = response.getWriter()) {
        try{
            if (request.getParameter("page") != null)
                index = Integer.parseInt(request.getParameter("page"));            
        }
        catch (Exception e)
        {
            index=1;
        }
           subjectDAO dao = new subjectDAO();
           ArrayList<Subject> a = dao.getAllSubjects(index);
           int total = dao.getTotalSubjects();
           int nbPage = total/20;
           if(total%20 != 0) nbPage = nbPage + 1;
           System.out.println(nbPage);
           request.setAttribute("nbPage", nbPage);
           request.setAttribute("list", a);
           request.setAttribute("tol", total);
           request.setAttribute("cpage", index);
           RequestDispatcher dispatcher = request.getRequestDispatcher("course.jsp");
           dispatcher.forward(request, response);
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
        String search = request.getParameter("search").toString();
        subjectDAO dao = new subjectDAO();
        ArrayList<Subject> list = new ArrayList<>();
           list = dao.getSubjectsFind(search);
           int total = list.size();
           int nbPage = 0;          
           System.out.println(nbPage);
           request.setAttribute("nbPage", nbPage);
           request.setAttribute("list", list);
           request.setAttribute("tol", total);
           request.setAttribute("cpage", index);
           RequestDispatcher dispatcher = request.getRequestDispatcher("course.jsp");
           dispatcher.forward(request, response);
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
