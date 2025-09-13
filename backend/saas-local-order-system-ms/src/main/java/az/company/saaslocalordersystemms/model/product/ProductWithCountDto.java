package az.company.saaslocalordersystemms.model.product;

import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductWithCountDto {
    private Long productId;

    @Min(value = 0, message = "Quantity must be at least 1")
    private Integer quantity;
}
