package thanhlcpd04359.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;
import thanhlcpd04359.domain.Account;


import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    AccountService accountService;
    @Autowired
    BCryptPasswordEncoder pe;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            Account account = accountService.findById(username).get();
            //Tao UserDetail tu Account
            String password = pe.encode(account.getPassword());
            String[] roles = account.getAuthorities().stream()
                    .map(au -> au.getRole().getId())
                    .collect(Collectors.toList()).toArray(new String[0]);

            System.out.println("Username: " + username);
            System.out.println("Password: " + password);
            System.out.println("ROle: " + roles);

            return User.withUsername(username)
                    .password(password)
                    .roles(roles).build();
        }catch (Exception e){
            throw new UsernameNotFoundException(username + "not found");
        }
    }

    public void loginFormOAuth2(OAuth2AuthenticationToken oauth2){
        //String username = oauth2.getPrincipal().getAttribute("name");
        String email = oauth2.getPrincipal().getAttribute("email");
        String password = Long.toHexString(System.currentTimeMillis());

        UserDetails user =  User.withUsername(email)
                .password(pe.encode(password)).roles("GUEST").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null , user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);

    }
}
