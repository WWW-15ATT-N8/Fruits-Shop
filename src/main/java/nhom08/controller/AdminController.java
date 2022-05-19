package nhom08.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import nhom08.entity.*;
import nhom08.service.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	public static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Charset UTF_8 = Charset.forName("UTF-8");
	public static final String PATH_CONTEXT = "/fruits-shop";
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private StatusService statusService;
	
	@RequestMapping({"", "/", "dashboard"})
	public String adminPage() {
		return "redirect:/admin/product/list";
	}
	
	@GetMapping({"/product","/product/","/product/list"})
	public String list(HttpServletRequest request, Model model, 
			@RequestParam(value = "bestSaler", required = false) String bestSaler,
			@RequestParam(value = "newProduct", required = false) String newProduct) {
		List<Product> products = null;
		List<Category> categories = categoryService.getCategories();
        // add the customers to the model
		
		if (request.getParameter("name") != null || 
				request.getParameter("category") != null ||
				request.getParameter("price") != null ||
				request.getParameter("stock") != null) {
			
			String name = request.getParameter("name");
			int categoryID = Integer.parseInt(request.getParameter("category"));
			String[] rangePrice = request.getParameter("price").split(";");
			String[] rangStock = request.getParameter("stock").split(";");
			boolean isBestSaler = bestSaler == null ? false : true;
			boolean isNewProduct = newProduct == null ? false : true;
			String pathBestSaler = isBestSaler ? "bestSaler=on" : "";
			String pathNewProduct = isNewProduct ? "newProduct=on" : "";
			
			products = productService.getProductsFilter(name, categoryID, isNewProduct, isBestSaler, rangePrice, rangStock);
			
			model.addAttribute("url" , PATH_CONTEXT + "/admin/product/list?name="+ name +"&category="+categoryID+"&"+pathBestSaler+"&"+pathNewProduct+"&price="+rangePrice[0]+"%3B"+rangePrice[1]+"&stock="+rangStock[0]+"%3B"+rangStock[1]+"&");
			model.addAttribute("categoryID", categoryID);
			model.addAttribute("bestSaler", isBestSaler);
			model.addAttribute("newProduct", isNewProduct);
			model.addAttribute("rangePrice", request.getParameter("price"));
		} else {
			products = productService.getProducts();
			model.addAttribute("url" , PATH_CONTEXT + "/admin/product/list?");
		}
		
		if (products == null) {
			products = new ArrayList<Product>();
		}
		
		PagedListHolder<Product> pagedListHolder = new PagedListHolder<Product>(products);
		
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		pagedListHolder.setPage(page - 1);
		pagedListHolder.setPageSize(10);
		pagedListHolder.getPage();
		
//		System.out.println(pagedListHolder);
		model.addAttribute("products", pagedListHolder);
		model.addAttribute("categories", categories);
		model.addAttribute("pageCount", pagedListHolder.getPageCount());
		model.addAttribute("pageCurrent", pagedListHolder.getPage());
		
		return "admin/admin-product-list";
	}
	
	@GetMapping("/product/create")
	public String create(Model model) {
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categories);
		return "admin/admin-product-form";
	}
	
	@PostMapping("/product/save")
    public String saveProduct(@ModelAttribute("product") Product product, @ModelAttribute("categoryID") int categoryID) {
		System.out.println(categoryID);
		Category category = categoryService.getCategory(categoryID);
		product.setCategory(category);
		productService.saveProduct(product);
        return "redirect:/admin/product/update?productID="+product.getProductID();
    }
	
	@GetMapping("/product/update")
	public String update(@RequestParam("productID") int id, Model model) {
		Product product = productService.getProduct(id);
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("categoryID", product.getCategory().getCategoryID());
		model.addAttribute("product", product);
		byte[] ptext = product.getName().getBytes(ISO_8859_1); 
		product.setName(new String(ptext, UTF_8)); 
		System.out.println();
		return "admin/admin-product-form";
	}
	
	@GetMapping("/product/delete")
	public String deleteProduct(@RequestParam("productID") int id) {

	     // delete the customer
		productService.deleteProduct(id);
		return "redirect:/admin/product/list";
	}
	

	
	@GetMapping({"/category", "/category/", "/category/list"})
	public String listCategory(HttpServletRequest request, Model model) {
        // add the customers to the model
		List<Category> categories = null;
		List<Category> categoriesFilter = new ArrayList<Category>();
		if (request.getParameter("name") != null || request.getParameter("rangeNumOfProduct") != null) {
			String name = request.getParameter("name");
			String rangeNumOfProduct = request.getParameter("rangeNumOfProduct");
			String[] rangePrice = rangeNumOfProduct.split(";");
			int min = Integer.parseInt(rangePrice[0]);
			int max = Integer.parseInt(rangePrice[1]);
			
			categories = categoryService.getCategoriesFilter(name);
			for (Category category : categories) {
				int numOfProduct = category.getProducts().size();
				if (numOfProduct <= max && numOfProduct >= min) {
					categoriesFilter.add(category);
				}
			}
			model.addAttribute("name", name);
			model.addAttribute("rangeNumOfProduct", rangeNumOfProduct);
			model.addAttribute("url" , PATH_CONTEXT + "/admin/category/list?name="+name+"&rangeNumOfProduct="+rangeNumOfProduct.replace(";", "%3B")+"&");
		} else {
			categories = categoryService.getCategories();
			model.addAttribute("url" , PATH_CONTEXT + "/admin/category/list?");
		}
		
		categories = categoriesFilter.size() == 0 ? categories : categoriesFilter;
		
		if (categories == null) {
			categories = new ArrayList<Category>();
		}
		
		PagedListHolder<Category> pagedListHolder = new PagedListHolder<Category>(categories);
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		pagedListHolder.setPage(page - 1);
		pagedListHolder.setPageSize(3);
		
//		System.out.println(pagedListHolder);
		model.addAttribute("categories", pagedListHolder);
		model.addAttribute("pageCount", pagedListHolder.getPageCount());
		model.addAttribute("pageCurrent", pagedListHolder.getPage());
		return "admin/admin-category-list";
	}
	
	@GetMapping("/category/create")
	public String createCategory(Model model) {
		model.addAttribute("category", new Category());
		return "admin/admin-category-form";
	}
	
	@PostMapping("/category/save")
    public String saveCategory(@ModelAttribute("category") Category category) {
		
        categoryService.saveCategory(category);
        return "redirect:/admin/category/list";
    }
	
	@GetMapping("/category/update")
	public String updateCategory(@RequestParam("categoryID") int id, Model model) {
		Category category = categoryService.getCategory(id);
		model.addAttribute("category", category);
		return "admin/admin-category-form";
	}
	
	@GetMapping("/category/delete")
	public String deleteCategory(@RequestParam("categoryID") int id) {

	     // delete the customer
		categoryService.deleteCategory(id);
		return "redirect:/admin/category/list";
	}
	
	@RequestMapping("/loadImgForm")
	public String showForm() {
		
		return "UploadImg";
	}

	@RequestMapping(value="/savefile",method=RequestMethod.POST)  
	public String upload(@RequestParam MultipartFile[] files,HttpServletRequest request, Model model){  
		String fileName = null;
		for (MultipartFile file : files) {
			fileName = saveImage(file, request);
			
			break;
		}
		System.out.println("img "+  fileName);
		model.addAttribute("fileName", fileName);
		return "upload-success";
	} 
	
	public String saveImage(MultipartFile file, HttpServletRequest request) {
		String filename = null;
		if (file != null && !file.isEmpty()) {
			try{  
				byte barr[]=file.getBytes();  
				String path = request.getServletContext().getRealPath("/");  
				String path2 = request.getContextPath();
				filename=file.getOriginalFilename();  
				
				path = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "");
				
				System.out.println(path+"src\\main\\webapp\\resources\\img\\"+filename);  
				
				BufferedOutputStream bout=new BufferedOutputStream(  
						new FileOutputStream(path+"src\\main\\webapp\\resources\\img\\"+filename));  
				bout.write(barr);  
				bout.flush();  
				bout.close();  
				return filename;
				
			}catch(Exception e){System.out.println(e);} 
		}
		return filename;
		
	}
	
	@GetMapping({"/order","/order/","/order/list"})
	public String listOrder(HttpServletRequest request, Model model) {
		List<Order> orders;
		if (request.getParameter("phone") != null && request.getParameter("statusID") != null && request.getParameter("filter") != null ) {
			int statusID = Integer.parseInt(request.getParameter("statusID"));
			int filter = Integer.parseInt(request.getParameter("filter"));
			String phone = request.getParameter("phone");
			model.addAttribute("phone", phone);
			model.addAttribute("statusID",statusID);
			model.addAttribute("filter",filter);
			String dieukien = "where ";
			boolean check = false;
			if(!phone.toString().trim().equals("")) {
				dieukien += " shipPhone = '" + phone +"' ";
				check = true;
			}
			if(statusID > 0) {
				if(check) dieukien += " and";
				dieukien += " statusID =" + statusID;
			}
			
			if(filter == 1){
				if(dieukien.equals("where "))
					dieukien = " order by createdAt desc";
				dieukien += " order by createdAt desc";
			} else if(filter == 2){
				if(dieukien.equals("where "))
					dieukien = " order by total asc";
				dieukien += " order by total asc";
			} else{
				if(dieukien.equals("where "))
					dieukien = " order by total desc";
				dieukien += " order by total desc";
			}
			
			if(dieukien.equals("where ")) 
				orders =  orderService.getOrdersByDK(" order by createdAt desc");
			else 
				orders =  orderService.getOrdersByDK(dieukien);
			
			model.addAttribute("url" , PATH_CONTEXT + "/admin/order/list?statusID="+String.valueOf(statusID)+"&filter=" + String.valueOf(filter) + "&phone=" +phone);
		} else {
			model.addAttribute("url" , PATH_CONTEXT + "/admin/order/list?");
			model.addAttribute("statusID",0);
			model.addAttribute("filter",1);
			orders =  orderService.getOrdersByDK(" order by createdAt desc");
		}
		
		List<Status> status = statusService.getStatuses();
		model.addAttribute("status",status );
		
		PagedListHolder<Order> pagedListHolder = new PagedListHolder<Order>(orders);
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		pagedListHolder.setPage(page - 1);
		pagedListHolder.setPageSize(10);
		
		
		model.addAttribute("orders", pagedListHolder);
		model.addAttribute("pageCount", pagedListHolder.getPageCount());
		model.addAttribute("pageCurrent", pagedListHolder.getPage());
		return "admin/admin-order-list";
	}
	
	@GetMapping("/order/detail")
	public String getOrder(@RequestParam("orderID") int orderID, Model theModel) {
		Order o = orderService.getOrder(orderID);
		List<Order_Detail> detail = orderDetailService.getOrdersDetailsByOrderID(orderID);
		
		theModel.addAttribute("order",o);
		theModel.addAttribute("detail",detail);
		return "admin/admin-order-detail";
	}
	
	@PostMapping("/order/updatestatus")
	public String updateStatus(@RequestParam("statusID") int statusID, @RequestParam("orderID") int orderID) {
		Order order = orderService.getOrder(orderID);
		Status status = statusService.getStatus(statusID);
		order.setStatus(status);
		orderService.updateOrder(order);	
		return "redirect:/admin/order";
	}
	
	@GetMapping({"/status","/status/","/status/list"})
	public String getStatus(Model theModel) {
		List<Status> list = statusService.getStatuses();
		
		theModel.addAttribute("statuses", list );
		return "admin/admin-status-list";
	}
}
