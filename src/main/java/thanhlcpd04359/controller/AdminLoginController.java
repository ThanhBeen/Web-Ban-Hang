package thanhlcpd04359.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import thanhlcpd04359.domain.Account;
import thanhlcpd04359.domain.Product;
import thanhlcpd04359.model.AdminLoginDto;
import thanhlcpd04359.service.AccountService;
import thanhlcpd04359.service.ProductService;
import thanhlcpd04359.service.UserService;

import java.util.List;


@Controller
public class AdminLoginController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private ProductService productService;

	@Autowired
	private HttpSession session;
	


	@PostMapping("alogin")
	public ModelAndView login(ModelMap model,
			@Valid @ModelAttribute("account") AdminLoginDto dto,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("/admin/accounts/loginnn", model);
		}
		System.out.println(dto.getPassword());
		Account account = accountService.login(dto.getUsername(), dto.getPassword());

		if (account == null) {
			model.addAttribute("message", "Invalid username or password");
			return new ModelAndView("/admin/accounts/loginnn", model);
		}
		session.setAttribute("username", account.getUsername());


		Object ruri = session.getAttribute("redirect-uri");

		if(ruri != null) {
			session.removeAttribute("redirect-uri");
			return new ModelAndView("redirect:" + ruri);
		}

//		List<Product> data = productService.findByCategoryId();
//		model.addAttribute("data", data);

		return new ModelAndView("admin/web/index", model);
	}
	

	@GetMapping("alogin")
	public String login(ModelMap model) {
		model.addAttribute("account", new AdminLoginDto());
		return "/admin/accounts/loginnn";
	}

	@RequestMapping("/alogin/success")
	public String success(Model model){
		model.addAttribute("message", "Dang nhap thanh cong");
		return "admin/web/index";
	}

	@GetMapping("alogin/error")
	public String loginError(ModelMap model) {
		model.addAttribute("message", "Username or password khong chinh xac");
		return "/admin/accounts/loginnn";
	}

	@RequestMapping("/alogoff/success")
	public String logoff(Model model){
		model.addAttribute("message", "Dang xuat thanh cong");
		return "redirect:/alogin";
	}

	@RequestMapping("/auth/unauthoried")
	public String denied(Model model){
		model.addAttribute("message", "Ban khong co quyen truy xuat");
		return "/admin/accounts/loginnn";
	}

	@Autowired
	UserService userService;

    @RequestMapping("/oauth2/login/success")
    public String success(OAuth2AuthenticationToken oauth2){
        userService.loginFormOAuth2(oauth2);
		session.setAttribute("username", oauth2.getPrincipal().getAttribute("name"));
        return "forward:/alogin/success";
	}






}	
