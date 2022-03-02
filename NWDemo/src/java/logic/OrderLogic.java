/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.util.ArrayList;
import models.Order;
import models.OrderDetails;

/**
 *
 * @author black
 */
public class OrderLogic {
    Order order;
    ArrayList<OrderDetails> details;

    public OrderLogic(Order order, ArrayList<OrderDetails> details) {
        this.order = order;
        this.details = details;
    }
    
    public void insertOrder(){
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO detaildao = new OrderDetailDAO();
        int orderid = orderDAO.InsertOrderInfo(order);
        for(OrderDetails detail: details){
            detail.setOrderID(orderid);
            detaildao.InsertOrderDetail(detail);
        }
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ArrayList<OrderDetails> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDetails> details) {
        this.details = details;
    }
    
}
