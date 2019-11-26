package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.User;
import dal.CategoriesDAO;
import java.util.ArrayList;
import model.Categories;
import model.Product;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footers.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <!--        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\">-->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/global.css\">\n");
      out.write("\n");
      out.write("        ");

            String issuccess = (String) request.getAttribute("issucces");
        
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .inputstyle{\n");
      out.write("                outline: none;\n");
      out.write("                border-radius: 25px;\n");
      out.write("                background: #e6e6e6;\n");
      out.write("                padding: 10px 0 10px 15px;\n");
      out.write("                width: 100%;\n");
      out.write("                border:1px solid #e6e6e6;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Notable&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Jomolhari&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/home1.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/all.min.css\">\n");
      out.write("        ");

            CategoriesDAO cd = new CategoriesDAO();
            ArrayList<Categories> cx = cd.getCate();
        
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .user{\n");
      out.write("                color: white; \n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .user:hover{\n");
      out.write("                color: white; \n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("            #brand:hover{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            #gio:hover{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"bg-dark fixed-top\" style=\"height: 50px;\">\n");
      out.write("            <div class=\"container\" style=\"line-height:47px\">\n");
      out.write("                <a id=\"brand\" style=\"font-family: 'Notable', sans-serif; font-size: 20px; color: whitesmoke;\" href=\"home\">Rabbit </a>\n");
      out.write("                <input placeholder=\"Search...\" type=\"text\" size=\"50\" style=\"outline:none;line-height: 0;margin-left:16%;border:2px solid black;position: absolute;top: 9px;padding: 6px; border-radius: 20px;padding-left: 20px \">\n");
      out.write("                <i  class=\"fas fa-search\" style=\"max-height: 100%;margin-left: -15px;border-left: 1px solid black;padding: 0 0 0 10px;position: absolute;left: 61.7%;top: 18px;\"></i>\n");
      out.write("                <a id=\"gio\" href=\"Cart\" class=\"fas fa-shopping-cart\" style=\"position:absolute;left: 75%;top:25%;font-size: 30px;color: white\"></a>\n");
      out.write("                ");
 if (session.getAttribute("user") == null) {
                
      out.write("\n");
      out.write("                <div style=\"float: right;display:inline;margin-right:-165px\">\n");
      out.write("                    <a href=\"login\" style=\"color: whitesmoke;font-weight: bold\">Đăng Nhập</a> | <a style=\"color: whitesmoke;font-weight: bold\" href=\"signin\">Đăng Ký</a><br/>\n");
      out.write("                </div>\n");
      out.write("                ");
}
                
      out.write("\n");
      out.write("                <!--                <div class=\"btn-group \" style=\"float: right;display:inline\" >\n");
      out.write("                                    <button type=\"button\" class=\"btn btn-secondary dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                        <i class=\"fas fa-user\"></i> &ensp;  \n");
      out.write("                                    </button>\n");
      out.write("                                    <div class=\"dropdown-menu dropdown-menu-right\">\n");
      out.write("                                        <a href=\"Profile\"><button class=\"dropdown-item\" type=\"button\">Thông tin</button></a>\n");
      out.write("                                        <button class=\"dropdown-item\" type=\"button\">Đơn Mua</button>\n");
      out.write("                                        <a href=\"logout\"><button class=\"dropdown-item\" type=\"button\"><i class=\"fas fa-sign-out-alt\"></i> Log Out</button></a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>-->\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            ");
 if (session.getAttribute("user") != null) {
            
      out.write("\n");
      out.write("            <div class=\"btn-group \" style=\"float: right;display:inline;margin-top: -37px;\n");
      out.write("                 margin-right: 40px;\" >\n");
      out.write("                <a href=\"Profile\" class=\"user ml-3\">Thông tin </a>\n");
      out.write("                <a class=\"user ml-3\" href=\"UserOrder\"> Đơn mua </a> \n");
      out.write("                <a class=\"user ml-3\" href=\"logout\"> Đăng xuất </a>\n");
      out.write("            </div>\n");
      out.write("            ");
}
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <!-- navbar -->\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\" style=\"margin-top:55px;color: black;font-weight: bold\">\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                <ul class=\"navbar-nav m-auto\">\n");
      out.write("                    ");
for (Categories elem : cx) {
                    
      out.write("\n");
      out.write("                    <li class=\"nav-item m-auto text-center\" style=\"padding: 0 70px;\">\n");
      out.write("                        <a class=\"nav-link\" href=\"");
      out.print(elem.getLink());
      out.write('"');
      out.write('>');
      out.print(elem.getName().toUpperCase());
      out.write(" </a>\n");
      out.write("                    </li>\n");
      out.write("                    ");
}
                    
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <!-- end navbar -->\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container mt-5\" style=\"height: 480px; width: 800px;border: 1px solid white; border-radius: 10px;box-shadow: 0px 0px 6px 2px rgba(201,199,201,1);\n");
      out.write("             \">           \n");
      out.write("            <div class=\"container mt-5\" style=\"height: 400px; width: 500px;\">\n");
      out.write("                <h1 class=\"mb-5\">Đăng Nhập</h1>\n");
      out.write("                <form method=\"post\" action=\"login\">\n");
      out.write("                    <!--                    <div class=\"form-group\">\n");
      out.write("                                            <input name=\"email\" type=\"email\" class=\"inputstyle\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\">\n");
      out.write("                                        </div>-->\n");
      out.write("                    <div class=\"md-form\">\n");
      out.write("                        <i class=\"fas fa-user prefix\"></i>\n");
      out.write("                        <input type=\"text\" id=\"inputIconEx2\" class=\"form-control\">\n");
      out.write("                        <label for=\"inputIconEx2\">E-mail address</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input name=\"pass\" type=\"password\" class=\"inputstyle\" id=\"exampleInputPassword1\" placeholder=\"Password\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group form-check\">\n");
      out.write("                        <input type=\"checkbox\" class=\"form-check-input mt-4\" id=\"exampleCheck1\">\n");
      out.write("                        <label class=\"form-check-label\" style=\"margin:18px 0;\" for=\"exampleCheck1\">Ghi nhớ mật khẩu</label>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-success mb-3\" style=\"width:100%;border-radius: 25px\">Đăng Nhập</button>\n");
      out.write("                    <p class=\"mt-3 text-center\">Bạn chưa có tài khoản? <a href=\"signin\" >Đăng Ký</a> ngay</p>\n");
      out.write("                </form>\n");
      out.write("                ");
if (issuccess != null) { 
      out.write("\n");
      out.write("                <p class=\"mt-2\" style=\"color: red\">Đăng nhập không thành công! <br> Sai email hoặc mật khẩu </p>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Rabbit Watch</title>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Notable&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Be+Vietnam&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/all.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("<footer style=\"background-color:#000000c2;color: #fffffff7;\">\n");
      out.write("    <div class=\"container text-center mt-5 py-5\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("        <div class=\"col-lg-3 col-md-6 col-12 mt-4 mt-lg-0\">\n");
      out.write("            <i class=\"far fa-clock fa-3x mb-3 pr-2\" style=\"cursor: pointer\"> Rabbit</i><br>\n");
      out.write("            <i class=\"fab fa-facebook-square fa-2x pr-2\" style=\"cursor: pointer\"></i>\n");
      out.write("            <i class=\"fab fa-twitter-square fa-2x pr-2\" style=\"cursor: pointer\"></i>\n");
      out.write("            <i class=\"fab fa-instagram fa-2x pr-2\" style=\"cursor: pointer\"></i>\n");
      out.write("            <i class=\"fab fa-youtube fa-2x\" style=\"cursor: pointer\"></i>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-3 col-md-6 col-12 mt-4 mt-lg-0\">\n");
      out.write("            <h5 style=\"cursor: pointer\">HƯỚNG DẪN</h5>\n");
      out.write("            <p class=\"mt-3\" style=\"cursor: pointer\">Thông Tin Liên Hệ</p>\n");
      out.write("            <p style=\"cursor: pointer\">Hỏi Đáp - Góp Ý</p>\n");
      out.write("            <p style=\"cursor: pointer\">Chính Sách Đổi Hàng</p>\n");
      out.write("            <p style=\"cursor: pointer\">Chính Sách Bảo Hành</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-3 col-md-6 col-12 mt-4 mt-lg-0\">\n");
      out.write("            <h5 style=\"cursor: pointer\">SHOP ĐỒNG HỒ RABBIT</h5>\n");
      out.write("            <p class=\"mt-3\" style=\"cursor: pointer\">Cam kết chính hãng</p>\n");
      out.write("            <p style=\"cursor: pointer\">Liên tục cập nhật</p>\n");
      out.write("            <p style=\"cursor: pointer\">Tư vấn mua hàng</p>\n");
      out.write("            <p style=\"cursor: pointer\">Liên hệ: 0969699669</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-3 col-md-6 col-12 mt-4 mt-lg-0\">\n");
      out.write("            <h5 style=\"cursor: pointer;margin-left: 50px;\">CHỨNG NHẬN</h5>\n");
      out.write("            <i class=\"fas fa-certificate fa-3x mt-3\" style=\"cursor: pointer\"></i><span class=\"ml-3 mb-3\" style=\"display: inline-block;cursor: pointer\"> Đại lý chính thức<br>của các hãng đồng hồ</span><br>\n");
      out.write("            <i class=\"fas fa-comments fa-3x\" style=\"cursor: pointer\"> </i><span class=\"ml-3\" style=\"display: inline-block;cursor: pointer\">Khách hàng nói gì?<br> về chúng tôi</span>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("    </html>");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
