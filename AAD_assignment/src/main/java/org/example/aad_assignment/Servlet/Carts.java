package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CartDTO;

import java.util.List;

public class Carts {
    private CartSet cartSet;

    public Carts() {
        this.cartSet = new CartSet();
    }

    public List<CartDTO> getCategories() {
        return cartSet.getAllCategories();
    }

    public CartDTO getCartById(int id) {
        return cartSet.getCartById(id);
    }
}
