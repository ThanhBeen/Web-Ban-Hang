package thanhlcpd04359.service;

import com.fasterxml.jackson.databind.JsonNode;
import thanhlcpd04359.domain.Order;

import java.util.List;

public interface OrderService {
    List<Order> findAll();

    Order create(JsonNode orderData);

    Order findById(Integer id);

    List<Order> findByUsername(String username);
}
