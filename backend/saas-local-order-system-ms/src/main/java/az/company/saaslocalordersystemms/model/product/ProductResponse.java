package az.company.saaslocalordersystemms.model.product;

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
public class ProductResponse {

    private Long id;
    private String productImage;
    private String name;
    private String shortDescription;
    private Double price;
}
