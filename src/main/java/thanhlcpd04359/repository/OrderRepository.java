package thanhlcpd04359.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import thanhlcpd04359.domain.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query("SELECT o FROM Order o WHERE o.account.username like ?1")
    List<Order> findByUsername(String username);
}
