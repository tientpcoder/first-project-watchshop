package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Material Design Bootstrap -->\n");
      out.write("        <link href=\"css/mdb.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Your custom styles (optional) -->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- MDBootstrap Datatables  -->\n");
      out.write("        <link href=\"css/datatables.min.css\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            table.dataTable thead .sorting:after,\n");
      out.write("            table.dataTable thead .sorting:before,\n");
      out.write("            table.dataTable thead .sorting_asc:after,\n");
      out.write("            table.dataTable thead .sorting_asc:before,\n");
      out.write("            table.dataTable thead .sorting_asc_disabled:after,\n");
      out.write("            table.dataTable thead .sorting_asc_disabled:before,\n");
      out.write("            table.dataTable thead .sorting_desc:after,\n");
      out.write("            table.dataTable thead .sorting_desc:before,\n");
      out.write("            table.dataTable thead .sorting_desc_disabled:after,\n");
      out.write("            table.dataTable thead .sorting_desc_disabled:before {\n");
      out.write("                bottom: .5em;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"form-check\">\n");
      out.write("    <input type=\"checkbox\" class=\"form-check-input\" id=\"materialUnchecked\">\n");
      out.write("    <label class=\"form-check-label\" for=\"materialUnchecked\">Material unchecked</label>\n");
      out.write("</div>\n");
      out.write("<!--        <table id=\"dtBasicExample\" class=\"table table-striped table-bordered table-sm\" cellspacing=\"0\" width=\"100%\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"th-sm\">ID</th>\n");
      out.write("                    <th class=\"th-sm\">Name</th>\n");
      out.write("                    <th class=\"th-sm\">Ảnh</th>\n");
      out.write("                    <th class=\"th-sm\">Danh Mục</th>\n");
      out.write("                    <th class=\"th-sm\">Hiển Thị</th>\n");
      out.write("                    <th class=\"th-sm\">Số Lượng</th>\n");
      out.write("                    <th class=\"th-sm\">Tác Vụ</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                        <c:set var = \"dem\" scope = \"session\" value = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${0}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                        <c:forEach items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.PiList}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"p\">\n");
      out.write("                            <c:set var = \"dem\" scope = \"session\" value = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${dem+1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                            <c:if test = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${dem >= requestScope.pfrom && dem <= requestScope.pto}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <img style=\"height: 60px;width: 60px;\" src=\"image/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.image}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.cate.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>         \n");
      out.write("                                        <input name=\"status");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" onchange=\"submitForm();\" \n");
      out.write("                                               type=\"checkbox\" ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ (p.product.status eq true)?\"checked\":\"\" }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" />\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <c:choose>\n");
      out.write("\n");
      out.write("                                            <c:when test = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.quantity > 0}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                                ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.quantity}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                                            </c:when>\n");
      out.write("\n");
      out.write("                                            <c:otherwise>\n");
      out.write("                                                <span style=\"color: red;font-weight: 700\" >HẾT HÀNG</span>\n");
      out.write("                                            </c:otherwise>\n");
      out.write("                                        </c:choose>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <a href=\"EditProduct?pid=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"> <i class=\"fas fa-edit\"></i></a> \n");
      out.write("                                        <a class=\"ml-2\" href=\"\"><i class=\"fas fa-times-circle\"></i></a> \n");
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("\n");
      out.write("                            </c:if>\n");
      out.write("\n");
      out.write("                        </c:forEach>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("            </tbody>\n");
      out.write("            <tfoot>\n");
      out.write("                <tr>\n");
      out.write("                    <th >ID</th>\n");
      out.write("                    <th >Name</th>\n");
      out.write("                    <th >Ảnh</th>\n");
      out.write("                    <th>Danh Mục</th>\n");
      out.write("                    <th >Hiển Thị</th>\n");
      out.write("                    <th >Số Lượng</th>\n");
      out.write("                    <th >Tác Vụ</th>\n");
      out.write("                </tr>\n");
      out.write("            </tfoot>\n");
      out.write("        </table>-->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-3.4.1.min.js\"></script>\n");
      out.write("        <!-- Bootstrap tooltips -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/popper.min.js\"></script>\n");
      out.write("        <!-- Bootstrap core JavaScript -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- MDB core JavaScript -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/mdb.min.js\"></script>\n");
      out.write("        <!-- MDBootstrap Datatables  -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/addons/datatables.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('#dtBasicExample').DataTable();\n");
      out.write("                $('.dataTables_length').addClass('bs-select');\n");
      out.write("            });\n");
      out.write("        </script>\n");
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
