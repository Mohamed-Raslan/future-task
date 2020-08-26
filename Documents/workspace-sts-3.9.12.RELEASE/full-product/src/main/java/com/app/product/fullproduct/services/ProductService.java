package com.app.product.fullproduct.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.cfg.EJB3NamingStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.app.product.fullproduct.entities.ProductEntity;
import com.app.product.fullproduct.repository.ProductRepo;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepo repo;
	
	
	public List<ProductEntity> findAll(Integer pageNo ,Integer pageSize ){
		Pageable paging = PageRequest.of(pageNo, pageSize);
        Page<ProductEntity> pagedResult = repo.findAll(paging);
        
        if(pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<ProductEntity>();
        }
				
	}
	
	
	public List<ProductEntity> findByName(String name){
		
		return repo.findByName(name);
		
	}
	
	
	public void saveOrUpdateProduct(ProductEntity prEntity)throws Exception {
		
			repo.save(prEntity);
		
	}
	
	
	
	public void deleteProduct(Integer id) {
		
		Optional<ProductEntity> prEntity = repo.findById(id);
		
		if(prEntity.isPresent()) {
			ProductEntity myProduct = prEntity.get();
			repo.delete(myProduct);
		}
			
		
	}

	public ProductEntity getProductbyId(Integer id) {
		
		ProductEntity myProduct = null;
		
		Optional<ProductEntity> prEntity = repo.findById(id);

		if (prEntity.isPresent()) {
		    myProduct = prEntity.get();
		}
		// impossible to get null object
		return myProduct;
	}
}
