package com.vokh.justdoit.repository;

import com.vokh.justdoit.dao.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    //https://www.baeldung.com/spring-data-derived-queries
    List<Customer> findByNameContaining(String contain);
    List<Customer> findByNameEquals(String equals);
    List<Customer> findByNameLike(String likePattern);
    Optional<Customer> findById(Long id);
}
