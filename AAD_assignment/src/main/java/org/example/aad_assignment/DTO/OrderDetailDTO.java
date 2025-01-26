package org.example.aad_assignment.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
    private int id;
    private int orderId;
    private String productName;
    private int quantity;
    private Double unitPrice;
    private Double totalPrice;
}
