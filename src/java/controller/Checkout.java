/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.ProDuctInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderLine;
import model.ProductInfo;
import model.User;

/**
 *
 * @author tientruong
 */
public class Checkout extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkout at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        int purchase = Integer.parseInt(request.getParameter("purchase"));

        Order order = (Order) request.getSession().getAttribute("cart");
        if (purchase == 0) {
            order.setPurchase(false);
        } else {
            order.setPurchase(true);
        }
        order.setName(name);
        order.setAddress(address);
        order.setPhone(phone);
        order.setEmail(email);
        order.setMessage(message);
        User u = new User();
        u.setId(id);
        order.setUser(u);
        OrderDAO ud = new OrderDAO();
        ProDuctInfoDAO pid = new ProDuctInfoDAO();
        ArrayList<String> sphet = new ArrayList<>();
        //neu so luong dat hang > so luong trong kho add ten cac san pham k du hang vao arraylist
        for (OrderLine ol : order.getLines()) {
            ProductInfo pin = pid.getProductInfosByID(ol.getProduct().getId());
            if (pin.getProduct().getQuantity() < ol.getQuantity()) {
                sphet.add(ol.getProduct().getName());
            }
        }
        //neu arraylist rong = du hang
        if (sphet.isEmpty()) {
            //insert order
            ud.insert(order);
            // chinh sua quantity cua san pham
            for (OrderLine ol : order.getLines()) {
                String ID = ol.getProduct().getId();
                ProductInfo pin = pid.getProductInfosByID(ID);
                pid.setnewquan(ID, pin.getProduct().getQuantity()-ol.getQuantity());
            }
            //xoa session
            HttpSession session = request.getSession();
            session.removeAttribute("cart");
            String success = "suc";
            request.setAttribute("success", success);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
        else{
            request.setAttribute("sphet", sphet);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

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
