package az.company.saaslocalordersystemms.dao.repository;

import az.company.saaslocalordersystemms.dao.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
