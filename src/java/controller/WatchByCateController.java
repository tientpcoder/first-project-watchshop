/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.CategoriesDAO;
import dal.DetailDAO;
import dal.ProDuctInfoDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ATM;
import model.Brand;
import model.Categories;
import model.Crystal;
import model.DialShape;
import model.Movement;
import model.Product;
import model.ProductInfo;
import model.Strap;

/**
 *
 * @author tientruong
 */
public class WatchByCateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProDuctInfoDAO pid = new ProDuctInfoDAO();
    CategoriesDAO cd = new CategoriesDAO();
    BrandDAO bd = new BrandDAO();
    DetailDAO dd = new DetailDAO();
    ArrayList<Brand> brands = bd.getBrandsbyID(-1);
    ArrayList<Strap> straps = dd.getStrapbyID(-1);
    ArrayList<Crystal> crystals = dd.getCrystalsbyID(-1);
    ArrayList<Movement> movements = dd.getMovementsbyID(-1);
    ArrayList<DialShape> dialShapes = dd.getDialShapesbyID(-1);
    ArrayList<ATM> atms = dd.getATMbyID(-1);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("Cate"));
        String cbrand = "";
        String cstrap = "";
        String ccrystal = "";
        String cmovement = "";
        String cdialshape = "";
        String catm = "";
        String checked = "";
        //check brand

        String[] brandscheck = request.getParameterValues("brandc");
        if (brandscheck != null) {
            for (String string : brandscheck) {
                if (string != null) {
                    cbrand += string + ",";
                }
            }
        }
        
        cbrand = (cbrand.endsWith(",")) ? cbrand.substring(0, cbrand.length() - 1) : cbrand;
        //check price
        String pf = "";
        String pt = "";
        String cprice = request.getParameter("price");
        if (cprice != null) {
            pf = (cprice.equals("1")) ? "0" : (cprice.equals("2")) ? "2" : (cprice.equals("3")) ? "5" : (cprice.equals("4")) ?"10":"";
            pt = (cprice.equals("1")) ? "2" : (cprice.equals("2")) ? "5" : (cprice.equals("3")) ? "10" : "";
        }
        //check strap
        String[] strapcheck = request.getParameterValues("strap");
        if (strapcheck != null) {
            for (String string : strapcheck) {
                if (string != null) {
                    cstrap += string + ",";
                }
            }
        }
        cstrap = (cstrap.endsWith(",")) ? cstrap.substring(0, cstrap.length() - 1) : cstrap;
        //check crystal

        String[] crystalcheck = request.getParameterValues("crystal");
        if (crystalcheck != null) {
            for (String string : crystalcheck) {
                if (string != null) {
                    ccrystal += string + ",";
                }
            }
        }
        ccrystal = (ccrystal.endsWith(",")) ? ccrystal.substring(0, ccrystal.length() - 1) : ccrystal;

        //check movement
        String[] movementcheck = request.getParameterValues("movement");
        if (movementcheck != null) {
            for (String string : movementcheck) {
                if (string != null) {
                    cmovement += string + ",";
                }
            }
        }
        cmovement = (cmovement.endsWith(",")) ? cmovement.substring(0, cmovement.length() - 1) : cmovement;

        //check dialshape
        String[] dialshapecheck = request.getParameterValues("dialshape");
        if (dialshapecheck != null) {
            for (String string : dialshapecheck) {
                if (string != null) {
                    cdialshape += string + ",";
                }
            }
        }
        cdialshape = (cdialshape.endsWith(",")) ? cdialshape.substring(0, cdialshape.length() - 1) : cdialshape;

        //check atm
        String[] atmcheck = request.getParameterValues("atm");
        if (atmcheck != null) {
            for (String string : atmcheck) {
                if (string != null) {
                    catm += string + ",";
                }
            }
        }
        catm = (catm.endsWith(",")) ? catm.substring(0, catm.length() - 1) : catm;
//paging
        int pagesize = 6;
        String raw_pageindex = request.getParameter("page");
        if (raw_pageindex == null) {
            raw_pageindex = "1";
        }
        int pageindex = Integer.parseInt(raw_pageindex);
        int count = pid.count(cid + "", cbrand, pf, pt, cstrap, ccrystal,
                cmovement, cdialshape, catm);
        int pagecount = (count % pagesize == 0) ? count / pagesize : count / pagesize + 1;
        //set attribute
        ArrayList<ProductInfo> datapro = pid.getAllProductInfoByCondition(cid + "", cbrand, pf, pt, cstrap, ccrystal,
                cmovement, cdialshape, catm);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("pfrom", (pageindex - 1) * pagesize + 1);
        request.setAttribute("pto", (pageindex) * pagesize);
        Categories datacates = cd.getCatebyID(cid);
        request.setAttribute("cid", cid);
        request.setAttribute("datapro", datapro);
        request.setAttribute("brands", brands);
        request.setAttribute("datacates", datacates);
        request.setAttribute("straps", straps);
        request.setAttribute("crystals", crystals);
        request.setAttribute("movements", movements);
        request.setAttribute("dialShapes", dialShapes);
        request.setAttribute("atms", atms);
        request.setAttribute("cbrand", cbrand);
        request.setAttribute("cstrap", cstrap);
        request.setAttribute("ccrystal", ccrystal);
        request.setAttribute("cmovement", cmovement);
        request.setAttribute("cdialshape", cdialshape);
        request.setAttribute("catm", catm);
        request.setAttribute("cprice", cprice);
        request.getRequestDispatcher("WatchByCate.jsp").forward(request, response);
//response.getWriter().print(cbrand);
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
