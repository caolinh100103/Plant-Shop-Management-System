/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import basicobjects.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author linh1
 */
public class OrderDetailDAO {

    public static ArrayList<OrderDetail> getOrderDetail(int OrderID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<OrderDetail> list = new ArrayList<>();
        if (cn != null) {
            String sql = "select DetailId, OrderID, FID, quantity, PName, PID, price, imgPath\n"
                    + "from OrderDetails\n"
                    + "join Plants\n"
                    + "on OrderDetails.FID = Plants.PID\n"
                    + "where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, OrderID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int detailID = rs.getInt("DetailId");
                    int orderid = rs.getInt("OrderID");
                    int plantID = rs.getInt("FID");
                    int quantity = rs.getInt("quantity");
                    String pName = rs.getString("PName");
                    int pID = rs.getInt("PID");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    OrderDetail o = new OrderDetail(detailID, orderid, plantID, pName, price, imgPath, quantity);
                    list.add(o);
                }
            }
        }
        return list;
    }
}
