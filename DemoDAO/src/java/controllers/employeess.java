/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.DepartmentDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Department;
import models.Employee;

/**
 *
 * @author black
 */
@WebServlet(name = "employeess", urlPatterns = {"/employeess"})
public class employeess extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            DepartmentDAO daeo = new DepartmentDAO();
            ArrayList<Department> depts = daeo.getAllDepartments();
            request.setAttribute("depts", depts);
            EmployeeDAO dao = new EmployeeDAO();
            ArrayList<String> pos = dao.getAllPosition();            
            request.setAttribute("positions", pos); 
            RequestDispatcher dispatcher = request.getRequestDispatcher("employ.jsp");
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
        ArrayList<Employee> emp = new ArrayList<>();
        request.setAttribute("empL", emp);
        EmployeeDAO dao = new EmployeeDAO();
        ArrayList<Employee> emp1 = dao.filterEmployee("All", "", "", "", "All", 0);
        request.setAttribute("empL", emp1);
        request.setAttribute("mess", "");
        request.setAttribute("na","");
        request.setAttribute("se", "");
        request.setAttribute("df", "");
        request.setAttribute("dt", "");
        request.setAttribute("po", "");
        request.setAttribute("id", "");
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
        String mess = "";
        String name = request.getParameter("iname");System.out.println(name);
        String sex = request.getParameter("isex");System.out.println(sex);
        String dobf = request.getParameter("idobf");System.out.println(dobf);
        String dobt = request.getParameter("idobt");System.out.println(dobt);              
        String pos = request.getParameter("iposition");System.out.println(pos);
        int deptID = Integer.parseInt(request.getParameter("idepartment"));               
        EmployeeDAO dao = new EmployeeDAO();
        ArrayList<Employee> emp = dao.filterEmployee(sex, dobf, dobt, name, pos, deptID);
        request.setAttribute("empL", emp);
        if(emp.size()>0){
            mess = "";
        } else{
            mess="No employee exist!";
        }
        request.setAttribute("na", name);
        request.setAttribute("se", sex);
        request.setAttribute("df", dobf);
        request.setAttribute("dt", dobt);
        request.setAttribute("po", pos);
        request.setAttribute("id", deptID);
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
