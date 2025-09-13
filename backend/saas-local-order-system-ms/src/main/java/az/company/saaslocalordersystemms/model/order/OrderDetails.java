package az.company.saaslocalordersystemms.model.order;

import az.company.saaslocalordersystemms.enums.OrderStatus;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetails {
    private Long id;

    @NotNull
    private Long tableNo;

    @NotNull
    private String orderDate;

    @NotNull
    private OrderStatus status;

    @NotNull
    @DecimalMin(value = "0.0", inclusive = false, message = "Total amount must be positive")
    @Digits(integer = 8, fraction = 2, message = "Total amount must have max 8 digits and 2 decimals")
    private BigDecimal totalAmount;
}
