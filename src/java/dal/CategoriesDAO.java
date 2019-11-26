/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Categories;

/**
 *
 * @author tientruong
 */
public class CategoriesDAO extends DBContext {

    public ArrayList<Categories> getCate() {
        ArrayList<Categories> cates = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Name]\n"
                    + "      ,[sort_order]\n"
                    + "      ,[link]\n"
                    + "      ,[banner]\n"
                    + "      ,[description]\n"
                    + "  FROM [dbo].[Categories] order by sort_order asc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categories c = new Categories();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getString("Name"));
                c.setLink(rs.getString("link"));
                c.setSort_order(rs.getInt("sort_order"));
                c.setBanner(rs.getString("banner"));
                c.setDescrip(rs.getString("description"));
                cates.add(c);
            }
        } catch (SQLException ex) {

        }
        return cates;
    }

    public Categories getCatebyID(int id) {
        Categories c = new Categories();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Name]\n"
                    + "      ,[sort_order]\n"
                    + "      ,[link]\n"
                    + "      ,[banner]\n"
                    + "      ,[description]\n"
                    + "  FROM [dbo].[Categories] where ID = "+id;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
              
                c.setId(rs.getInt("ID"));
                c.setName(rs.getString("Name"));
                c.setLink(rs.getString("link"));
                c.setSort_order(rs.getInt("sort_order"));
                c.setBanner(rs.getString("banner"));
                c.setDescrip(rs.getString("description"));
            }
        } catch (SQLException ex) {

        }
        return c;
    }
}
