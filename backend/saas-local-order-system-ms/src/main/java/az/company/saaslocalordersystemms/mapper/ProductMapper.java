package az.company.saaslocalordersystemms.mapper;

import az.company.saaslocalordersystemms.dao.entity.Product;
import az.company.saaslocalordersystemms.model.product.ProductResponse;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ProductMapper {

    List<ProductResponse> mapToResponseList(List<Product> productResponseList);
}
