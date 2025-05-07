package co.edu.uptc.firstjavawebapp.model;

public class Order {
    private String orderId;
    private String customerDocument;
    private String orderDate;
    private String productDescription;
    private String orderStatus; // Created, To be shipped, Shipped

    // Constructor
    public Order(String orderId, String customerDocument, String orderDate,
                 String productDescription, String orderStatus) {
        this.orderId = orderId;
        this.customerDocument = customerDocument;
        this.orderDate = orderDate;
        this.productDescription = productDescription;
        this.orderStatus = orderStatus;
    }

    // Getters and Setters
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerDocument() {
        return customerDocument;
    }

    public void setCustomerDocument(String customerDocument) {
        this.customerDocument = customerDocument;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
