package thanhlcpd04359.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import thanhlcpd04359.domain.Category;
import thanhlcpd04359.service.CategoryService;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/category")
public class CategoryRestController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("")
    public List<Category> getAll(Model model){
        return categoryService.findAll();
    }
}
