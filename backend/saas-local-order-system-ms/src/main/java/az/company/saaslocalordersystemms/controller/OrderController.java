package az.company.saaslocalordersystemms.controller;

import az.company.saaslocalordersystemms.model.order.OrderRequest;
import az.company.saaslocalordersystemms.model.order.OrderResponse;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import az.company.saaslocalordersystemms.model.qr.QrDetails;
import az.company.saaslocalordersystemms.service.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @PostMapping
    public ResponseEntity<OrderResponse> takeOrder(@RequestBody @Valid OrderRequest orderRequest) {

        return null;
    }


    @PostMapping("/generate-qr")
    public MultipartFile saveOrderAndReturnQrDetails(@RequestBody @Valid List<ProductWithCountDto> productWithCountDtoList){
        return orderService.saveOrderAndReturnQrDetails(productWithCountDtoList);
    }
}
