package org.example.aad_assignment.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    int code;
    String name;
    int qty;
    double unitPrice;
    private String imagePath;

    public ProductDTO(int code, String name, int qty, double unitPrice, String imagePath) {
        this.code = code;
        this.name = name;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.imagePath = imagePath;
    }

}
