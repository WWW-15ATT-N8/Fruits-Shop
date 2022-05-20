package nhom08.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.PostUpdate;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mchange.v2.c3p0.FullQueryConnectionTester;

import nhom08.entity.*;
import nhom08.service.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	public static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Charset UTF_8 = Charset.forName("UTF-8");
	public static final String PATH_CONTEXT = "/fruits-shop";
	private static final long MILLIS_IN_A_DAY = 1000 * 60 * 60 * 24;
	public static final String PATH_STORE_ROOT = "\\resources\\img\\product_picture\\";
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
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	ImageService imageService;
	
	@RequestMapping({"", "/", "dashboard"})
	public String adminPage() {
		return "redirect:/admin/product/list";
	}
	
	@InitBinder
	public void initBiner(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	public void loadUser(HttpServletRequest request, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			User u = new User();
			String phone = authentication.getName();
			u = userService.getUserbyPhone(phone);
			double total = 0.0;
			
				
			session.setAttribute("USER",u);
			session.setAttribute("total",total);
		}
		
		if(session.getAttribute("category") == null) {
			List<Category> categories = categoryService.getCategories();
			session.setAttribute("category", categories);
		}
	}
	
	@GetMapping({"/product","/product/","/product/list"})
	public String list(HttpServletRequest request, Model model) {
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
			String isBestSaler = request.getParameter("bestSaler");
			String isNewProduct = request.getParameter("newProduct");
			
			products = productService.getProductsFilter(name, categoryID, isNewProduct, isBestSaler, rangePrice, rangStock);
			
			model.addAttribute("url" , PATH_CONTEXT + "/admin/product/list?name="+ name +"&category="+categoryID+"&bestSaler="+isBestSaler+"&newProduct"+isNewProduct+"&price="+rangePrice[0]+"%3B"+rangePrice[1]+"&stock="+rangStock[0]+"%3B"+rangStock[1]+"&");
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
	public String create(Model model, HttpServletRequest request, HttpSession session) {
		loadUser(request, session);
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categories);
		return "admin/admin-product-form";
	}
	
	@PostMapping("/product/save")
    public String saveProduct(
    		Model model,
    		@ModelAttribute("categoryID") int categoryID,
    		@ModelAttribute("product") @Valid Product product,  
    		BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("categories", categoryService.getCategories());
			return "admin/admin-product-form";
		}
		
		
		
		Category category = categoryService.getCategory(categoryID);
		product.setCategory(category);
		productService.saveProduct(product);
        return "redirect:/admin/product/update?productID="+product.getProductID();
    }
	
	@GetMapping("/product/update")
	public String updateProduct(@RequestParam("productID") int id, Model model) {
		Product product = productService.getProduct(id);
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("categoryID", product.getCategory().getCategoryID());
		System.out.println(product.getImages());
		model.addAttribute("product", product);
		model.addAttribute("name", product.getName());
		model.addAttribute("images", product.getImages());
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
    public String saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "admin/admin-category-form";
		
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

	@RequestMapping(value = "/image/save")  
	public String upload(@RequestParam(name="files") MultipartFile[] files, @RequestParam(name="productID") int productID, HttpServletRequest request, Model model){  
		Product product = productService.getProduct(productID);
		List<Image> images = imageService.getImagesByProductID(productID);
		if (images.size() != 0) {
			for (Image image : images) {
				imageService.deleteImage(image);
			}
		}

		for (MultipartFile file : files) {
			String src = PATH_STORE_ROOT+saveImage(file, request);
			imageService.saveImage(new Image(src, product));
		}
		return "redirect:/admin/product/list";
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
				
				System.out.println(path+"src\\main\\webapp"+PATH_STORE_ROOT+filename);  
				
				BufferedOutputStream bout=new BufferedOutputStream(  
						new FileOutputStream(path+"src\\main\\webapp"+PATH_STORE_ROOT+filename));  
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
			
			
			if(dieukien.equals("where ")) 
				orders =  orderService.getOrdersByDK(" order by createdAt desc");
			else {
				if(filter == 1)
					dieukien += " order by createdAt desc";
				 else if(filter == 2)
					 dieukien += " order by total asc";
				 else
					 dieukien += " order by total desc";
				orders =  orderService.getOrdersByDK(dieukien);
			}
				
			
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
	
	@GetMapping({"/user","/user/","/user/list"})
	private String listUser(HttpServletRequest request, Model model) {
		List<User> users  = new ArrayList<User>();
		int roleID = 0;
		if (request.getParameter("fullName") != null || request.getParameter("email") != null ||
				request.getParameter("phone") != null
				|| request.getParameter("roleID") != null) {
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			roleID = Integer.parseInt(request.getParameter("roleID"));
			
			System.out.println("start filter");
			List<User> usersTemp = userService.getUsersFilter(fullName, phone, email);
			System.out.println("start for"+ usersTemp);
			if(roleID != -1) {
				for (User user : usersTemp) {
					if (accountService.getAccount(user.getPhone()) != null) {
						if (accountService.getAccount(user.getPhone()).getRole().getRoleID() == roleID) {
							users.add(user);
						}
					}
				}
			} else {
				users = usersTemp;
			}
			
			
			model.addAttribute("url" , PATH_CONTEXT + "/admin/user/list?fullName="+fullName+"&email="+email+"&phone="+phone+"&");
		} else {
			users = userService.getUsers();
			model.addAttribute("url" , PATH_CONTEXT + "/admin/user/list?");
		}
		
		if (users == null) {
			users = new ArrayList<User>();
		}
		
		List<Role> roles = roleService.getRoles(); 
		System.out.println(roles);
		model.addAttribute("roles", roles);
		model.addAttribute("roleID", roleID);
		PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		pagedListHolder.setPage(page - 1);
		pagedListHolder.setPageSize(3);
		
//		System.out.println(pagedListHolder);
		model.addAttribute("users", pagedListHolder);
		model.addAttribute("pageCount", pagedListHolder.getPageCount());
		model.addAttribute("pageCurrent", pagedListHolder.getPage());
		return "admin/admin-user-list";
	}
	
	@GetMapping("/user/create")
	public String createUser(Model model, HttpServletRequest request) {
		model.addAttribute("roles", roleService.getRoles());
		model.addAttribute("user", new User());
		return "admin/admin-user-form";
	}
	
	@PostMapping("/user/save")
    public String saveUser( @RequestParam("roleID") int roleID, 
    		Model model,
    		 @RequestParam("password") String password, @Valid @ModelAttribute("user") User user, BindingResult bindingResult ) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("roles", roleService.getRoles());
			return "admin/admin-user-form";
		}
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		Account account = new Account(user.getPhone(),"{bcrypt}"+encoder.encode(password), roleService.getRole(roleID));
		accountService.saveAccount(account);
		user.setAccount(accountService.getAccount(user.getPhone()));
		userService.saveUser(user);
		
		
        return "redirect:/admin/user/list";
    }
	
	@GetMapping("/user/updateUserRole")
    public String updateUserRole(@RequestParam("userID") int userID, @RequestParam("roleID") int roleID) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		User user = userService.getUser(userID);
		Account account = accountService.getAccount(user.getPhone());
		account.setRole(roleService.getRole(roleID));
		
		accountService.saveAccount(account);
		
		
        return "redirect:/admin/user/list";
    }
	
	@GetMapping("/user/update")
	public String updateUser(@RequestParam("userID") int id, @RequestParam("roleID") int roleID, Model model) {
		model.addAttribute("roleID", roleID);
		model.addAttribute("user", userService.getUser(id));
		return "admin-user-form";
	}
	
	@GetMapping("/user/delete")
	public String deleteUser(@RequestParam("userID") int id,HttpServletRequest request) {

	     User user = userService.getUser(id);
		userService.deleteUser(user);
		return "redirect:/admin/user/list";
	}
	
	@GetMapping({"role/list", "/role/", "/role"})
	public String roleList(Model model) {
		model.addAttribute("roles", roleService.getRoles());
		return "admin/admin-role-list";
	}
	
	@GetMapping("dashboard")
	public String dashboard(Model model , HttpSession session) {
		List<Order> orders = orderService.getOrders();
		int totalOrder = getTotalOrder();
		int theWatingOrder = getWatingOrder(orders);
		int customerRegis = getCustomerRegis();
		int lowStockProduct = getLowStockProduct();
		List<Order> lastOrders = getLastOrder(orders, 5);
		List<Long> dates = getLastDate(10);
		
		List<Double> priceInDay = new ArrayList<Double>();
		
		for (Long time : dates) {
			double total = 0;
			List<Order> ordersByDay = orderService.getOrdersByDate(new java.sql.Date(time));
			for (Order order : ordersByDay) {
				if (order.getStatus().getStatusID() == 5) {
					total += order.getTotal();
				}
				
			}
			priceInDay.add(total);
		}
		
		
		
		model.addAttribute("priceInDay", priceInDay);
		model.addAttribute("lowStockProduct", lowStockProduct);
		model.addAttribute("customerRegis", customerRegis);
		model.addAttribute("totalOrder", totalOrder);
		model.addAttribute("theWatingOrder", theWatingOrder);
		model.addAttribute("lastOrders", lastOrders);
		return "admin/dashboard";
	}
	

	
	private List<Long> getLastDate(int size) {
		long getTime = new Date().getTime();
		List<Long> dates = new ArrayList<Long>();
		for (int i = size-1; i >= 0; i--) {
			getTime -= MILLIS_IN_A_DAY;
			dates.add(getTime);
		}
		Collections.reverse(dates);
		return dates;
	}

	private List<Order_Detail> totalProductSaleByDate() {
		long getTime = new Date().getTime();
		java.sql.Date date = new java.sql.Date(getTime);
		List<Order> orders = orderService.getOrdersByDate(date);
		System.out.println(orders);
		return orderDetailService.getOrdersDetailsByOrderID(orders.get(0).getOrderID());
	}

	private List<Order> getLastOrder(List<Order> orders, int numOrder) {
		List<Order> lastOrder = new ArrayList<Order>();
		for (int i = orders.size()-1; i >= 0; i--) {
			if (orders.size() <= 5) {
				lastOrder.add(orders.get(i));
			}
		}
		System.out.println("last  " +lastOrder);
		return lastOrder;
	}

	private int getLowStockProduct() {
		int lowStock = 0;
		List<Product> products = productService.getProducts();
		for (Product product : products) {
			if(product.getStock() < 5) {
				lowStock ++;
			}
		}
		return lowStock;
	}

	private int getCustomerRegis() {
		int role_customerID = 2;
		return accountService.getAccountByRoleID(role_customerID).size();
	}

	private int getWatingOrder(List<Order> orders) {
		int totalOrders = 0;
//		int statusDaHuy = 4;
//		int statusThanhCong = 5;
		for (Order order : orders) {
			if (order.getStatus().getStatusID() == 1) {
				totalOrders ++;
			}
		}
		return totalOrders;
	}

	public int getTotalOrder() {
		return orderDetailService.getOrdersDetails().size();
	}
}
