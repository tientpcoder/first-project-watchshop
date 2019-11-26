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
import javafx.scene.chart.Axis;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;


/**
 *
 * @author sonnt
 */
public abstract class BaseRequiredLoginController extends HttpServlet {

    
    private boolean isAuthenticated(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        User acc = (User)session.getAttribute("user");
        if(acc != null)
        {
            return true;
        }
        else
        {
            String user = null;
            String pass = null;
            Cookie[] cookies = request.getCookies();
            if(cookies!=null)
            {
                for (Cookie cooky : cookies) {
                    if(cooky.getName().equals("email"))
                        user = cooky.getValue();
                    if(cooky.getName().equals("password"))
                        pass = cooky.getValue();
                    if(user!=null && pass !=null)
                        break;
                }
                if(user!=null && pass!=null)
                {
                        if(user.equals(acc.getEmail())&& pass.equals(acc.getPassword()))
                    {
                        User account = new User();
                        account.setEmail(user);
                        account.setPassword(pass);
                        session.setAttribute("account", account);
                        return true;
                    }
                    
                }
            }
            else
            {
                return false;
            }
            return false;
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
    
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(isAuthenticated(request))
        {
            processGet(request, response);
        }
        else
        {
            response.getWriter().println("Access denied!");
        }
            
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
        if(isAuthenticated(request))
        {
            processPost(request, response);
        }
        else
        {
            response.getWriter().println("Access denied!");
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
