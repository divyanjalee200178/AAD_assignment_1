package org.example.aad_assignment.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartDTO {
    private int id;
    private String customerName;
    private int productCode;
    private String productName;
    private double price;
    private int qty;
    private double totalPrice;

    public CartDTO(int id, int productCode, String productName, double price, int qty, double totalPrice, String customerName) {
        this.id = id;
        this.productCode = productCode;
        this.productName = productName;
        this.price = price;
        this.qty = qty;
        this.totalPrice = totalPrice;
        this.customerName = customerName;
    }

    public CartDTO(String customerName, String productName, int qty, double price, double totalPrice) {
        this.customerName = customerName;
        this.productName = productName;
        this.qty = qty;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    public CartDTO(int productCode, String productName, double price, int qty, double totalPrice, String customerName) {
        this.productCode = productCode;
        this.productName = productName;
        this.price = price;
        this.qty = qty;
        this.totalPrice = totalPrice;
        this.customerName = customerName;
    }

    public CartDTO(String customerName, int productCode, String productName, int qty, double price, double totalPrice) {
        this.customerName=customerName;
        this.productCode = productCode;
        this.productName = productName;
        this.qty = qty;
        this.price = price;
        this.totalPrice = totalPrice;

    }

    @Override
    public String toString() {
        return "CartDTO{productId=" + productCode + ", quantity=" + qty + "}";
    }
}
