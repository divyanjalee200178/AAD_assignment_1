package org.example.aad_assignment.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartItemDTO {
    private String customerId;
    private String customerName;
    private String productName;
    private int quantity;
    private double unitPrice;
    private double totalPrice;


}
