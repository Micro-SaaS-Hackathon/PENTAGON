package az.company.saaslocalordersystemms.service.impl;

import az.company.saaslocalordersystemms.dao.entity.Order;
import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.dao.repository.OrderRepository;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import az.company.saaslocalordersystemms.model.qr.QrDetails;
import az.company.saaslocalordersystemms.service.OrderService;
import az.company.saaslocalordersystemms.service.ProductService;
import az.company.saaslocalordersystemms.service.QrService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final ProductService productService;
    private final QrService qrService;

    @Override
    public MultipartFile saveOrderAndReturnQrDetails(List<ProductWithCountDto> productWithCountDtoList) {
        Order order;
        BigDecimal totalAmount = BigDecimal.ZERO;
        for (ProductWithCountDto item : productWithCountDtoList){
            Product product = productService.findEntityById(item.getProductId());
            totalAmount.add(BigDecimal.valueOf(product.getPrice()));
        }

        log.info("Total amount: {}", totalAmount);
        return null;
    }
}
