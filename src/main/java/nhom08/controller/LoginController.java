package nhom08.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import nhom08.entity.Account;

@Controller 
public class LoginController {
	
	@GetMapping({"/dang-nhap", "/login"})
	public String showLoginPage(Model model) {
		return "login";
	}

}
