package az.company.saaslocalordersystemms.service.impl;

import az.company.saaslocalordersystemms.dao.entity.Order;
import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.dao.repository.OrderRepository;
import az.company.saaslocalordersystemms.enums.OrderStatus;
import az.company.saaslocalordersystemms.exception.CommonException;
import az.company.saaslocalordersystemms.exception.ExceptionEnum;
import az.company.saaslocalordersystemms.mapper.OrderMapper;
import az.company.saaslocalordersystemms.model.order.OrderResponse;
import az.company.saaslocalordersystemms.model.order.TakeOrderRequest;
import az.company.saaslocalordersystemms.model.product.ProductDetailsWithCount;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import az.company.saaslocalordersystemms.service.OrderService;
import az.company.saaslocalordersystemms.service.ProductService;
import az.company.saaslocalordersystemms.service.QrService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

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
    private final OrderMapper orderMapper;

    @Override
    @Transactional
    @SneakyThrows
    public OrderResponse saveOrderAndReturnQrDetails(List<ProductWithCountDto> productWithCountDtoList) {
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

        String filePath = qrService.generateQr(String.format("{\"orderId\": \"%s\"}", order.getId()));
        order.setQrPath(filePath);
        orderRepository.save(order);
        return orderMapper.mapToResponse(order);
    }

    @Override
    public Resource getOrderQrImage(Long orderId) {
        Order order = getOrderEntity(orderId);

        return qrService.getQrWithPath(order.getQrPath());
    }

    @Override
    public OrderResponse takeOrder(TakeOrderRequest takeOrderRequest) {
        Order order = getOrderEntity(takeOrderRequest.getOrderId());
        order.setStatus(OrderStatus.PROCESSING);
        order.setTableNo(takeOrderRequest.getTableNo());
        orderRepository.save(order);
        return orderMapper.mapToResponse(order);
    }

    public Order getOrderEntity(Long orderId) {
        return orderRepository.findById(orderId).orElseThrow(
                () -> new CommonException(ExceptionEnum.ORDER_NOT_FOUND_WITH_PROVIDED_ID_EXCEPTION)
        );
    }
}
