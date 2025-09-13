package az.company.saaslocalordersystemms.service.impl;

import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.dao.repository.ProductRepository;
import az.company.saaslocalordersystemms.exception.CommonException;
import az.company.saaslocalordersystemms.exception.ExceptionEnum;
import az.company.saaslocalordersystemms.mapper.ProductMapper;
import az.company.saaslocalordersystemms.model.product.ProductResponse;
import az.company.saaslocalordersystemms.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;

    @Override
    public List<ProductResponse> getAll() {
        List<Product> productList = productRepository.findAll();
        return productMapper.mapToResponseList(productList);
    }

    @Override
    public Product findEntityById(Long id) {
        return productRepository.findById(id).orElseThrow(
                () -> new CommonException(ExceptionEnum.PRODUCT_NOT_FOUND_WITH_PROVIDED_ID_EXCEPTION)
        );
    }
}
