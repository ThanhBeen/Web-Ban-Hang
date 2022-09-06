package thanhlcpd04359.service;

import org.springframework.stereotype.Service;
import thanhlcpd04359.domain.Authoritie;
import thanhlcpd04359.domain.Category;

import java.util.List;


public interface AuthoritieService {
    List<Authoritie> findAll();
}
