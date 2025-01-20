package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "CategorySaveServlet", value = "/category-save")
@MultipartConfig(maxFileSize = 169999999)  // Max file size for uploads
public class CategorySaveServlet extends HttpServlet {

    String DB_URL="jdbc:mysql://localhost/Management_system";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";
    private static final String UPLOAD_DIR = "uploads/images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("category_name");
        String qtyString = req.getParameter("category_qty");
        Part imagePart = req.getPart("images");

        int qty = 0;
        try {
            if (qtyString != null && !qtyString.isEmpty()) {
                qty = Integer.parseInt(qtyString);
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("category-save.jsp?error=Invalid quantity value");
            return;
        }

        String imagePath = null;
        if (imagePart != null) {
            String fileName = getFileName(imagePart);
            String extension = getFileExtension(fileName);


            String uniqueFileName = UUID.randomUUID().toString() + extension;
            Path uploadPath = Path.of(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR, uniqueFileName);

            File uploadDir = new File(uploadPath.getParent().toString());
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            try (InputStream inputStream = imagePart.getInputStream()) {
                Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
            }
            imagePath = UPLOAD_DIR + "/" + uniqueFileName;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

            String sql = "INSERT INTO category (name, qty, image_path) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, name);
                preparedStatement.setInt(2, qty);
                if (imagePath != null) {
                    preparedStatement.setString(3, imagePath);
                } else {
                    preparedStatement.setNull(3, java.sql.Types.VARCHAR);
                }

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    resp.sendRedirect("category-save.jsp?message=Category saved successfully");
                } else {
                    resp.sendRedirect("category-save.jsp?error=Category save failed");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("category-save.jsp?error=Database error occurred");
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("Content-Disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return (dotIndex > 0) ? fileName.substring(dotIndex) : "";
    }
}
