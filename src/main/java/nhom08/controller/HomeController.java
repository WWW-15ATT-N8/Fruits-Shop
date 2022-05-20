package nhom08.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import nhom08.entity.Cart;
import nhom08.entity.Category;
import nhom08.entity.Order;
import nhom08.entity.Product;
import nhom08.entity.User;
import nhom08.service.CartService;
import nhom08.service.CategoryService;
import nhom08.service.ImageService;
import nhom08.service.ProductService;
import nhom08.service.UserService;

@Controller
@RequestMapping("")
public class HomeController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping({ "/", "/trang-chu", "/home" })
	public String home(HttpServletRequest request, HttpSession session, Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			User u = new User();
			String phone = authentication.getName();
			u = userService.getUserbyPhone(phone);
			List<Cart> carts  =  cartService.getCartsbyUserID(u.getUserID());
			double total = 0.0;
			for(Cart c : carts)
				total += c.getAmount()*c.getProduct().getPrice();
				
			session.setAttribute("USER",u);
			session.setAttribute("total",total);
		}
		
		if(session.getAttribute("category") == null) {
			List<Category> categories = categoryService.getCategories();
			session.setAttribute("category", categories);
		}
			

		List<Product> products = productService.getProducts();
		List<Product> newProducts = new ArrayList<Product>();
		List<Product> bestSalerProducts = new ArrayList<Product>();
		for (Product p : products) {
			if (p.isNewProduct())
				newProducts.add(p);
			if (p.isBestSaler())
				bestSalerProducts.add(p);
		}
		
		theModel.addAttribute("list_new_product", newProducts);
		theModel.addAttribute("list_best_saler_product", bestSalerProducts);
		return "customer/Home";
	}
	
	@GetMapping("/vevinfruits")
	public String gioiThieu() {
		return "customer/GioiThieu";
	}

	@GetMapping("/dichvu")
	public String dichVu() {
		return "customer/DichVu";
	}

	@GetMapping("/logout")
	public String Logout(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("USER");
		session.removeAttribute("total");
		return "redirect:/";
	}
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "access-denied";
	}
	
	@GetMapping("/Roboto-Regular.ttf")
	public String showRoboto() {
		return "redirect:/";
	}
	
}
