package az.company.saaslocalordersystemms.service;

import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.model.product.ProductResponse;

import java.util.List;

public interface ProductService {

    List<ProductResponse> getAll();
    Product findEntityById(Long id);
}
