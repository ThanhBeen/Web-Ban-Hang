package thanhlcpd04359.service;

import thanhlcpd04359.domain.OrderDetail;

import java.util.List;

public interface OrderDetailService {
    List<OrderDetail> findAll();


    List<OrderDetail>  findByOrderId(Integer id);
}
