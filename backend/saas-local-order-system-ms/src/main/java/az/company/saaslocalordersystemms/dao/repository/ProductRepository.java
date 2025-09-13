package az.company.saaslocalordersystemms.dao.repository;

import az.company.saaslocalordersystemms.dao.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
