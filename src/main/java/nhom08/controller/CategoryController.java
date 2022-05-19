package nhom08.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import nhom08.entity.Category;
import nhom08.entity.Product;
import nhom08.service.CategoryService;
import nhom08.service.ProductService;

@Controller
@RequestMapping({ "/danh-muc", "/category" })
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	private ProductService productService;

	@GetMapping("/id={categoryID}/page={pages}")
	public String listProductPage(@PathVariable int categoryID, @PathVariable int pages, Model model) {

		Category category = categoryService.getCategory(categoryID);
		if (category == null)
			return "redirect:/";
		int cnt = 0;
		List<Product> products = new ArrayList<Product>();
		for (Product p : productService.getProducts()) {
			if (p.getCategory().getCategoryID() == categoryID) {
				if (cnt > (pages - 1) * 8 && cnt <= pages * 8)
					products.add(p);
				cnt++;
			}
		}
		;
		model.addAttribute("products", products);
		model.addAttribute("category", category);
		model.addAttribute("size_product", cnt);
		model.addAttribute("page", pages);
		if (pages == 1)
			return "redirect:/category/" + categoryID;
		if (products.size() == 0)
			return "redirect:/category/" + categoryID;
		return "customer/DanhSachSanPham";
	}

	@GetMapping("/id={categoryID}")
	public String listProduct(@PathVariable int categoryID, Model model) {
		Category category = categoryService.getCategory(categoryID);
		int cnt = 0;
		List<Product> products = new ArrayList<Product>();
		for (Product p : productService.getProducts()) {
			if (p.getCategory().getCategoryID() == categoryID) {
				if (products.size() < 8)
					products.add(p);
				cnt++;
			}
		}
		;
		model.addAttribute("products", products);
		model.addAttribute("category", category);
		model.addAttribute("size_product", cnt);
		model.addAttribute("page", 1);
		return "customer/DanhSachSanPham";
	}

}
