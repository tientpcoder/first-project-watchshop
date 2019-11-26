/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulti;

/**
 *
 * @author sonnt
 */
public class HtmlHelper {

    public static String hyperlink(String label, String href) {
        return "<li class=\"page-item\"><a class=\"page-link\" href=\"" + href + "\">" + label + "</a></li>";
    }

    public static String pager(String cate,String brand,String strap,String crystal,String movement,String ds,String atm,String price, int pageindex, int pagecount, int gap) {
        String result = "";
        result += hyperlink("First", "WatchByCate?Cate=" + cate + "&page=" + 1+"&brandc="+brand+"&strap="+strap+"&crystal="+crystal+"&movement="+movement+"&dialshape="+ds+"&atm="+atm+"&price="+price);
        for (int i = gap; i > 0; i--) {
            if (pageindex - i > 0) {
                result += hyperlink("" + (pageindex - i), "WatchByCate?Cate=" + cate + "&page=" + (pageindex - i)+"&brandc="+brand+"&strap="+strap+"&crystal="+crystal+"&movement="+movement+"&dialshape="+ds+"&atm="+atm+"&price="+price);
            }
        }

        result += "<li style=\"text-decoration: underline;\" class=\"page-item\"><a style=\"color: black; font-weight: 700\" class=\"page-link\" href=\"#\">"+pageindex+"</a></li>";

        for (int i = 1; i <= gap; i++) {
            if (pageindex + i <= pagecount) {
                result += hyperlink("" + (pageindex + i), "WatchByCate?Cate=" + cate + "&page=" + (pageindex + i)+"&brandc="+brand+"&strap="+strap+"&crystal="+crystal+"&movement="+movement+"&dialshape="+ds+"&atm="+atm+"&price="+price);
            }
        }
        result += hyperlink("Last", "WatchByCate?Cate=" + cate + "&page=" + pagecount+"&brandc="+brand+"&strap="+strap+"&crystal="+crystal+"&movement="+movement+"&dialshape="+ds+"&atm="+atm+"&price="+price);
        return result;
    }
}
