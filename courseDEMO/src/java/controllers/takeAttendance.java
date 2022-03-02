/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dal.courseDAO;
import dal.rollDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.RollCall;
import models.Student;
import models.Teaching;

/**
 *
 * @author black
 */
@WebServlet(name = "takeAttendance", urlPatterns = {"/takeAttendance"})
public class takeAttendance extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String mess23 = "";
  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if (request.getParameter("tid") != null) {
            String nextPage = "";
            int teachId = Integer.parseInt(request.getParameter("tid"));
            String iname = request.getParameter("iname");
            String sc = request.getParameter("sc");
            String cc = request.getParameter("cc");
            int sid = Integer.parseInt(request.getParameter("sid"));
            rollDAO dao = new rollDAO();
            Teaching a = dao.getTeachByid(teachId);
            int courseId = a.getCourse().getCourseId();
            int slot = a.getSlot();
            int room = a.getRoomID();
            String date = a.getTeachDate();
            request.setAttribute("ti", teachId);
            request.setAttribute("cc", cc);
            request.setAttribute("si", sid);
            request.setAttribute("mess23", mess23);
            request.setAttribute("ianme", iname);
            request.setAttribute("subName", sc);
            request.setAttribute("slot", slot);
            request.setAttribute("romm", room);           
            request.setAttribute("date", date);
            request.setAttribute("ci", courseId);
            String mess45 = "";
            if (dao.CountScheID(teachId) != 0) {                
                ArrayList<RollCall> list = dao.getAllRoll(teachId);
                request.setAttribute("listR", list);                
                nextPage = "takeRoll.jsp";
            } else {
               
                ArrayList<Integer> ab = dao.getAllStuID(courseId);
                ArrayList<Student> ac = dao.getAllStudentinSlot(ab);
                request.setAttribute("listS", ac);               
                nextPage = "takeRoll2.jsp";
            }            
            RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
            mess23 = "";
        } else {
            String nextPage = "attend.jsp";
            String mess = "";
            try {
                courseDAO dao = new courseDAO();
                int courseId = Integer.parseInt(request.getParameter("cid"));
                String iname = request.getParameter("iname");
                int idSUb = Integer.parseInt(request.getParameter("sid"));
                String subCode = request.getParameter("sub");
                ArrayList<Teaching> list = dao.getAllSlot(courseId);
                String courseCode = list.get(0).getCourse().getCourseCode();
                if (list == null || list.size() == 0) {
                    mess = "No attendance this course";
                } else {
                    mess = "List of slots study";
                }
                request.setAttribute("listT", list);
                request.setAttribute("mess2", mess);
                request.setAttribute("cc", courseCode);
                request.setAttribute("ianme", iname);
                request.setAttribute("subName", subCode);
                request.setAttribute("subID", idSUb);
            } catch (NumberFormatException e) {
                nextPage = "error.html";
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
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
        String mess = "";
        mess23 = "";
        int teachId = Integer.parseInt(request.getParameter("tid"));
        rollDAO dao = new rollDAO();
        Teaching a = dao.getTeachByid(teachId);
        int courseId = a.getCourse().getCourseId();
        if (dao.CountScheID(teachId) != 0) {
            ArrayList<RollCall> list = dao.getAllRoll(teachId);
            ArrayList<Integer> listnot = new ArrayList<>();
            ArrayList<Integer> listyes = new ArrayList<>();
            for (RollCall p : list) {
                String isAbsent = request.getParameter("check" + p.getId());
                System.out.println(isAbsent);
                String comment = request.getParameter("comment" + p.getId());
                System.out.println(comment);
                if (isAbsent.equals("true")) {
                    listyes.add(p.getId());
                } else {
                    listnot.add(p.getId());
                }
                if (comment.equals("") == false) {
                    dao.getTComment(comment, p.getId());
                }
            }
            dao.editAttendAbs(listyes, teachId);
            dao.editAttendnotAbs(listnot, teachId);
            mess23 = "Change attendance successful!";
        } else {
            ArrayList<Integer> ab = dao.getAllStuID(courseId);
            ArrayList<Student> ac = dao.getAllStudentinSlot(ab);
            for (Student p : ac) {
                Boolean abs;
                int stuId = p.getId();
                String isAbsent = request.getParameter("check" + p.getId());
                if (isAbsent.equals("true")) {
                    abs = true;
                } else {
                    abs = false;
                }
                Student s = new Student(stuId);
                String comment = request.getParameter("comment" + p.getId());
                System.out.println(teachId);
                RollCall roll = new RollCall(s, abs, comment ,teachId);                              
                int temp = dao.getLastId();
                temp = temp+1;
                dao.insertRollCall(roll, temp);                               
            }
            mess23 = "Take attendance successful!";
        }
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
