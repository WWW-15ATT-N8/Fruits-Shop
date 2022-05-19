package nhom08.config;



import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
		@Autowired
	    private DataSource securityDataSource;
		
	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.jdbcAuthentication().dataSource(securityDataSource)
	                .usersByUsernameQuery("SELECT phone, password, enabled FROM Accounts where phone = ?")
	                .authoritiesByUsernameQuery("select tk.phone, ro.title from Roles as ro, Accounts as tk "
	                		+ "where tk.roleID = ro.roleID and tk.phone = ?");
	        
	    }
	    private static final String[] PUBLIC_MATCHERS = {
				"/resources/**",
				"/",
				"/product",
				"/category/**",
				"/product/id=*",
				"/registration/**"
		};
	    
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        CharacterEncodingFilter filter = new CharacterEncodingFilter();
	        filter.setEncoding("UTF-8");
	        filter.setForceEncoding(true);
	        http.addFilterBefore(filter,CsrfFilter.class);
	        http.authorizeRequests()
	                .antMatchers(PUBLIC_MATCHERS).permitAll()
					.antMatchers("/user/**").hasAnyRole("CUSTOMER", "ADMIN")
	                .antMatchers("/admin/**").hasRole("ADMIN")
	                .anyRequest().authenticated()
	                .and()
	                .formLogin()
	                .loginPage("/login")
	                .loginProcessingUrl("/authenticateLogin")
	                .permitAll()
	                .and()
	                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	                .logoutSuccessUrl("/").permitAll()
	                .and()
	                .exceptionHandling().accessDeniedPage("/access-denied");
	    }
	    
	    @Bean
	    public UserDetailsManager userDetailsManager() {
	        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
	        jdbcUserDetailsManager.setDataSource(securityDataSource);
	        return jdbcUserDetailsManager;
	    }

}
