/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author black
 */
@WebServlet(name = "logUp", urlPatterns = {"/logUp"})
public class logUp extends HttpServlet {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
        request.setAttribute("unameB", "");
        request.setAttribute("passB", "");
        request.setAttribute("emailB", "");
        request.setAttribute("mess", "");
        request.setAttribute("mess1", "");
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
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String mess = "";
        String mess1 = "";
        UserDAO dao = new UserDAO();
        int checkName = dao.checkUser(username.toLowerCase());
        int checkMail = dao.checkMail(email.toLowerCase());
        if(checkName > 0){
            mess = "Username đã tồn tại. Vui lòng tạo tên khác ";
        }else{
            if(checkMail > 0){
                mess = "Email đã tồn tại. Hãy kiểm tra lại email";
            }else{
                dao.insertNewUser(username, pass, email);
                mess1 = "Đăng ký thành công ! Mời đăng nhập ";
            }
        }
        request.setAttribute("unameB", username);
        request.setAttribute("passB", pass);
        request.setAttribute("emailB", email);
        request.setAttribute("mess", mess);
        request.setAttribute("mess1", mess1);
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
