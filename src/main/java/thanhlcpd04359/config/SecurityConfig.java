package thanhlcpd04359.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;

import thanhlcpd04359.service.AccountService;
import thanhlcpd04359.service.UserService;

import java.util.stream.Collectors;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    AccountService accountService;

    @Autowired
    BCryptPasswordEncoder pe;

    //    Mã hoá mật khẩu
    @Bean
    public BCryptPasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //Quản lý dữ liệu người sử dụng
    @Autowired
    UserService userService;
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

//        auth.userDetailsService(userService);
    }

    //Phân quyền sử dụng và hình thức đăng nhập

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //CSRF, CORS
        http.csrf().disable().cors().disable();


        //Phan quyen su dung
//        http.authorizeRequests()
//                        .antMatchers("/rest/authorities").hasRole("ADMIN")
//                        .antMatchers("/admin/**").hasAnyRole("ADMIN","USER")
//                        .antMatchers("/order/**").authenticated()
//                        .anyRequest().permitAll(); //anonymous
//
//        http.httpBasic();

        //Giao diện đăng nhập
//         http.formLogin()
//                 .loginPage("/alogin")
//                 .loginProcessingUrl("/login") //mặc định [/login]
//                 .defaultSuccessUrl("/alogin/success", false)
//                 .failureUrl("/alogin/error")
//                 .usernameParameter("username") //[username]
//                 .passwordParameter("password"); //[password]

        http.logout()
                .logoutUrl("/alogoff")
                .logoutSuccessUrl("/alogoff/success");

        //OAuth2- Dang nhap tu mang xa hoi
        http.oauth2Login()
                .loginPage("/alogin")
                .defaultSuccessUrl("/oauth2/login/success", true)
                .failureUrl("/alogin/error")
                .authorizationEndpoint()
                .baseUri("/oauth2/authorization");

        //Dieu khien loi truy cap khong dung vai tro
        http.exceptionHandling()
                .accessDeniedPage("/alogin/unauthoried"); //[error]
    }


    //Cho phep truy xuat REST API tu ben ngoai(domain khac)
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
    }
}
