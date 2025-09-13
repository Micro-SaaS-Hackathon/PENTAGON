package az.company.saaslocalordersystemms.service;

import az.company.saaslocalordersystemms.model.order.OrderResponse;
import az.company.saaslocalordersystemms.model.order.TakeOrderRequest;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import org.springframework.core.io.Resource;

import java.util.List;

public interface OrderService {

    OrderResponse saveOrderAndReturnQrDetails(List<ProductWithCountDto> productWithCountDtoList);

    Resource getOrderQrImage(Long orderId);

    OrderResponse takeOrder(TakeOrderRequest takeOrderRequest);
}
