package thanhlcpd04359.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import thanhlcpd04359.domain.Account;


@Repository
public interface AccountRepository extends JpaRepository<Account, String> {

}
