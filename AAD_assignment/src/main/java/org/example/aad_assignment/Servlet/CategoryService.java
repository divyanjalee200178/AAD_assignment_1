package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CategoryDTO;

import java.util.List;

public class CategoryService {
    private CategorySetServlet categorySet;

    public CategoryService() {
        this.categorySet = new CategorySetServlet();
    }

    // Get all categories
    public List<CategoryDTO> getCategories() {
        return categorySet.getAllCategories();
    }

    // Get a single category by code
    public CategoryDTO getCategoryByCode(int code) {
        return categorySet.getCategoryByCode(code);
    }
}

