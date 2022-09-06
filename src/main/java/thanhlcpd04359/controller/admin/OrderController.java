package thanhlcpd04359.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import thanhlcpd04359.service.OrderDetailService;
import thanhlcpd04359.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("/checkout")
    public String checkout(){
        return "/admin/order/checkout";
    }

    @RequestMapping("/list")
    public String list(Model model, HttpSession session){
        String username = (String) session.getAttribute("username");
        model.addAttribute("orders", orderService.findByUsername("thanh"));
        return "/admin/order/list";
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model){
        try {
            model.addAttribute("order", orderService.findById(id));
            model.addAttribute("orderDetail", orderDetailService.findByOrderId(id));
            return "/admin/order/detail";
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Loi");
            return "admin/web/index";
        }
    }
}
