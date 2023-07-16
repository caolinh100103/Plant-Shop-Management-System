/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author linh1
 */
public class MainController extends HttpServlet {

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
            String action = request.getParameter("action");
            String url = "index.jsp";
            switch(action) {
                case "loginUser":
                    url = "LoginServlet";
                    break;
                case "LogOut":
                    url = "LogOutServlet";
                    break;
                case "registerUser":
                    url = "Register";
                    break;
                case "Search":
                    url = "SearchFlower";
                    break;
                case "plantDetail":
                    url = "DetailPlantServlet";
                    break;
                case "addtocart": 
                    url = "AddToCartServlet";
                    break;
                case "cartDetail":
                    url = "CartDetail.jsp";
                    break;
                case "update":
                    url = "UpdateQuantity";
                    break;
                case "remove plant":
                    url = "RemovingItemInCart";
                    break;
                case "checkout":
                    url = "CheckOutServlet";
                    break;
                case "ViewOrder":
                    url = "ViewOrderServlet";
                    break;
                case "searchByDate":
                    url = "SearchByDateServlet";
                    break;
                case "CancelOrder":
                    url = "CancelOrderServlet";
                    break;
                case "CanceledOrders":
                    url = "CanceledOrders";
                    break;
                case "OrderAgain" :
                    url = "OrderAgainServlet";
                    break;
                case "ChangeProfile":
                    url = "ChangeProfile.jsp";
                    break;
                case "updateProfile":
                    url = "ChangeProfileServlet";
                    break;
                case "manageAccounts":
                    url = "ManageAccountsServlet";
                    break;
                case "searchAccount":
                    url = "SearchAccountsServlet";
                    break;
                case "blockOrunblock":
                    url = "UpdateAccountStatus";
                    break;
                case "ViewOrderOfAccounts":
                    url = "ViewOrderOfAccountsServlet";
                    break;
                case "ManagePlants":
                    url = "ManagePlantsServlet";
                    break;
                case "createPlant":
                    url = "CreatePlantServlet";
                    break;
                case "createNewPlant":
                    url = "createNewPlantServlet";
                    break;
                case "viewPlant":
                    url = "ViewPlantByAdminServlet";
                    break;
                case "updatePlant":
                    url = "UpdatePlantServlet";
                    break;
                case "updatedPlant":
                    url = "UpdatedPlantServlet";
                    break;
                case "ManageCategories":
                    url = "ManageCategoriesServlet";
                    break;
                case "updateCategory":
                    url = "UpdateCategoryServlet";
                    break;
                case "updatedCategory":
                    url = "UpdatedCategoryServlet";
                    break;
                case "createCategory":
                    url =  "CreateCategory.jsp";
                    break;
                case "createdCategory":
                    url = "CreatedCategoryServlet";
                    break;
                case "searchByDateByAdmin":
                    url = "SearchOrdersByAdminServlet";
                    break;
                case "viewAllOrdersOfOne":
                    url = "ViewAllOrdersOfOneServlet";
                    break;
                case "orderDetail":
                    url = "OrderDetailServlet";
                    break;
                case "completeOrder":
                    url = "CompleteOrderServlet";
                    break;
            }
            request.getRequestDispatcher(url).forward(request, response);
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
