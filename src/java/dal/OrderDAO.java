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
import model.Order;
import model.OrderLine;
import model.Product;

/**
 *
 * @author tientruong
 */
public class OrderDAO extends DBContext {

    public void insert(Order order) {
        try {
            connection.setAutoCommit(false);
            //INSERT ORDER
            if (order.getUser().getId() != -1) {
                String sql_insert_order = "INSERT INTO [dbo].[Order]\n"
                        + "           ([Status]\n"
                        + "           ,[UserID]\n"
                        + "           ,[Name]\n"
                        + "           ,[email]\n"
                        + "           ,[phone]\n"
                        + "           ,[address]\n"
                        + "           ,[total]\n"
                        + "           ,[message]\n"
                        + "           ,[created],[purchase])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE(),?)";
                PreparedStatement statement_insert_order
                        = connection.prepareStatement(sql_insert_order);
                statement_insert_order.setBoolean(1, false);
                statement_insert_order.setInt(2, order.getUser().getId());
                statement_insert_order.setString(3, order.getName());
                statement_insert_order.setString(4, order.getEmail());
                statement_insert_order.setString(5, order.getPhone());
                statement_insert_order.setString(6, order.getAddress());
                statement_insert_order.setBigDecimal(7, order.total());
                statement_insert_order.setString(8, order.getMessage());
                statement_insert_order.setBoolean(9, order.isPurchase());
                statement_insert_order.executeUpdate();
            } else {
                String sql_insert_order = "INSERT INTO [dbo].[Order]\n"
                        + "           ([Status]\n"
                        + "           ,[Name]\n"
                        + "           ,[email]\n"
                        + "           ,[phone]\n"
                        + "           ,[address]\n"
                        + "           ,[total]\n"
                        + "           ,[message]\n"
                        + "           ,[created],[purchase])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE(),?)";
                PreparedStatement statement_insert_order
                        = connection.prepareStatement(sql_insert_order);
                statement_insert_order.setBoolean(1, false);
                statement_insert_order.setString(2, order.getName());
                statement_insert_order.setString(3, order.getEmail());
                statement_insert_order.setString(4, order.getPhone());
                statement_insert_order.setString(5, order.getAddress());
                statement_insert_order.setBigDecimal(6, order.total());
                statement_insert_order.setString(7, order.getMessage());
                statement_insert_order.setBoolean(8, order.isPurchase());
                statement_insert_order.executeUpdate();
            }
            // Query Order id BECAUSE IT IS AUTO INCREMENT
            String sql_query_orderid = "SELECT @@IDENTITY as oid ";
            PreparedStatement statement_query_oid
                    = connection.prepareStatement(sql_query_orderid);
            ResultSet rs_orderid = statement_query_oid.executeQuery();
            if (rs_orderid.next()) {
                order.setId(rs_orderid.getInt("oid"));
            }
            // INSERT ORDER LINES
            for (OrderLine line : order.getLines()) {
                String sql_insert_orderline = "INSERT INTO [dbo].[OrderLine]\n"
                        + "           ([OrderID]\n"
                        + "           ,[ProductID]\n"
                        + "           ,[quantity]\n"
                        + "           ,[total])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement statement_insert_orderline
                        = connection.prepareStatement(sql_insert_orderline);
                statement_insert_orderline.setInt(1, order.getId());
                statement_insert_orderline.setString(2, line.getProduct().getId());
                statement_insert_orderline.setFloat(3, line.getQuantity());
                statement_insert_orderline.setBigDecimal(4, line.getPrice());
                statement_insert_orderline.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Order> getOrderofUser(int uid) {
        ArrayList<Order> uo = new ArrayList<>();
        try {
            String sql_order = "SELECT *\n"
                    + "  FROM [Project].[dbo].[Order] as o  "
                    + "inner join [Project].[dbo].[User] as u on  u.ID = o.UserID where u.ID = " + uid;
            PreparedStatement stm_order = connection.prepareStatement(sql_order);
            ResultSet rs1 = stm_order.executeQuery();
            while (rs1.next()) {
                Order temp = new Order();
                Product p = new Product();
                temp.setId(rs1.getInt(1));
                temp.setStatus(rs1.getBoolean(2));
                temp.setName(rs1.getString(4));
                temp.setAddress(rs1.getString(7));
                temp.setPhone(rs1.getString(6));
                temp.setCreated(rs1.getDate(10));
                temp.setMessage(rs1.getString(9));
                temp.setPurchase(rs1.getBoolean(11));
                String sql_orderline = "SELECT  * FROM [Project].[dbo].[OrderLine] as ol "
                        + "inner join [Project].[dbo].Products as p on p.ID = ol.ProductID where ol.OrderID=" + temp.getId();
                PreparedStatement stm_orderline = connection.prepareStatement(sql_orderline);
                ResultSet rs2 = stm_orderline.executeQuery();
                ArrayList<OrderLine> lines = new ArrayList<>();
                while (rs2.next()) {                    
                    OrderLine l = new OrderLine();
                    l.setPrice(rs2.getBigDecimal(4));
                    l.setQuantity(rs2.getInt(3));
                    p.setId(rs2.getString(2));
                    p.setName(rs2.getString(7));
                    l.setProduct(p);
                    lines.add(l);
                }
                temp.setLines(lines);
                uo.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uo;
    }

}
