package thanhlcpd04359.controller.admin;




import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import thanhlcpd04359.domain.Account;
import thanhlcpd04359.domain.Product;
import thanhlcpd04359.model.AccountDto;
import thanhlcpd04359.service.AccountService;
import thanhlcpd04359.service.ProductService;


@Controller
@RequestMapping("admin/accounts")
public class AccountController {
	@Autowired
	AccountService accountService;

	@Autowired
	ProductService productService;
	
	@GetMapping("add")
	public String add(Model model) {
		model.addAttribute("account", new AccountDto());
		
		return "admin/accounts/addOrEdit";
	}
	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model , 
			@Valid @ModelAttribute("account")AccountDto dto, 
			BindingResult result) {
	     if(result.hasErrors()) {
	    	 return new ModelAndView("admin/accounts/addOrEdit");
	     }

		
		Account entity = new Account();
		BeanUtils.copyProperties(dto, entity);
		System.out.print(entity.getUsername());
		accountService.save(entity);
		model.addAttribute("message","Account is saved!");
		
		return new ModelAndView("forward:/admin/accounts" ,  model);
	}
	@RequestMapping("")
	public String list(ModelMap model) {
		List<Account> list = accountService.findAll();	
		
		model.addAttribute("accounts", list);
		
		return "admin/accounts/list";
	}
	@GetMapping("edit/{username}")
	public ModelAndView edit(ModelMap model, @PathVariable("username") String username) {
		
		Optional<Account> opt = accountService.findById(username);
		
		AccountDto dto = new AccountDto();
		
		if (opt.isPresent()) {
			Account entity = opt.get();
			
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);
			
			dto.setPassword("");
			
			model.addAttribute("account", dto);
			
			return new ModelAndView("admin/accounts/addOrEdit",model);
		}
		
		model.addAttribute("message", "Account is not existed");
		
		return new ModelAndView("forward:/admin/accounts", model);
		
	}
	@GetMapping("delete/{username}")
	public ModelAndView delete(ModelMap model, @PathVariable("username")String username) {
		
		accountService.deleteById(username);
		
		model.addAttribute("message","account is deleted!");
		
		return new ModelAndView( "forward:/admin/accounts", model);
	}
	
	@RequestMapping("index")
	public String index(Model model) {
		List<Product> data = productService.findByCategoryId();
		model.addAttribute("data", data);
		return "admin/web/index";
	}
	
	@RequestMapping("about")
	public String aboutUs(Model model) {
		List<Product> data = productService.findByCategoryId();
		model.addAttribute("data", data);
		return "admin/web/about";
	}
	
	@RequestMapping("products")
	public String products() {
		return "admin/web/products";
	}
	
	@RequestMapping("single")
	public String singleProducts() {

		return "admin/web/single-product";
	}
	
	@RequestMapping("contact")
	public String contact() {
		return "admin/web/contact";
	}


//	@GetMapping("search")
//	public String search(ModelMap model,
//			@RequestParam(name = "name", required = false)String name) {
//		List<account> list = null;
//		if (StringUtils.hasText(name)) {
//			list = categporyService.findByNameContaining(name);
//		}else {
//			list = categporyService.findAll();
//		}
//		
//		model.addAttribute("accounts", list);
//		return "admin/accounts/search";
//	}
//	@GetMapping("searchpaginated")
//	public String search(ModelMap model,
//			@RequestParam(name = "name", required = false)String name,
//			@RequestParam("page")Optional<Integer> page,
//			@RequestParam("size")Optional<Integer> size) {
//		
//		int currentPage = page.orElse(1);
//		int pageSize = size.orElse(5);
//		
//		Pageable pageable = PageRequest.of(currentPage-1, pageSize, Sort.by("name"));
//		Page<account> resultPage = null;
//		
//		
//		if (StringUtils.hasText(name)) {
//			resultPage = categporyService.findByNameContaining(name, pageable);
//			model.addAttribute("name",name);
//		}else {
//			resultPage = categporyService.findAll(pageable);
//		}
//		
//		int totalPages = resultPage.getTotalPages();
//		if (totalPages > 0) {
//			int start = Math.max(1, totalPages - 2);
//			int end = Math.min(currentPage + 2, totalPages);
//			
//			if (totalPages > 5) {
//				if(end == totalPages ) start = end - 5;
//				else if (start == 1)end = start + 5;
//			}
//			List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
//				.boxed() 
//				.collect(Collectors.toList());
//			model.addAttribute("pageNumber", pageNumbers);
//		}
//		
//		model.addAttribute("accountPage", resultPage);
//		return "admin/accounts/searchpaginated";
//	}
}
