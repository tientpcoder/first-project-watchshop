/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tientruong
 */
public class AuthenticationController extends HttpServlet {

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
//    ArrayList<User> users = ud.getUsers();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
       request.getRequestDispatcher("login.jsp").forward(request, response);
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
       String email= request.getParameter("email");
       String pass= request.getParameter("pass");
       String remember = request.getParameter("remember");
       ArrayList<User> users = ud.getUserbyemail(email);
         int k=0;   
        if (users.size()>0) {
            User temp=users.get(0);
            if (email.equals(temp.getEmail()) && pass.equals(temp.getPassword())) {
                HttpSession session = request.getSession();
                if(temp.getUser_Role().getId()==2){
                    session.setAttribute("user", temp);
                }
                else session.setAttribute("admin", temp);
                k=temp.getUser_Role().getId();
                if (remember != null) {
                    Cookie cookieUser = new Cookie("email", temp.getEmail());
                    cookieUser.setMaxAge(24 * 3600);
                    Cookie cookiePassword = new Cookie("password", temp.getPassword());
                    cookiePassword.setMaxAge(24 * 3600);
                    response.addCookie(cookieUser);
                    response.addCookie(cookiePassword);
                }
            }
        }
      
               

       if(k==2) response.sendRedirect("home"); //user thi den home
       if(k==1)response.sendRedirect("AdminHome");//admin thi den quan ly
       if(k==0){
           request.setAttribute("issucces","Fail");
           request.getRequestDispatcher("login.jsp").forward(request, response);
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
