package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CategoryDTO;
import org.example.aad_assignment.DTO.ProductDTO;

import java.util.List;

public class ProductService {
        private ProductSetServlet productSet;

        public ProductService() {
            this.productSet = new ProductSetServlet();
        }

        // Get all products
        public List<ProductDTO> getProducts() {
            return productSet.getAllCategories();  // fixed to match ProductDTO
        }

        // Get a single product by code
        public ProductDTO getProductByCode(int code) {
            return productSet.getProductByCode(code);  // fixed to return ProductDTO
        }
    }


