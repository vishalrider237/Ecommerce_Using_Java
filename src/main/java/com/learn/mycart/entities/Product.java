package com.learn.mycart.entities;

import javax.persistence.*;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length = 3000)
    private String pDesc;
    private String pPhoto;
    private int pPrice;
    private int pDisc;
    private int pQuantity;
    @ManyToOne
    private Category category;

    public Product() {
        super();
    }

    public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDisc, int pQuantity,Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDisc = pDisc;
        this.pQuantity = pQuantity;
        this.category=category;
    }


    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDisc() {
        return pDisc;
    }

    public void setpDisc(int pDisc) {
        this.pDisc = pDisc;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pDesc='" + pDesc + '\'' +
                ", pPhoto='" + pPhoto + '\'' +
                ", pPrice=" + pPrice +
                ", pDisc=" + pDisc +
                ", pQuantity=" + pQuantity +
                '}';
    }
    // Calculate price after discount
    public int getPriceAfterAppliyingDiscount(){
        int d= (int) ((this.getpDisc()/100.0)*this.getpPrice());
        return this.getpPrice()-d;
    }
}
