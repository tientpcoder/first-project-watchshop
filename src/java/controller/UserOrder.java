/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.User;

/**
 *
 * @author tientruong
 */
public class UserOrder extends BaseRequiredLoginController
{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int x = user.getId();
        OrderDAO od = new OrderDAO();
        ArrayList<Order> orders =od.getOrderofUser(x);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("UserOrder.jsp").forward(request, response);
        //response.getWriter().print(orders.size());
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

            
}
