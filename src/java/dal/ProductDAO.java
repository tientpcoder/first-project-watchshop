/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Product;

/**
 *
 * @author tientruong
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getProductsByCate(int cid) {
        ArrayList<Product> pros = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[CateID]\n"
                    + "      ,[Name]\n"
                    + "      ,[Price]\n"
                    + "      ,[Description]\n"
                    + "      ,[Discount]\n"
                    + "      ,[Image]\n"
                    + "      ,[Created]\n"
                    + "      ,[status]\n"
                    + "      ,[Brand_id]\n"
                    + "  FROM [dbo].[Products] WHERE status = 1";
            if (cid != -1) {
                sql += " and CateID = ?";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, cid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product d = new Product();
                d.setId(rs.getString("ID"));
                d.setName(rs.getString("Name"));
                d.setImage(rs.getString("Image"));
                d.setPrice(rs.getBigDecimal("Price"));
                pros.add(d);
            }
        } catch (SQLException ex) {

        }
        return pros;
    }
    
    
    

    public Product getProductsByPID(String pid) {
        Product d = new Product();
        try {
            String sql = "SELECT p.ID as PID, p.CateID, p.Name as PName, p.Price,p.Description,p.Discount,p.Image,p.Created,p.views,b.ID as BID,b.Name as BName, b.Country as BCountry, b.Logo as BLogo\n"
                    + "  FROM [dbo].[Products] as p \n"
                    + "  inner join [dbo].Categories as c on p.CateID = c.ID \n"
                    + "  inner join [dbo].Brands as b on b.ID = p.Brand_id WHERE p.ID = '" + pid + "'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setId(rs.getInt("BID"));
                b.setName(rs.getString("BName"));
                b.setImage(rs.getString("BLogo"));
                d.setBrand(b);
                d.setId(rs.getString("PID"));
                d.setName(rs.getString("PName"));
                d.setImage(rs.getString("Image"));
                d.setPrice(rs.getBigDecimal("Price"));
                d.setDescription(rs.getString("Description"));
                d.setDiscount(rs.getInt("Discount"));
                d.setCreated(rs.getDate("p.Created"));
                
            }
        } catch (SQLException ex) {

        }
        return d;
    }
}
