/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import basicobjects.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author linh1
 */
public class ChangeProfileServlet extends HttpServlet {

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
            int kq = 0;
            User u = null;
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loginUser");
            String email = user.getEmail();
            String password = user.getPassword();
            int status = user.getStatus();
            int role = user.getRole();
            String fullname = request.getParameter("newName");
            String phone = request.getParameter("newPhone");
            int accID = user.getAccID();
            if (fullname.isEmpty() && phone.isEmpty()) {
                request.setAttribute("Error", "You can not leave the both the box text empty");
                request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
            }
            if (fullname.isEmpty()) {
                fullname = user.getFullName();
                kq = UserDAO.updateProfile(fullname, phone, accID);
                if (kq > 0) {
                    u = new User(accID, email, password, fullname, phone, status, role);
                    session.setAttribute("loginUser", u);
                    request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
                }
            }
            if (phone.isEmpty()) {
                phone = user.getPhone();
                kq = UserDAO.updateProfile(fullname, phone, accID);
                if (kq > 0) {
                    u = new User(accID, email, password, fullname, phone, status, role);
                    session.setAttribute("loginUser", u);
                    request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
                }
            } else {
                kq = UserDAO.updateProfile(fullname, phone, accID);
                if (kq > 0) {
                    u = new User(accID, email, password, fullname, phone, status, role);
                    session.setAttribute("loginUser", u);
                    request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
