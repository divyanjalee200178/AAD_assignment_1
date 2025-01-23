package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
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
import java.util.UUID;

@WebServlet (name = "ProductSaveServlet", value = "/product-save")
@MultipartConfig(maxFileSize = 169999999)
public class ProductSaveServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";
    private static final String UPLOAD_DIR = "uploads/image";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name=req.getParameter("item_name");
        int qty= Integer.parseInt(req.getParameter("item_qty"));
        double unitPrice= Double.parseDouble(req.getParameter("item_unitPrice"));
        Part imagePart = req.getPart("image");

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


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql=" INSERT INTO product (name, qty, unitPrice, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,name);
            pstm.setInt(2,qty);
            pstm.setDouble(3,unitPrice);



            if (imagePath != null) {
                pstm.setString(4, imagePath);
            } else {
                pstm.setNull(4, java.sql.Types.VARCHAR);
            }

            int effectRowCount=pstm.executeUpdate();
            if (effectRowCount>0){
                resp.sendRedirect(
                        "product-save.jsp?message=Product saved successfully"
                );
            }else {
                resp.sendRedirect(
                        "product-save.jsp?message=Product saved unsuccessfully"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "product-save.jsp?=Product saved successfully"
            );
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
