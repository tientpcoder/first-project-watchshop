/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tientruong
 */
public class UserInfoController extends BaseRequiredLoginController {

    User acc2 = new User();
    String issuc1 = "";
     String issuc2="";
    UserDAO ud = new UserDAO();
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("user");
        acc2 = acc;
        request.setAttribute("issuc1", issuc1);
        request.setAttribute("issuc2", issuc2);
        request.setAttribute("user", acc2);
        request.getRequestDispatcher("Profile.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String formtype = request.getParameter("formtype");
        if (formtype.equals("1")) {
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String newpassconfirm = request.getParameter("newpassconfirm");
            int id = Integer.parseInt(request.getParameter("ID"));
            issuc1 = check(oldpass, newpass, newpassconfirm);
            ud.changepass(id, newpass);
            processGet(request, response);
            issuc1="";
        } else {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            issuc2 = "Thay Đổi Thông Tin Thành Công !!!";
            int id = Integer.parseInt(request.getParameter("ID"));
            ud.changeinfo(id, name, phone, address);
            acc2.setName(name);
            acc2.setPhone(phone);
            acc2.setAddress(address);
            processGet(request, response);
            issuc2="";
        }
    }

    String check(String oldp, String newp, String confirm) {

        if (!oldp.equals(acc2.getPassword())) {
            return "Sai Mật Khẩu";
        }
        if (!newp.equals(confirm)) {
            return "Sai Xác Thực Mật Khẩu Mới";
        }
        return "Đổi Mật Khẩu Thành Công!!!";

    }
}
