package vn.iotstar.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.services.ICategoryService;
import vn.iotstar.services.IProductService;
import vn.iotstar.services.impl.CategoryServiceImpl;
import vn.iotstar.services.impl.ProductServiceImpl;
import vn.iotstar.utils.Constant;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = {
        "/admin/products",
        "/admin/product/add",
        "/admin/product/insert",
        "/admin/product/edit",
        "/admin/product/update",
        "/admin/product/delete"
})
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService productService = new ProductServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();

        if (url.equals("/admin/products")) {
            List<Product> list = productService.findAll();
            req.setAttribute("listProduct", list);
            req.getRequestDispatcher("/views/admin/product_list.jsp").forward(req, resp);
        } else if (url.equals("/admin/product/add")) {
            req.setAttribute("listCate", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product_add.jsp").forward(req, resp);
        } else if (url.equals("/admin/product/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            req.setAttribute("product", product);
            req.setAttribute("listCate", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product_edit.jsp").forward(req, resp);
        } else if (url.equals("/admin/product/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            productService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String url = req.getServletPath();

        if (url.equals("/admin/product/insert") || url.equals("/admin/product/update")) {
            String productname = req.getParameter("productname");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int categoryid = Integer.parseInt(req.getParameter("categoryid"));
            Category cate = categoryService.findById(categoryid);

            Product product = new Product();
            if (url.equals("/admin/product/update")) {
                int productid = Integer.parseInt(req.getParameter("productid"));
                product = productService.findById(productid);
            }

            product.setProductname(productname);
            product.setPrice(price);
            product.setDescription(description);
            product.setCategory(cate);

            String uploadPath = Constant.DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists())
                uploadDir.mkdirs();

            Part part = req.getPart("imageFile");
            if (part != null && part.getSize() > 0) {
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String ext = filename.substring(filename.lastIndexOf(".") + 1);
                String fname = System.currentTimeMillis() + "." + ext;
                part.write(uploadPath + File.separator + fname);
                product.setImages(fname);
            }

            if (url.equals("/admin/product/insert")) {
                productService.insert(product);
            } else {
                productService.update(product);
            }
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        }
    }
}