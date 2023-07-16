/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import basicobjects.User;
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
public class UserDAO {

    public static User getUser(String email) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User acc = null;
        if (cn != null) {
            String s = "select accID, email, password, fullname, phone, status, role from Accounts where email = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int accID = rs.getInt("accID");
                    String emailStr = rs.getString("email");
                    String passwordStr = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new User(accID, email, passwordStr, fullName, phone, status, role);
                }
            }
            cn.close();
        }
        return acc;
    }

    public static int createUser(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "insert into Accounts(email, password, fullname, phone, status, role) values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phone);
            pst.setInt(5, status);
            pst.setInt(6, role);
            rs = pst.executeUpdate();
        }
        cn.close();
        return rs;
    }

    public static int updateProfile(String fullName, String phone, int accID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "update Accounts\n"
                    + "set fullname = ?, phone = ?\n"
                    + "where accID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, phone);
            pst.setInt(3, accID);
            kq = pst.executeUpdate();
        }

        cn.close();
        return kq;
    }

    public static User getUser(int accID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User u = null;
        if (cn != null) {
            String sql = "select accID, fullname, phone\n"
                    + "from Accounts\n"
                    + "where accID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, accID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    u = new User(accID, fullName, phone);
                }
            }
        }
        return u;
    }

    public static ArrayList<User> getAllUser() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<User> list = new ArrayList<>();
        if (cn != null) {
            String sql = "select accID, email, password, fullname, phone, status, role from Accounts";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int accID = rs.getInt("accID");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    User u = new User(accID, email, password, fullname, phone, status, role);
                    list.add(u);
                }
            }
        }
        cn.close();
        return list;
    }

    public static ArrayList<User> getAllUser(String fullName) throws Exception {
        ArrayList<User> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID, email, password, fullname, phone, status, role \n"
                    + "from Accounts\n"
                    + "where fullname like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + fullName + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int acciD = rs.getInt("accID");
                    String email = rs.getString("email");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    String password = rs.getString("password");
                    User u = new User(acciD, email, password, fullname, phone, status, role);
                    list.add(u);
                }
            }
        }
        cn.close();
        return list;
    }

    public static int updateStatusACcount(int accID, int status ) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int kq = 0;
        if (cn != null) {
            String sql = "update Accounts\n"
                    + "set status = ?\n"
                    + "where accID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, accID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }
}
