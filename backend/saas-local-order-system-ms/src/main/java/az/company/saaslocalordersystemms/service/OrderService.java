package az.company.saaslocalordersystemms.service;

import az.company.saaslocalordersystemms.model.product.ProductWithCountDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface OrderService {

    MultipartFile saveOrderAndReturnQrDetails(List<ProductWithCountDto> productWithCountDtoList);
}
