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
import model.ATM;
import model.Crystal;
import model.DialShape;
import model.Movement;
import model.Product;
import model.Strap;

/**
 *
 * @author tientruong
 */
public class DetailDAO extends DBContext {

    public ArrayList<ATM> getATMbyID(int id) {
        ArrayList<ATM> a = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Type]\n"
                    + "  FROM [dbo].[ATM]";
            if (id != -1) {
                sql += "WHERE ID = " + id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ATM temp = new ATM();
                temp.setId(rs.getInt(1));
                temp.setType(rs.getString(2));
                a.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public ArrayList<Strap> getStrapbyID(int id) {
        ArrayList<Strap> a = new ArrayList<>();
        try {
            String sql = "SELECT [StrapID]\n"
                    + "      ,[Name]\n"
                    + "  FROM [Project].[dbo].[Strap]";
            if (id != -1) {
                sql += "WHERE StrapID = " + id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Strap temp = new Strap();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                a.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public ArrayList<Crystal> getCrystalsbyID(int id) {
        ArrayList<Crystal> a = new ArrayList<>();
        try {
            String sql = "SELECT [Crystal_ID]\n"
                    + "      ,[Name]\n"
                    + "  FROM [Project].[dbo].[Crystal]";
            if (id != -1) {
                sql += "WHERE Crystal_ID = " + id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Crystal temp = new Crystal();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                a.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public ArrayList<Movement> getMovementsbyID(int id) {
        ArrayList<Movement> a = new ArrayList<>();
        try {
            String sql = "SELECT [Movement_ID]\n"
                    + "      ,[Name]\n"
                    + "  FROM [Project].[dbo].[Movement]";
            if (id != -1) {
                sql += "WHERE Movement_ID = " + id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Movement temp = new Movement();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                a.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public ArrayList<DialShape> getDialShapesbyID(int id) {
        ArrayList<DialShape> a = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Name]\n"
                    + "  FROM [Project].[dbo].[Dial_Shape]";
            if (id != -1) {
                sql += "WHERE ID = " + id;
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                DialShape temp = new DialShape();
                temp.setId(rs.getInt(1));
                temp.setName(rs.getString(2));
                a.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

}
