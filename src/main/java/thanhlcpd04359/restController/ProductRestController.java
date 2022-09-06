package thanhlcpd04359.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import thanhlcpd04359.domain.Product;
import thanhlcpd04359.repository.ProductRepository;
import thanhlcpd04359.service.ProductService;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@org.springframework.web.bind.annotation.RestController
@RequestMapping("/rest/products")

public class ProductRestController {

    @Autowired
    ProductService productService;

    @GetMapping("/{id}")
    public Product getOne(@PathVariable("id") Long id){
        Optional<Product> pp = productService.findById(id);
        if (pp.isPresent()){
            Product product = pp.get();
            return product;
        }
        return null;
    }

    @GetMapping("")
    public List<Product> getAll(){
        return productService.findAll();
    }

}
