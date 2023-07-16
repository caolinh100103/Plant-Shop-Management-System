/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CategoryDAO;
import DAO.PlantDAO;
import basicobjects.Category;
import basicobjects.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.NaN;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author linh1
 */
public class UpdatedPlantServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            Plant p = PlantDAO.getPlant(id);
            int price;
            if (request.getParameter("newPrice").isEmpty()) {
                price = p.getCheck();
            }    
            else {
                price = Integer.parseInt(request.getParameter("newPrice"));
            }
            String imgPath = request.getParameter("newImgPath").isEmpty() ? p.getImgPath() : request.getParameter("newImgPath");
            String des = request.getParameter("newDescription").isEmpty() ? p.getDescription() : request.getParameter("newDescription");
            String pName = request.getParameter("newName").isEmpty() ? p.getPName() : request.getParameter("newName");
            int status = request.getParameter("newStatus").isEmpty() ? p.getStatus() : Integer.parseInt(request.getParameter("newStatus"));
            int cateID = request.getParameter("Category").isEmpty() ? p.getCateID() : Integer.parseInt(request.getParameter("Category"));
            int kq = PlantDAO.updatePlant(id, pName, price, imgPath, des, status, cateID);
            ArrayList<Category> listCate = CategoryDAO.getAllCategories();
            if (kq > 0) {
                Plant plant = PlantDAO.getPlant(id);
                request.setAttribute("categories", listCate);
                request.setAttribute("MSG", "Updated successfully!!!");
                request.setAttribute("plant", plant);
                request.getRequestDispatcher("UpdatePlant.jsp").forward(request, response);
            }
            
        }catch (Exception e) {
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
