/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProDuctInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderLine;
import model.ProductInfo;

/**
 *
 * @author tientruong
 */
public class Cart extends HttpServlet {

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
    int k=0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("them", k);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Order order = (Order) request.getSession().getAttribute("cart");
        if (order == null) {
            order = new Order();
        }
        String pid = request.getParameter("pid");
        ProDuctInfoDAO pd = new ProDuctInfoDAO();
        ProductInfo product = pd.getProductInfosByID(pid);
        boolean isExist = false;
        for (OrderLine line : order.getLines()) {
            if (line.getProduct().getId().equals(product.getProduct().getId())) {
                line.setQuantity(line.getQuantity() + 1);
                isExist = true;
                break;
            }
        }
        if (!isExist) {
            OrderLine line = new OrderLine();
            line.setProduct(product.getProduct());
            line.setOrder(order);
            line.setPrice(product.getProduct().getPrice());
            line.setQuantity(1);
            order.getLines().add(line);

        }
        k=1;
        String name = product.getProduct().getName();
        String id = product.getProduct().getId();
        request.setAttribute("name", name);
        request.setAttribute("id", id);
        request.getSession().setAttribute("cart", order);
        doGet(request, response);
        k=0;
//response.getWriter().print(product.getProduct().getName());
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
