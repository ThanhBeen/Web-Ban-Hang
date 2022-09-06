package thanhlcpd04359.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import thanhlcpd04359.domain.Authoritie;
import thanhlcpd04359.domain.Category;
import thanhlcpd04359.repository.AuthoritieReponsitory;
import thanhlcpd04359.service.AuthoritieService;

import java.util.List;

@Service
public class AuthoritieServiceImpl implements AuthoritieService {

    @Autowired
    AuthoritieReponsitory authoritieReponsitory;

    @Override
    public List<Authoritie> findAll() {
        return authoritieReponsitory.findAll();
    }
}
