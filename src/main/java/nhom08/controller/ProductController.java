package nhom08.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nhom08.entity.*;
import nhom08.service.CategoryService;
import nhom08.service.ImageService;
import nhom08.service.ProductService;

@Controller
@RequestMapping({ "/san-pham", "/product" })
public class ProductController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;;

	@GetMapping("/id={productID}")
	public String getProduct(@PathVariable int productID, Model theModel) {

		Product product = productService.getProduct(productID);
		System.out.println("hihi " + product);
		if (product == null) {
			throw new RuntimeException("Không tìm thấy id  product : " + productID);
		}
		Category category = product.getCategory();

		List<Image> imgs = imageService.getImagesByProductID(productID);
		for (Image i : imgs)
			System.out.println(i);
		int cnt = 0;
		List<Product> products = new ArrayList<Product>();
		for (Product p : productService.getProducts()) {
			if (p.getCategory().getCategoryID() == category.getCategoryID()) {
				products.add(p);
				cnt++;
			}
			if (cnt == 4)
				break;
		}

		theModel.addAttribute("product", product);
		theModel.addAttribute("category", category);
		theModel.addAttribute("img", imgs);
		theModel.addAttribute("desc", product.getDescription());
		theModel.addAttribute("sam_product", products);
		return "customer/ChiTietSanPham";
	}

}
