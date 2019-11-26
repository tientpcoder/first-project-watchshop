/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author tientruong
 */
public class ProductInfo implements Serializable{
    Product product;
    Crystal crystal;
    Movement movement;
    int dial_size;
    int dial_thickness;
    Strap strap;
    ATM atm;
    DialShape dialShape;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Crystal getCrystal() {
        return crystal;
    }

    public void setCrystal(Crystal crystal) {
        this.crystal = crystal;
    }

    public Movement getMovement() {
        return movement;
    }

    public void setMovement(Movement movement) {
        this.movement = movement;
    }

    public int getDial_size() {
        return dial_size;
    }

    public void setDial_size(int dial_size) {
        this.dial_size = dial_size;
    }

    public int getDial_thickness() {
        return dial_thickness;
    }

    public void setDial_thickness(int dial_thickness) {
        this.dial_thickness = dial_thickness;
    }

    public Strap getStrap() {
        return strap;
    }

    public void setStrap(Strap strap) {
        this.strap = strap;
    }

    public ATM getAtm() {
        return atm;
    }

    public void setAtm(ATM atm) {
        this.atm = atm;
    }

    public DialShape getDialShape() {
        return dialShape;
    }

    public void setDialShape(DialShape dialShape) {
        this.dialShape = dialShape;
    }
    
}
