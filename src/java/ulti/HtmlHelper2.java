/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulti;

/**
 *
 * @author tientruong
 */
public class HtmlHelper2 {

    public static String hyperlink(String label, String href) {
        return "<li class=\"page-item\"><a class=\"page-link\" href=\"" + href + "\">" + label + "</a></li>";
    }

    public static String pager(String pid,int pageindex, int pagecount, int gap) {
        String result = "";

        result += hyperlink("First", "QLSP?page=" + 1+"&pid="+pid);

        for (int i = gap; i > 0; i--) {
            if (pageindex - i > 0) {
                result += hyperlink("" + (pageindex - i), "QLSP?page=" + (pageindex - i)+"&pid="+pid);
            }
        }

        result += "<li style=\"text-decoration: underline;\" class=\"page-item\"><a style=\"color: black; font-weight: 700\" class=\"page-link\" href=\"#\">" + pageindex + "</a></li>";

        for (int i = 1; i <= gap; i++) {
            if (pageindex + i <= pagecount) {
                result += hyperlink("" + (pageindex + i), "QLSP?page=" + (pageindex + i)+"&pid="+pid);
            }
        }

        result += hyperlink("Last", "QLSP?page=" + pagecount+"&pid="+pid);
        return result;
    }
}
