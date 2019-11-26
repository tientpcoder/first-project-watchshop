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
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author tientruong
 */
public class EditProduct extends BaseRequiredLoginController_ad {

    BrandDAO bd = new BrandDAO();
    DetailDAO dd = new DetailDAO();
    ArrayList<Brand> brands = bd.getBrandsbyID(-1);
    ArrayList<Strap> straps = dd.getStrapbyID(-1);
    ArrayList<Crystal> crystals = dd.getCrystalsbyID(-1);
    ArrayList<Movement> movements = dd.getMovementsbyID(-1);
    ArrayList<DialShape> dialShapes = dd.getDialShapesbyID(-1);
    ArrayList<ATM> atms = dd.getATMbyID(-1);
    ProDuctInfoDAO pind = new ProDuctInfoDAO();
    CategoriesDAO cd = new CategoriesDAO();

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String proid = request.getParameter("pid");
        ArrayList<Categories> cates = cd.getCate();
        ProductInfo p = pind.getProductInfosByID(proid);
        request.setAttribute("pin", p);
        request.setAttribute("cates", cates);
        request.setAttribute("brands", brands);
        request.setAttribute("straps", straps);
        request.setAttribute("crystals", crystals);
        request.setAttribute("movements", movements);
        request.setAttribute("dialShapes", dialShapes);
        request.setAttribute("atms", atms);
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        String pid = request.getParameter("pid");
//        String pname = request.getParameter("pname");
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        BigDecimal price = new BigDecimal(request.getParameter("price"));
//        int cid = Integer.parseInt(request.getParameter("cateid"));
//        int bid = Integer.parseInt(request.getParameter("bid"));
//        int strapid = Integer.parseInt(request.getParameter("strapid"));
//        int crysid = Integer.parseInt(request.getParameter("crysid"));
//        int moveid = Integer.parseInt(request.getParameter("moveid"));
//        int dsid = Integer.parseInt(request.getParameter("dsid"));
//        int dialsize = Integer.parseInt(request.getParameter("dialsize"));
//        int dialthick = Integer.parseInt(request.getParameter("dialthick"));
//        int discount = Integer.parseInt(request.getParameter("discount"));
//        int atmid =Integer.parseInt(request.getParameter("atmid"));
//        String Description = request.getParameter("Description");
//        String oldimg = request.getParameter("oldimage");
//        String img = request.getParameter("image");
//        if (img==null||img.equals("")) {
//            img=oldimg;
//        }
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<String> dh = new ArrayList<>();
        dh.clear();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File("C:\\NetBeansProjects\\Asign\\web\\image" + File.separator + name));        
                            dh.add(name);
                    } else {
                        String value = item.getString("UTF-8");
                        dh.add(value);
                    }
                }
            } catch (Exception ex) {
                response.getWriter().println("File Upload Failed due to " + ex.toString());
            }
        }
        ProductInfo x = pind.getProductInfosByID(dh.get(0));
        x.getProduct().setName(dh.get(1));
        x.getProduct().setQuantity(Integer.parseInt(dh.get(2)));
        x.getProduct().setPrice(new BigDecimal(dh.get(3)));
        x.getProduct().setDiscount(Integer.parseInt(dh.get(4)));
        x.getProduct().getCate().setId(Integer.parseInt(dh.get(5)));
        x.getProduct().getBrand().setId(Integer.parseInt(dh.get(6)));
        x.getStrap().setId(Integer.parseInt(dh.get(7)));
        x.getCrystal().setId(Integer.parseInt(dh.get(8)));
        x.getMovement().setId(Integer.parseInt(dh.get(9)));
        x.getDialShape().setId(Integer.parseInt(dh.get(10)));
        x.setDial_size(Integer.parseInt(dh.get(13)));
        x.setDial_thickness(Integer.parseInt(dh.get(12)));
        x.getAtm().setId(Integer.parseInt(dh.get(11)));
        x.getProduct().setDescription(dh.get(14));
        if (dh.size()==16) {
            x.getProduct().setImage(dh.get(15));
        }
        pind.updateproduct(x);
        response.sendRedirect("EditProduct?pid="+x.getProduct().getId());
    }

}
