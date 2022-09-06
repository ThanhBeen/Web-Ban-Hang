package thanhlcpd04359.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import thanhlcpd04359.domain.Authoritie;
import thanhlcpd04359.domain.Category;
import thanhlcpd04359.domain.Order;
import thanhlcpd04359.domain.OrderDetail;
import thanhlcpd04359.service.AuthoritieService;
import thanhlcpd04359.service.CategoryService;
import thanhlcpd04359.service.OrderDetailService;
import thanhlcpd04359.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest")
public class TestRest {
    @Autowired
    AuthoritieService authoritieService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;


    @GetMapping("/auth")
    public List<Authoritie> getAll(Model model){
        return authoritieService.findAll();
    }

    @GetMapping("/auth2")
    public List<Order> getAll2(Model model){
        return orderService.findAll();
    }

    @GetMapping("/auth3")
    public List<OrderDetail> getAll3(Model model){
        return orderDetailService.findAll();
    }

    @GetMapping("/orders/{id}")
    public Order getOne(@PathVariable("id") Integer id){
        return orderService.findById(id);
    }

    @GetMapping("/list")
    public List<Order> list(Model model, HttpServletRequest request){
        String username = request.getRemoteUser();
        System.out.println("user: " + username);
        return orderService.findByUsername(username);
    }
}
