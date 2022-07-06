/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.CategoryDAO;
import dal.MoonDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import models.MoonKing;

/**
 *
 * @author black
 */
@WebServlet(name = "kinhNguyetCuaToi", urlPatterns = {"/kinhNguyetCuaToi"})
public class kinhNguyetCuaToi extends HttpServlet {

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
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> listA = dao.getAllCategoriesNo1();
        ArrayList<Category> listB = dao.getAllCategoriesNo2();
        request.setAttribute("listCate", listA);
        request.setAttribute("listCa", listB);
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        int uid = Integer.parseInt(session.getAttribute("Uid").toString());
        MoonDAO dod = new MoonDAO();
        ArrayList<Integer> listY = new ArrayList<>();
        listY = dod.getYearofUid(uid);
        int year;
        if (listY.size() == 0) {
            year = LocalDate.now().getYear();
        } else {
            year = listY.get(listY.size() - 1);
        }
        if (request.getParameter("yearBt") != null) {
            year = Integer.parseInt(request.getParameter("yearBt"));
        }
        ArrayList<MoonKing> listK = new ArrayList<>();
        listK = dod.getDateofUid(uid, year);
        request.setAttribute("listK", listK);
        request.setAttribute("listY", listY);
        request.setAttribute("year", year);
        RequestDispatcher dispatcher = request.getRequestDispatcher("kingMoon.jsp");
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
        request.setAttribute("next", "");
        request.setAttribute("nsafe1", "");
        request.setAttribute("nsafe2", "");
        request.setAttribute("safe1", "");
        request.setAttribute("safe2", "");
        request.setAttribute("mess", "");
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
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
        int year = startDate.getYear();
        HttpSession session = request.getSession();
        int uid = Integer.parseInt(session.getAttribute("Uid").toString());
        String mess = "";
        if (endDate.isBefore(startDate)) {
            mess = "Lỗi thời gian chu kỳ";
        } else {
            MoonDAO dao = new MoonDAO();
            dao.insertNewDay(uid, startDate, endDate, year);

            LocalDate next = startDate.plusDays(30);
            LocalDate nsafe1 = endDate.plusDays(4);
            LocalDate nsafe2 = nsafe1.plusDays(5);
            LocalDate safe1 = nsafe2.plusDays(3);
            LocalDate safe2 = safe1.plusDays(10);
            DateTimeFormatter fmt2 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            request.setAttribute("next", next.format(fmt2));
            request.setAttribute("nsafe1", nsafe1.format(fmt2));
            request.setAttribute("nsafe2", nsafe2.format(fmt2));
            request.setAttribute("safe1", safe1.format(fmt2));
            request.setAttribute("safe2", safe2.format(fmt2));
        }
        request.setAttribute("mess", mess);
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
