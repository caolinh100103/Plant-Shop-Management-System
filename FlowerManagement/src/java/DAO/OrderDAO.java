/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import basicobjects.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import mylib.DBUtils;

/**
 *
 * @author linh1
 */
public class OrderDAO {

    public static int insertOrder(int userID, HashMap<Integer, Integer> cart) throws Exception {
        int kq = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            cn.setAutoCommit(false);
            String sql = "insert into Orders(OrdDate, shipdate, status, AccID) values(?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            Date d = new Date(System.currentTimeMillis());
            Date shipD = new Date(d.getTime() + 3 * (1000 * 60 * 60 * 24));
            pst.setDate(1, d);
            pst.setDate(2, shipD);
            pst.setInt(3, 1); // có 3 cái số để chỉ trạng thái
            pst.setInt(4, userID);
            kq = pst.executeUpdate();
            if (kq > 0) {
                sql = "select top 1 OrderID from Orders order by OrderID desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    if (cart != null && cart.size() > 0) {
                        for (int plantId : cart.keySet()) {
                            int quantity = cart.get(plantId);
                            sql = "insert into OrderDetails(OrderID, FID, quantity) values(?,?,?)";
                            pst = cn.prepareStatement(sql);
                            pst.setInt(1, orderID);
                            pst.setInt(2, plantId);
                            pst.setInt(3, quantity);
                            kq = pst.executeUpdate();
                        }
                    }
                }
            }
            cn.commit();
            cn.setAutoCommit(true);
            cn.close();
        }
        return kq;
    }

    public static ArrayList<Order> getAllOrders(String email) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select a.accID, o.OrderID, o.OrdDate, o.shipdate, o.status, a.email\n"
                    + "from Orders o\n"
                    + "join Accounts a\n"
                    + "on o.AccID = a.accID\n"
                    + "where a.email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int accID = rs.getInt("AccID");
                    int OrderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    Order o = new Order(OrderID, OrdDate, shipDate, status, accID);
                    list.add(o);
                }
            }
        }
        cn.close();
        return list;
    }

    public static int updateStatusOfOrder(int OrderID) throws Exception {
        int kq = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Orders\n"
                    + "set status = 3\n"
                    + "where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, OrderID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }

    public static ArrayList<Order> getCanceledOrders(int AccID) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                    + "from Orders\n"
                    + "where status = 3 and AccID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int OrderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date shipDate = rs.getDate("shipdate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("AccID");
                    Order o = new Order(OrderID, OrdDate, shipDate, status, accID);
                    list.add(o);
                }
            }
        }
        cn.close();
        return list;
    }

    public static int orderAgain(int OrderID) throws Exception {
        int kq = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Orders\n"
                    + "set status = 1, OrdDate = ?, shipdate = ?\n"
                    + "where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            Date OrderDate = new Date(System.currentTimeMillis());
            Date shipdate = new Date(OrderDate.getTime() + 3 * (1000 * 60 * 60 * 24));
            pst.setDate(1, OrderDate);
            pst.setDate(2, shipdate);
            pst.setInt(3, OrderID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }

    public static ArrayList<Order> getOrderByDate(int AccID, Date from, Date to) throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Order> list = new ArrayList<>();
        String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                + "from Orders \n"
                + "where OrdDate between ? and ?\n"
                + "and AccID = ?";
        PreparedStatement pst = cn.prepareStatement(sql);
        pst.setDate(1, from);
        pst.setDate(2, to);
        pst.setInt(3, AccID);
        ResultSet rs = pst.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                Date OrderDate = rs.getDate("OrdDate");
                Date shipDate = rs.getDate("shipdate");
                int status = rs.getInt("status");
                int accID = rs.getInt("accID");
                Order order = new Order(orderID, OrderDate, shipDate, status, accID);
                list.add(order);
            }
        }
        cn.close();
        return list;
    }

    public static Date getMinDate(int accID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Date from = null;
        String sql = "select top 1 OrdDate from Orders where AccID = ? order by OrdDate";
        PreparedStatement pst = cn.prepareStatement(sql);
        pst.setInt(1, accID);
        ResultSet rs = pst.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                from = rs.getDate("OrdDate");
            }
        }
        return from;
    }

    public static HashMap<Order, String> getAllOrders() throws Exception {
        HashMap<Order, String> list = new HashMap<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select a.accID, o.OrderID, o.OrdDate, o.shipdate, o.status, a.fullname\n"
                    + "from Orders o\n"
                    + "join Accounts a\n"
                    + "on o.AccID = a.accID\n";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int accID = rs.getInt("AccID");
                    int OrderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    String fullName = rs.getString("fullname");
                    Order o = new Order(OrderID, OrdDate, shipDate, status, accID);
                    list.put(o, fullName);
                }
            }
        }
        cn.close();
        return list;
    }

    public static Date getMinDate() throws Exception {
        Connection cn = DBUtils.makeConnection();
        Date from = null;
        String sql = "select top 1 OrdDate from Orders order by OrdDate";
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if (rs != null) {
            while (rs.next()) {
                from = rs.getDate("OrdDate");
            }
        }
        return from;
    }

    public static HashMap<Order, String> getAllOrders(Date dateFrom, Date dateTo, String fullName) throws Exception {
        Connection cn = DBUtils.makeConnection();
        HashMap<Order, String> list = new HashMap<>();
        if (cn != null) {
            String sql = "select OrderID, OrdDate, shipdate, Orders.status, Orders.AccID, fullname\n"
                    + "from Orders \n"
                    + "join Accounts\n"
                    + "on Accounts.accID = Orders.AccID \n"
                    + "where OrdDate between ? and ?\n"
                    + "and fullname like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setDate(1, dateFrom);
            pst.setDate(2, dateTo);
            pst.setString(3, "%" + fullName + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date shipDate = rs.getDate("shipdate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("AccID");
                    String fullname = rs.getString("fullname");
                    Order o = new Order(orderID, OrdDate, shipDate, status, accID);
                    list.put(o, fullname);
                }
            }
        }
        return list;
    }

    public static HashMap<Order, String> getAllOrdersOfOne(int accID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        HashMap<Order, String> list = new HashMap<>();
        if (cn != null) {
            String sql = "select a.accID, o.OrderID, o.OrdDate, o.shipdate, o.status, a.fullname\n"
                    + "from Orders o\n"
                    + "join Accounts a\n"
                    + "on o.AccID = a.accID where a.accID = ?\n";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, accID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int AccID = rs.getInt("accID");
                    int OrderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date shipDate = rs.getDate("shipDate");
                    int status = rs.getInt("status");
                    String fullName = rs.getString("fullname");
                    Order o = new Order(OrderID, OrdDate, shipDate, status, AccID);
                    list.put(o, fullName);
                }
            }
        }
        return list;
    }

    public static Order getOrder(int orderID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Order o = null;
        if (cn != null) {
            String sql = "select OrderID, OrdDate, shipdate, status, AccID\n"
                    + "from Orders\n"
                    + "where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int OrderID = rs.getInt("OrderID");
                    Date OrdDate = rs.getDate("OrdDate");
                    Date ship = rs.getDate("shipdate");
                    int status = rs.getInt("status");
                    int accID  = rs.getInt("AccID");
                    o = new Order(OrderID, OrdDate, ship, status, accID);
                }
            } 
        }
        return o;
    }
    
    public static int CompleteOrder(int OrderID) throws Exception {
        int kq = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Orders\n"
                    + "set status = 2\n"
                    + "where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, OrderID);
            kq = pst.executeUpdate();
        }
        cn.close();
        return kq;
    }
}
