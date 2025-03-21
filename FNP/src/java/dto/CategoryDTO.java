/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ducmi
 */
public class CategoryDTO {
    private int categoryID;
    private String categoryName;
    private boolean visiableMenu;

    public CategoryDTO() {
    }

    public CategoryDTO(int categoryID, String categoryName, boolean visiableMenu) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.visiableMenu = visiableMenu;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isVisiableMenu() {
        return visiableMenu;
    }

    public void setVisiableMenu(boolean visiableMenu) {
        this.visiableMenu = visiableMenu;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", visiableMenu=" + visiableMenu + '}';
    }

}
