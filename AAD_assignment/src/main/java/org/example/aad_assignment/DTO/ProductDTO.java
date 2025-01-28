package org.example.aad_assignment.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private int code;
    private String name;
    private int qty;
    private double unitPrice;
    private String imagePath;
    private int c_code;


    public ProductDTO(int code, String name, int qty, double unitPrice, String imagePath,int c_code) {
        this.code = code;
        this.name = name;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.imagePath = imagePath;
        this.c_code=c_code;
    }

    public ProductDTO(int code, String name, int qty, double unitPrice, String imagePath) {
        this.code = code;
        this.name = name;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.imagePath = imagePath;
    }

}
