
package com.test.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author bhalc
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDescription;
    
    @OneToMany(mappedBy = "category")
    private List<Product> products= new ArrayList<>();

    /**
     *
     * @param categoryId
     * @param categoryTitle
     * @param categoryDescription
     */
    public Category(int categoryId, String categoryTitle, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }

    /**
     *
     * @param categoryTitle
     * @param categoryDescription
     * @param products
     */
    public Category(String categoryTitle, String categoryDescription , List<Product> products ){
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }

    /**
     *
     */
    public Category() {
    }

    /**
     *
     * @return
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     *
     * @param categoryId
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     *
     * @return
     */
    public String getCategoryTitle() {
        return categoryTitle;
    }

    /**
     *
     * @param categoryTitle
     */
    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    /**
     *
     * @return
     */
    public String getCategoryDescription() {
        return categoryDescription;
    }

    /**
     *
     * @param categoryDescription
     */
    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    /**
     *
     * @return
     */
    public List<Product> getProducts() {
        return products;
    }

    /**
     *
     * @param products
     */
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
    
    
}
