package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dal.ContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;

/**
 *
 * @author tientruong
 */
public class ShopContact extends BaseRequiredLoginController_ad {
    ContactDAO cd = new ContactDAO();
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Contact con = cd.getContact();
        request.setAttribute("contact",con);
        request.getRequestDispatcher("Contact.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String hotline = request.getParameter("hotline");
        String email = request.getParameter("email");
        String fb = request.getParameter("fb");
        String yt = request.getParameter("yt");
        String map = request.getParameter("map");
        Contact c = new Contact();
        c.setName(name);
        c.setAddress(address);
        c.setHotline(hotline);
        c.setEmail(email);
        c.setFb(fb);
        c.setYt(yt);
        c.setMap(map);
        cd.update(c);
        processGet(request, response);
        
    }

}
