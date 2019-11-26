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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

/**
 *
 * @author tientruong
 */
public class BrandDAO extends DBContext {

    public ArrayList<Brand> getBrandsbyID(int id) {
        ArrayList<Brand> brs = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Name]\n"
                    + "      ,[Country]\n"
                    + "      ,[Logo]\n"
                    + "  FROM [dbo].[Brands]";
            if(id!=-1){
                sql+="WHERE ID = "+id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Brand temp = new Brand();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                temp.setCountry(rs.getString(3));
                temp.setImage(rs.getString(4));
                brs.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brs;
    }
}
