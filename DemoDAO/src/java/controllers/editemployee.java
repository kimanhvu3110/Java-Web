/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.DepartmentDAO;
import dal.EmployeeDAO;
import java.io.IOException;
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
@WebServlet(name = "editemployee", urlPatterns = {"/editemployee"})
public class editemployee extends HttpServlet {

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
        request.setAttribute("mess", "");
        
        String nextPage = "editemployee.jsp";
        try{
        int id = Integer.parseInt(request.getParameter("dip"));
        EmployeeDAO deo = new EmployeeDAO();
        Employee e = deo.getEmployeeById(id);
        DepartmentDAO dao = new DepartmentDAO();
        ArrayList<Department> depts = dao.getAllDepartments();
        request.setAttribute("depts", depts);
        request.setAttribute("employ", e);      
        }
        catch(Exception e){
            nextPage = "error.html";
        }                    
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
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
        String not = "";
       try{
           
        int empID = Integer.parseInt(request.getParameter("eID"));
          
        String empname = request.getParameter("ename");
        
        String sex = request.getParameter("esex");
     
        String position = request.getParameter("eposition");
        
        LocalDate dob = LocalDate.parse(request.getParameter("edob"));
        int deptid = Integer.parseInt(request.getParameter("department1"));  
        System.out.println(deptid);
        Employee e = new Employee(empID, empname, dob, sex, position);  
        e.setDepartment(new Department(deptid));
        EmployeeDAO dao = new EmployeeDAO();
        System.out.println(e.toString());
        dao.editEmployee(e);
        not = "employees?did=" + deptid;
        }
        catch(Exception e){
            not = "error.html";          
        }       
        response.sendRedirect(not);
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
