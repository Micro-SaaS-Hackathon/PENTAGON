package az.company.saaslocalordersystemms.model.order;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TakeOrderRequest {
    private Long orderId;
    @NotNull(message = "Please insert tableName")
    private Long tableNo;
}
