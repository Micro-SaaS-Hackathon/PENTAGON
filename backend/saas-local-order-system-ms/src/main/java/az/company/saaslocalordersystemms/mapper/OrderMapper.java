package az.company.saaslocalordersystemms.mapper;

import az.company.saaslocalordersystemms.dao.entity.Order;
import az.company.saaslocalordersystemms.model.order.OrderResponse;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface OrderMapper {

    OrderResponse mapToResponse(Order order);
}
