package thanhlcpd04359.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import thanhlcpd04359.domain.Product;

import java.util.List;


@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
    @Query("SELECT p FROM Product p WHERE p.category.categoryId = 9")
    List<Product> findByCategoryId();

    @Query("SELECT p FROM Product p WHERE p.category.categoryId = 10")
    List<Product> findByCategoryId1();

    @Query("SELECT p FROM Product p WHERE p.category.categoryId = 22")
    List<Product> findByCategoryId2();
}
