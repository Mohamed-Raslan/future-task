package com.app.product.fullproduct.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.app.product.fullproduct.entities.ProductEntity;

@Repository
public interface ProductRepo extends PagingAndSortingRepository<ProductEntity, Integer> {

	
	//for Searching
	List<ProductEntity> findByName(String name);
	
}
