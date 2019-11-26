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
import model.User;
import model.UserRole;

/**
 *
 * @author tientruong
 */
public class UserDAO extends DBContext {
  
    public ArrayList<User> getUserbyemail(String email) {
        ArrayList<User> us = new ArrayList<>();
        try {
            String sql = "SELECT *  FROM [dbo].[User] as u inner join [dbo].Role as r on u.role_id=r.id ";
            if (!email.equals("")) {
                sql+="where u.email = '"+email+"'";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User temp = new User();
                UserRole ur = new UserRole();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                temp.setEmail(rs.getString(3));
                temp.setPhone(rs.getString(4));
                temp.setAddress(rs.getString(5));
                temp.setPassword(rs.getString(6));
                temp.setCreated(rs.getDate(7));
                ur.setId(rs.getInt(9));
                ur.setName(rs.getString(10));
                temp.setUser_Role(ur);
                us.add(temp);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return us;
    }
    

    public void changepass(int id, String pass) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [password] = '" + pass + "' WHERE ID = " + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeinfo(int id, String name, String phone, String address) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [Name] =  N'" + name + "' \n"
                    + "      ,[phone] = '" + phone + "'\n"
                    + "      ,[address] =   N'" + address + "' \n"
                    + " WHERE ID = " + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void signin(User u) {
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([Name]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[password]\n"
                    + "           ,[created]\n"
                    + "           ,[role_id])\n"
                    + "     VALUES\n"
                    + "           (N'" + u.getName() + "'\n"
                    + "           ,'" + u.getEmail() + "'\n"
                    + "           ,'" + u.getPhone() + "'\n"
                    + "           ,N'" + u.getAddress() + "'\n"
                    + "           ,'" + u.getPassword() + "'\n"
                    + "           ,'" + u.getCreated() + "'\n"
                    + "           ,'" + u.getUser_Role().getId() + "')";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
