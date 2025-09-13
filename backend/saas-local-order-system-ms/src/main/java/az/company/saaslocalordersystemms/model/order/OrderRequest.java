package az.company.saaslocalordersystemms.model.order;

import az.company.saaslocalordersystemms.model.product.ProductResponse;
import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderRequest {
    private List<ProductWithCountDto> productList;

}
