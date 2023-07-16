/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import basicobjects.Category;
import basicobjects.Plant;
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
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String key, String searchBy) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName from Plants\n"
                    + "join Categories on Plants.CateID = Categories.CateID\n";
            if (searchBy.equalsIgnoreCase("byName")) {
                sql = sql + "where PName like ?";
            } else {
                sql = sql + "where CateName like ?";
            }
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    Plant newPlant = new Plant(id, name, cateID, imgPath, des, status, cateID, cateName);
                    list.add(newPlant);
                }
            }
        }
        return list;
    }

    public static Plant getPlant(int id) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Plant p = null;
        if (cn != null) {
            String sql = "select PID, PName, price, imgPath, description, status, c.CateName as category from Plants p\n"
                    + "join Categories c \n"
                    + "on p.CateID = c.CateID where PID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int pid = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    String category = rs.getString("category");
                    p = new Plant(pid, name, price, imgPath, description, status, pid, category);
                }
            }
            cn.close();
        }
        return p;
    }

    public static ArrayList<Plant> getAllPlants() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Plant> list = new ArrayList<>();
        if (cn != null) {
            String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName from Plants\n"
                    + "join Categories on Plants.CateID = Categories.CateID\n";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    Plant newPlant = new Plant(id, name, price, imgPath, des, status, cateID, cateName);
                    list.add(newPlant);
                }
            }
        }
        cn.close();
        return list;
    }

    

    public static int createPlant(String plantName, int price, String imgPath, String des, int status, int cateID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "insert into \n"
                    + "Plants (PName, price, imgPath, description, status, CateID)\n"
                    + "values (?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, plantName);
            pst.setInt(2, price);
            pst.setString(3, imgPath);
            pst.setString(4, des);
            pst.setInt(5, status);
            pst.setInt(6, cateID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }

    public static int updatePlant(int id, String name, int price, String imgPath, String des, int status, int CateID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "update Plants\n"
                    + "set price = ?, imgPath = ?, description = ?, PName = ?, status = ?, CateID = ?\n"
                    + "where PID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, price);
            pst.setString(2, imgPath);
            pst.setString(3, des);
            pst.setString(4, name);
            pst.setInt(5, status);
            pst.setInt(6, CateID);
            pst.setInt(7, id);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }
}
