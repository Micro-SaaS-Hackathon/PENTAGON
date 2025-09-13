package az.company.saaslocalordersystemms.controller;

import az.company.saaslocalordersystemms.model.order.OrderResponse;
import az.company.saaslocalordersystemms.model.order.TakeOrderRequest;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import az.company.saaslocalordersystemms.service.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @PostMapping("/take/{orderId}")
    public OrderResponse takeOrder(@RequestBody @Valid TakeOrderRequest takeOrderRequest) {
        return orderService.takeOrder(takeOrderRequest);
    }


    @PostMapping("/generate-qr")
    public OrderResponse saveOrderAndReturnQrDetails(@RequestBody @Valid List< @Valid ProductWithCountDto> productWithCountDtoList) {
        return orderService.saveOrderAndReturnQrDetails(productWithCountDtoList);
    }

    @GetMapping("/{orderId}/qr")
    public Resource getOrderQrImage(@PathVariable Long orderId) {
        return orderService.getOrderQrImage(orderId);
    }
}
