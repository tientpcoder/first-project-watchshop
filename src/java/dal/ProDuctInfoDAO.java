/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ATM;
import model.Brand;
import model.Categories;
import model.Crystal;
import model.DialShape;
import model.Movement;
import model.Product;
import model.ProductInfo;
import model.Strap;

/**
 *
 * @author tientruong
 */
public class ProDuctInfoDAO extends DBContext {

    public ProductInfo getProductInfosByID(String id) {
        ProductInfo pis = new ProductInfo();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                    + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                    + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                    + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                    + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                    + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                    + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                    + "  inner join [dbo].Categories as ca on p.CateID = ca.ID WHERE p.ID='" + id + "'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Crystal cr = new Crystal();
                Movement m = new Movement();
                Strap s = new Strap();
                ATM a = new ATM();
                DialShape ds = new DialShape();
                Brand b = new Brand();
                Categories ca = new Categories();
                b.setCountry(rs.getString(32));
                b.setId(rs.getInt(30));
                b.setName(rs.getString(31));
                b.setImage(rs.getString(33));
                ca.setId(rs.getInt(34));
                ca.setName(rs.getString(35));
                p.setBrand(b);
                p.setCate(ca);
                p.setId(rs.getString(9));
                p.setName(rs.getString(11));
                p.setPrice(rs.getBigDecimal(12));
                p.setDescription(rs.getString(13));
                p.setDiscount(rs.getInt(14));
                p.setImage(rs.getString(15));
                p.setCreated(rs.getDate(16));
                p.setStatus(rs.getBoolean(17));
                p.setQuantity(rs.getInt(19));
                pis.setProduct(p);
                cr.setId(rs.getInt(20));
                cr.setName(rs.getString(21));
                pis.setCrystal(cr);
                ds.setId(rs.getInt(22));
                ds.setName(rs.getString(23));
                pis.setDialShape(ds);
                m.setId(rs.getInt(24));
                m.setName(rs.getString(25));
                pis.setMovement(m);
                s.setId(rs.getInt(26));
                s.setName(rs.getString(27));
                pis.setStrap(s);
                a.setId(rs.getInt(28));
                a.setType(rs.getString(29));
                pis.setAtm(a);
                pis.setDial_size(rs.getInt(4));
                pis.setDial_thickness(rs.getInt(5));
            }
        } catch (SQLException ex) {
            return null;
        }

        return pis;
    }

    public ArrayList<ProductInfo> getAllProductInfo() {
        ArrayList<ProductInfo> piss = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                    + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                    + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                    + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                    + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                    + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                    + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                    + "  inner join [dbo].Categories as ca on p.CateID = ca.ID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductInfo pis = new ProductInfo();
                Product p = new Product();
                Crystal cr = new Crystal();
                Movement m = new Movement();
                Strap s = new Strap();
                ATM a = new ATM();
                DialShape ds = new DialShape();
                Brand b = new Brand();
                Categories ca = new Categories();
                b.setCountry(rs.getString(32));
                b.setId(rs.getInt(30));
                b.setName(rs.getString(31));
                b.setImage(rs.getString(33));
                ca.setId(rs.getInt(34));
                ca.setName(rs.getString(35));
                p.setBrand(b);
                p.setCate(ca);
                p.setId(rs.getString(9));
                p.setName(rs.getString(11));
                p.setPrice(rs.getBigDecimal(12));
                p.setDescription(rs.getString(13));
                p.setDiscount(rs.getInt(14));
                p.setImage(rs.getString(15));
                p.setCreated(rs.getDate(16));
                p.setStatus(rs.getBoolean(17));
                p.setQuantity(rs.getInt(19));
                pis.setProduct(p);
                cr.setId(rs.getInt(20));
                cr.setName(rs.getString(21));
                pis.setCrystal(cr);
                ds.setId(rs.getInt(22));
                ds.setName(rs.getString(23));
                pis.setDialShape(ds);
                m.setId(rs.getInt(24));
                m.setName(rs.getString(25));
                pis.setMovement(m);
                s.setId(rs.getInt(26));
                s.setName(rs.getString(27));
                pis.setStrap(s);
                a.setId(rs.getInt(28));
                a.setType(rs.getString(29));
                pis.setAtm(a);
                pis.setDial_size(rs.getInt(4));
                pis.setDial_thickness(rs.getInt(5));
                piss.add(pis);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return piss;
    }

    public ArrayList<ProductInfo> getAllProductInfoByCondition(String cate, String brands, String from,
            String to, String strap, String crystal, String movement, String ds1, String atm) {
        ArrayList<ProductInfo> piss = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                    + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                    + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                    + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                    + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                    + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                    + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                    + "  inner join [dbo].Categories as ca on p.CateID = ca.ID where 1=1";
            if (!cate.equals("")) {
                sql += " and ca.ID = " + cate;
            }
            if (!brands.equals("")) {
                sql += " and b.ID in(" + brands + ")";
            }
            if (!from.equals("")) {
                sql += " and p.Price >= " + from + "000000";
                if (!to.equals("")) {
                    sql += " and p.Price <= " + to + "000000";
                }
            }
            if (!strap.equals("")) {
                sql += " and s.StrapID in(" + strap + ")";
            }
            if (!crystal.equals("")) {
                sql += " and c.Crystal_ID in(" + crystal + ")";
            }
            if (!movement.equals("")) {
                sql += " and m.Movement_ID in(" + movement + ")";
            }
            if (!ds1.equals("")) {
                sql += " and ds.ID in(" + ds1 + ")";
            }
            if (!atm.equals("")) {
                sql += " and a.ID in(" + atm + ")";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductInfo pis = new ProductInfo();
                Product p = new Product();
                Crystal cr = new Crystal();
                Movement m = new Movement();
                Strap s = new Strap();
                ATM a = new ATM();
                DialShape ds = new DialShape();
                Brand b = new Brand();
                Categories ca = new Categories();
                b.setCountry(rs.getString(32));
                b.setId(rs.getInt(30));
                b.setName(rs.getString(31));
                b.setImage(rs.getString(33));
                ca.setId(rs.getInt(34));
                ca.setName(rs.getString(35));
                p.setBrand(b);
                p.setCate(ca);
                p.setId(rs.getString(9));
                p.setName(rs.getString(11));
                p.setPrice(rs.getBigDecimal(12));
                p.setDescription(rs.getString(13));
                p.setDiscount(rs.getInt(14));
                p.setImage(rs.getString(15));
                p.setCreated(rs.getDate(16));
                p.setStatus(rs.getBoolean(17));
                p.setQuantity(rs.getInt(19));
                pis.setProduct(p);
                cr.setId(rs.getInt(20));
                cr.setName(rs.getString(21));
                pis.setCrystal(cr);
                ds.setId(rs.getInt(22));
                ds.setName(rs.getString(23));
                pis.setDialShape(ds);
                m.setId(rs.getInt(24));
                m.setName(rs.getString(25));
                pis.setMovement(m);
                s.setId(rs.getInt(26));
                s.setName(rs.getString(27));
                pis.setStrap(s);
                a.setId(rs.getInt(28));
                a.setType(rs.getString(29));
                pis.setAtm(a);
                pis.setDial_size(rs.getInt(4));
                pis.setDial_thickness(rs.getInt(5));
                piss.add(pis);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return piss;
    }

    public void setstatus(String pid, boolean s) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [status] = '" + s + "'\n"
                    + "     \n"
                    + " WHERE ID = '" + pid + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int count(String cate, String brands, String from,
            String to, String strap, String crystal, String movement, String ds1, String atm) {
        String sql = "SELECT COUNT(*) as rownum "
                + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                + "  inner join [dbo].Categories as ca on p.CateID = ca.ID where 1=1";
        if (!cate.equals("")) {
            sql += " and ca.ID = " + cate;
        }
        if (!brands.equals("")) {
            sql += " and b.ID in(" + brands + ")";
        }
        if (!from.equals("")) {
            sql += " and p.Price >= " + from + "000000";
            if (!to.equals("")) {
                sql += " and p.Price <= " + to + "000000";
            }
        }
        if (!strap.equals("")) {
            sql += " and s.StrapID in(" + strap + ")";
        }
        if (!crystal.equals("")) {
            sql += " and c.Crystal_ID in(" + crystal + ")";
        }
        if (!movement.equals("")) {
            sql += " and m.Movement_ID in(" + movement + ")";
        }
        if (!ds1.equals("")) {
            sql += " and ds.ID in(" + ds1 + ")";
        }
        if (!atm.equals("")) {
            sql += " and a.ID in(" + atm + ")";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("rownum");
            }
        } catch (SQLException ex) {
        }

        return -1;
    }

    public void setnewquan(String pid, int quan) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [quantity] = ?\n"
                    + " WHERE ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quan);
            stm.setString(2, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ProductInfo> getAllProductInfoPIDContain(String pid) {
        ArrayList<ProductInfo> piss = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                    + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                    + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                    + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                    + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                    + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                    + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                    + "  inner join [dbo].Categories as ca on p.CateID = ca.ID";
            if (!pid.equals("")) {
                sql += " where p.ID like '%" + pid + "%'";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductInfo pis = new ProductInfo();
                Product p = new Product();
                Crystal cr = new Crystal();
                Movement m = new Movement();
                Strap s = new Strap();
                ATM a = new ATM();
                DialShape ds = new DialShape();
                Brand b = new Brand();
                Categories ca = new Categories();
                b.setCountry(rs.getString(32));
                b.setId(rs.getInt(30));
                b.setName(rs.getString(31));
                b.setImage(rs.getString(33));
                ca.setId(rs.getInt(34));
                ca.setName(rs.getString(35));
                p.setBrand(b);
                p.setCate(ca);
                p.setId(rs.getString(9));
                p.setName(rs.getString(11));
                p.setPrice(rs.getBigDecimal(12));
                p.setDescription(rs.getString(13));
                p.setDiscount(rs.getInt(14));
                p.setImage(rs.getString(15));
                p.setCreated(rs.getDate(16));
                p.setStatus(rs.getBoolean(17));
                p.setQuantity(rs.getInt(19));
                pis.setProduct(p);
                cr.setId(rs.getInt(20));
                cr.setName(rs.getString(21));
                pis.setCrystal(cr);
                ds.setId(rs.getInt(22));
                ds.setName(rs.getString(23));
                pis.setDialShape(ds);
                m.setId(rs.getInt(24));
                m.setName(rs.getString(25));
                pis.setMovement(m);
                s.setId(rs.getInt(26));
                s.setName(rs.getString(27));
                pis.setStrap(s);
                a.setId(rs.getInt(28));
                a.setType(rs.getString(29));
                pis.setAtm(a);
                pis.setDial_size(rs.getInt(4));
                pis.setDial_thickness(rs.getInt(5));
                piss.add(pis);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return piss;
    }

    public int countPIDContain(String pid) {
        String sql = "SELECT COUNT(*) as rownum "
                + "  FROM [dbo].[ProductInfo] as pin inner join [dbo].Products as p on pin.Product_ID=p.ID \n"
                + "  inner join [dbo].Crystal as c on pin.Crystal_ID=c.Crystal_ID\n"
                + "  inner join [dbo].Dial_Shape as ds on pin.Dial_Shape_ID=ds.ID\n"
                + "  inner join [dbo].Movement as m on pin.Movement_ID=m.Movement_ID\n"
                + "  inner join [dbo].Strap as s on pin.Strap_ID=s.StrapID\n"
                + "  inner join [dbo].ATM as a on pin.ATM_ID=a.ID\n"
                + "  inner join [dbo].Brands as b on p.Brand_id=b.ID"
                + "  inner join [dbo].Categories as ca on p.CateID = ca.ID where 1=1";
        if (!pid.equals("")) {
            sql += " where p.ID like '%" + pid + "%'";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("rownum");
            }
        } catch (SQLException ex) {
        }

        return -1;
    }

    public void updateproduct(ProductInfo p) {
        try {
            connection.setAutoCommit(false);
            //update product
            String sqlpro = "UPDATE [dbo].[Products]\n"
                    + "   SET [CateID] =?\n"
                    + "      ,[Name] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[Discount] = ?\n"
                    + "      ,[Image] = ?\n"
                    + "      ,[Brand_id] = ?\n"
                    + "      ,[quantity] =?\n"
                    + " WHERE ID=?";
            PreparedStatement stm1 = connection.prepareStatement(sqlpro);
            stm1.setInt(1, p.getProduct().getCate().getId());
            stm1.setString(2, p.getProduct().getName());
            stm1.setBigDecimal(3, p.getProduct().getPrice());
            stm1.setString(4, p.getProduct().getDescription());
            stm1.setInt(5, p.getProduct().getDiscount());
            stm1.setString(6, p.getProduct().getImage());
            stm1.setInt(7, p.getProduct().getBrand().getId());
            stm1.setInt(8, p.getProduct().getQuantity());
            stm1.setString(9, p.getProduct().getId());
            stm1.executeUpdate();
            //update product info
            String sqlpin = "UPDATE [dbo].[ProductInfo]\n"
                    + "   SET [Crystal_ID] =?\n"
                    + "      ,[Movement_ID] = ?\n"
                    + "      ,[Dial_Size] = ?\n"
                    + "      ,[Dial_Thickness] = ?\n"
                    + "      ,[Strap_ID] = ?\n"
                    + "      ,[ATM_ID] = ?\n"
                    + "      ,[Dial_Shape_ID] = ?\n"
                    + " WHERE Product_ID=?";
            PreparedStatement stm2 = connection.prepareStatement(sqlpin);
            stm2.setInt(1,p.getCrystal().getId());
            stm2.setInt(2,p.getMovement().getId());
            stm2.setInt(3,p.getDial_size());
            stm2.setInt(4,p.getDial_thickness());
            stm2.setInt(5,p.getStrap().getId());
            stm2.setInt(6,p.getAtm().getId());
            stm2.setInt(7,p.getDialShape().getId());
            stm2.setString(8,p.getProduct().getId());
            stm2.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(ProDuctInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
