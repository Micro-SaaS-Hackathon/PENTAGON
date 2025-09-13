package az.company.saaslocalordersystemms.service.impl;

import az.company.saaslocalordersystemms.dao.entity.Order;
import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.dao.repository.OrderRepository;
import az.company.saaslocalordersystemms.enums.OrderStatus;
import az.company.saaslocalordersystemms.model.product.ProductDetailsWithCount;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import az.company.saaslocalordersystemms.service.OrderService;
import az.company.saaslocalordersystemms.service.ProductService;
import az.company.saaslocalordersystemms.service.QrService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final ProductService productService;
    private final QrService qrService;
    private final ObjectMapper objectMapper;

    @Override
    @Transactional
    @SneakyThrows
    public MultipartFile saveOrderAndReturnQrDetails(List<ProductWithCountDto> productWithCountDtoList) {
        BigDecimal totalAmount = BigDecimal.ZERO;
        List<ProductDetailsWithCount> detailsWithCounts = new ArrayList<>();

        for (ProductWithCountDto item : productWithCountDtoList) {
            Product product = productService.findEntityById(item.getProductId());
            totalAmount = totalAmount.add(BigDecimal.valueOf(product.getPrice()))
                    .multiply(BigDecimal.valueOf(item.getQuantity()));
            detailsWithCounts.add(new ProductDetailsWithCount(product, item.getQuantity()));
        }


        Order order = Order.builder()
                .orderDate(LocalDateTime.now())
                .products(detailsWithCounts)
                .status(OrderStatus.PROCESSING)
                .totalAmount(totalAmount)
                .build();
        orderRepository.save(order);

        log.info("Total amount: {}", totalAmount);

        return qrService.generateQr(String.format("{\"orderId\": \"%s\"}", order.getId()));
    }
}
