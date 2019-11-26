/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.ProDuctInfoDAO;
import java.util.ArrayList;
import model.Order;

/**
 *
 * @author tientruong
 */
public class Test {
    ProDuctInfoDAO pid = new ProDuctInfoDAO();
    public static void main(String[] args) {
        Test t = new Test();
        System.out.println(t.pid.count("2", "", "", "", "", "", "", "", ""));
    }
    
}
