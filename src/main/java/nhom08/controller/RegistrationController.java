package nhom08.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import nhom08.entity.Account;
import nhom08.entity.Role;
import nhom08.entity.User;
import nhom08.service.AccountService;
import nhom08.service.UserService;

@Controller
@RequestMapping({"/registration", "dang-ky"})
public class RegistrationController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private UserService userService ;
	
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@GetMapping({"","/"})
	public String registration(@ModelAttribute("Account") Account account, Model theModel ) {
		
		theModel.addAttribute("Account", new Account());
		return "Registration";
	}
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(
			@ModelAttribute("Account") Account account,	Model theModel) {
		String phone = account.getPhone();
		String password = account.getPassword();
		
		Account account2 = accountService.getAccount(phone);
		if(account2 != null) {
			theModel.addAttribute("registrationError", "Tài khoản đã tồn tại");
			return "Registration";
		}
		
		String encodedPassword = passwordEncoder.encode(password);
		encodedPassword = "{bcrypt}" + encodedPassword;
		
		account.setAccountID(0);
		account.setEnabled(1);
		account.setPassword(encodedPassword);
		account.setRole(new Role(2));
		accountService.saveAccount(account);
		account2 = new Account();
		account2.setAccountID(accountService.lastID());
				
		User newUser = new User();
		newUser.setUserID(0);
		newUser.setPhone(phone);
		newUser.setFullName("");
		newUser.setAddress("");
		newUser.setAccount(account2);
		newUser.setEmail("");
		
		userService.saveUser(newUser);		
		
		return "redirect:/login";
	}
}
