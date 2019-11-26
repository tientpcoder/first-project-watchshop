/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProDuctInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductInfo;

/**
 *
 * @author tientruong
 */
public class QuanLySanPham extends BaseRequiredLoginController_ad {
    
    ProDuctInfoDAO pd = new ProDuctInfoDAO();
    ArrayList<ProductInfo> pis = pd.getAllProductInfo();

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String pid_raw = request.getParameter("pid");
        String pid = (pid_raw==null)?"":pid_raw;
        pis = pd.getAllProductInfoPIDContain(pid);        
        int pagesize = 10;
        String raw_pageindex = request.getParameter("page");
        if (raw_pageindex == null) {
            raw_pageindex = "1";
        }
        int pageindex = Integer.parseInt(raw_pageindex);
        int count = pd.countPIDContain(pid);
        int pagecount = (count % pagesize == 0) ? count / pagesize : count / pagesize + 1;
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("pfrom", (pageindex - 1) * pagesize + 1);
        request.setAttribute("pto", (pageindex) * pagesize);
        request.setAttribute("PiList", pis);
        request.setAttribute("pid",pid);
        request.getRequestDispatcher("QuanLySanPham.jsp").forward(request, response);
    }
    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (ProductInfo pi : pis) {
            String s =request.getParameter("status" + pi.getProduct().getId());
            if (s==null) {
                pd.setstatus(pi.getProduct().getId(),false);
            }
            else
                pd.setstatus(pi.getProduct().getId(),true);
        }
        doGet(request, response);
        
    }
    
}
