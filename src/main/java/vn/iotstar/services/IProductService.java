package vn.iotstar.services;

import java.util.List;
import vn.iotstar.entity.Product;

public interface IProductService {
    void insert(Product product);

    void update(Product product);

    void delete(int id);

    Product findById(int id);

    List<Product> findAll();

    List<Product> findTop10Newest();

    List<Product> findAll(int page, int pagesize);

    int count();
}