/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package basicobjects;

/**
 *
 * @author linh1
 */
public class Plant {
    private int id;
    private String PName;
    private int check;
    private String imgPath;
    private String description;
    private int status;
    private int cateID;
    private String cateName;

    public Plant(int id, String PName, int check, String imgPath, String description, int status, int cateID, String cateName) {
        this.id = id;
        this.PName = PName;
        this.check = check;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateID = cateID;
        this.cateName = cateName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPName() {
        return PName;
    }

    public void setPName(String PName) {
        this.PName = PName;
    }

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    
    
}
