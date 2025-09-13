package az.company.saaslocalordersystemms.controller;

import az.company.saaslocalordersystemms.model.OrderRequest;
import az.company.saaslocalordersystemms.model.OrderResponse;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orders")
public class Order {

    @PostMapping
    public ResponseEntity<OrderResponse> takeOrder(@RequestBody @Valid OrderRequest orderRequest) {
        return null;
    }
}
