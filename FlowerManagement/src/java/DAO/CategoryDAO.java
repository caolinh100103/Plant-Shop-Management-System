/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import basicobjects.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author linh1
 */
public class CategoryDAO {

    public static ArrayList<Category> getAllCategories() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Category> list = new ArrayList<>();
        if (cn != null) {
            String sql = "select CateID, CateName from Categories";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    Category cate = new Category(CateID, CateName);
                    list.add(cate);
                }
            }
        }
        cn.close();
        return list;
    }

    public static Category getCategory(int cateID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Category c = null;
        if (cn != null) {
            String sql = "select CateID, CateName from Categories\n"
                    + "where CateID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, cateID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String cateName = rs.getString("CateName");
                    c = new Category(cateID, cateName);
                }
            }
        }
        return c;
    }

    public static int updateCategory(int cateID, String cateName) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "update Categories\n"
                    + "set CateName = ?\n"
                    + "where CateID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateName);
            pst.setInt(2, cateID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }
    
    public static int insertCategory (String cateName) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "insert into Categories(CateName) values(?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateName);
            kq = pst.executeUpdate();
            
        }
        cn.close();
        return kq;
    }
    
}
