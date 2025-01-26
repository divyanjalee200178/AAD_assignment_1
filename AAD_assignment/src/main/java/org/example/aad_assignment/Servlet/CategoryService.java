package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CategoryDTO;

import java.util.List;

public class CategoryService {
    private CategorySetServlet categorySet;

    public CategoryService() {
        this.categorySet = new CategorySetServlet();
    }

    public List<CategoryDTO> getCategories() {
        return categorySet.getAllCategories();
    }

    public CategoryDTO getCategoryByCode(int code) {
        return categorySet.getCategoryByCode(code);
    }
}

