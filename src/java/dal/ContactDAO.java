/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Contact;

/**
 *
 * @author tientruong
 */
public class ContactDAO extends DBContext {

    public Contact getContact() {
        Contact c = new Contact();
        try {
            String sql = "SELECT [name]\n"
                    + "      ,[address]\n"
                    + "      ,[hotline]\n"
                    + "      ,[email]\n"
                    + "      ,[fb]\n"
                    + "      ,[yt]\n"
                    + "      ,[map]\n"
                    + "  FROM [Project].[dbo].[Contact]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setEmail(rs.getString("email"));
                c.setHotline(rs.getString("hotline"));
                c.setFb(rs.getString("fb"));
                c.setYt(rs.getString("yt"));
                c.setMap(rs.getString("map"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public void update(Contact c) {
        try {
            String sql = "UPDATE [dbo].[Contact]\n"
                    + "   SET [name] = N'"+c.getName()+"'\n"
                    + "      ,[address] = N'"+c.getAddress()+"' \n"
                    + "      ,[hotline] = N'"+c.getHotline()+"' \n"
                    + "      ,[email] = N'"+c.getEmail()+"' \n"
                    + "      ,[fb] = N'"+c.getFb()+"' \n"
                    + "      ,[yt] = N'"+c.getYt()+"' \n"
                    + "      ,[map] = N'"+c.getMap()+"' ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
