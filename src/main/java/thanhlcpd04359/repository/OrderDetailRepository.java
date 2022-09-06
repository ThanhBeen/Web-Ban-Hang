package thanhlcpd04359.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import thanhlcpd04359.domain.OrderDetail;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
    @Query("SELECT o FROM OrderDetail o WHERE o.order.orderId = ?1")
    List<OrderDetail> findByOrderId(Integer id);
}
