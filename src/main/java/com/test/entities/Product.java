
package com.test.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author bhalc
 */
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String productName;
    @Column(length=3000)
    private String productDescription;
    private String pPhoto;
    private int productPrice;
    private int productDiscount;
    private int productQuantity;
    
    @ManyToOne
    private Category category;
   
    /**
     *
     * @param productId
     * @param productName
     * @param productDescription
     * @param productPrice
     * @param productDiscount
     * @param productQuantity
     */
    public Product(int productId, String productName, String productDescription, int productPrice, int productDiscount, int productQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
    }

  
    public Product(String productName, String productDescription, int productPrice, int productDiscount, int productQuantity, String pPhoto, Category category) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
        this.pPhoto=pPhoto;
        this.category=category;
    }

    /**
     *
     */
    public Product() {
    }

    /**
     *
     * @return
     */
    public int getProductId() {
        return productId;
    }

    /**
     *
     * @param productId
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     *
     * @return
     */
    public String getProductName() {
        return productName;
    }

    /**
     *
     * @param productName
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     *
     * @return
     */
    public String getProductDescription() {
        return productDescription;
    }

    /**
     *
     * @param productDescription
     */
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    /**
     *
     * @return
     */
    public int getProductPrice() {
        return productPrice;
    }

    /**
     *
     * @param productPrice
     */
    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    /**
     *
     * @return
     */
    public int getProductDiscount() {
        return productDiscount;
    }

    /**
     *
     * @param productDiscount
     */
    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    /**
     *
     * @return
     */
    public int getProductQuantity() {
        return productQuantity;
    }

    /**
     *
     * @param productQuantity
     */
    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    /**
     *
     * @return
     */
    public Category getCategory() {
        return category;
    }

    /**
     *
     * @param category
     */
    public void setCategory(Category category) {
        this.category = category;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription=" + productDescription + ", pPhoto=" + pPhoto + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + ", category=" + category + '}';
    }
    
    //calculate price after discount
    
    public int getPriceAfterDiscount(){
        
        int d = (int)((this.getProductDiscount()/100.0)*this.getProductPrice());
        return this.getProductPrice()-d;
    }
    
      
    
    
}
