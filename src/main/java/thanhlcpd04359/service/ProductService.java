package thanhlcpd04359.service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;

import thanhlcpd04359.domain.Product;


public interface ProductService {

	<S extends Product> List<S> findAll(Example<S> example, Sort sort);

	<S extends Product> List<S> findAll(Example<S> example);

	Product getById(Long id);

	void deleteAll();

	void deleteAll(Iterable<? extends Product> entities);

	Product getOne(Long id);

	void deleteAllInBatch();

	void deleteAllById(Iterable<? extends Long> ids);

	<S extends Product, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction);

	void delete(Product entity);

	void deleteAllByIdInBatch(Iterable<Long> ids);

	void deleteById(Long id);

	<S extends Product> boolean exists(Example<S> example);

	long count();

	void deleteAllInBatch(Iterable<Product> entities);

	<S extends Product> long count(Example<S> example);

	void deleteInBatch(Iterable<Product> entities);

	<S extends Product> Page<S> findAll(Example<S> example, Pageable pageable);

	<S extends Product> List<S> saveAllAndFlush(Iterable<S> entities);

	boolean existsById(Long id);

	<S extends Product> S saveAndFlush(S entity);

	void flush();

	<S extends Product> List<S> saveAll(Iterable<S> entities);

	Optional<Product> findById(Long id);

	List<Product> findAllById(Iterable<Long> ids);

	List<Product> findAll(Sort sort);

	Page<Product> findAll(Pageable pageable);

	List<Product> findAll();

	<S extends Product> Optional<S> findOne(Example<S> example);

	@Query("SELECT p FROM Product p WHERE p.category.categoryId = 9")
	List<Product> findByCategoryId();

	@Query("SELECT p FROM Product p WHERE p.category.categoryId = 10")
	List<Product> findByCategoryId1();

	@Query("SELECT p FROM Product p WHERE p.category.categoryId = 22")
	List<Product> findByCategoryId2();

	<S extends Product> S save(S entity);



}
