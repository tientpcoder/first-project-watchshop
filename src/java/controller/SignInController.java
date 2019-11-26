/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import model.UserRole;

/**
 *
 * @author tientruong
 */
public class SignInController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserDAO ud = new UserDAO();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String passcf = request.getParameter("passcf");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        email = (email == null) ? "" : email;
        pass = (pass == null) ? "" : pass;
        passcf = (passcf == null) ? "" : passcf;
        name = (name == null) ? "" : name;
        phone = (phone == null) ? "" : phone;
        address = (address == null) ? "" : address;
        String result = "";
        ArrayList<User> us = ud.getUserbyemail(email);
        if (!email.equals("") && !pass.equals("") && !name.equals("") && !phone.equals("") && !address.equals("")) {
            if (us.size()==0) {
                if (pass.equals(passcf)) {
                    User temp = new User();
                    temp.setEmail(email);
                    temp.setName(name);
                    temp.setPassword(pass);
                    temp.setPhone(phone);
                    temp.setAddress(address);
                    temp.setCreated(Date.valueOf(java.time.LocalDate.now()));
                    UserRole ur = new UserRole();
                    ur.setId(2);
                    temp.setUser_Role(ur);
                    //ud.signin(temp);
                    result = "Đăng Ký Thành Công!";
                    email = "";
                    pass = "";
                    passcf = "";
                    name = "";
                    phone = "";
                    address = "";
                } else {
                    result = "Xác Nhận Mật Khẩu sai!";
                    pass = "";
                    passcf = "";
                }
            } else {
                result = "Email Đã Tồn Tại!";
                pass = "";
                passcf = "";
            }
        }

        request.setAttribute("email", email);
        request.setAttribute("pass", pass);
        request.setAttribute("passcf", passcf);
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("result", result);
        request.getRequestDispatcher("signin.jsp").forward(request, response);
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
