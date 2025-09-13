package az.company.saaslocalordersystemms.model.order;

import az.company.saaslocalordersystemms.enums.OrderStatus;
import az.company.saaslocalordersystemms.model.product.ProductDetailsWithCount;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponse {

    private Long id;
    private Long tableNo;
    private LocalDateTime orderDate;
    private OrderStatus status;
    private BigDecimal totalAmount;
    private List<ProductDetailsWithCount> products;

}
