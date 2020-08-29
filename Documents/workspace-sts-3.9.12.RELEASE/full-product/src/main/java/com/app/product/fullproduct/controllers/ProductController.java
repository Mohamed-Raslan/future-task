package com.app.product.fullproduct.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.app.product.fullproduct.entities.ProductEntity;
import com.app.product.fullproduct.pojo.ProductRequest;
import com.app.product.fullproduct.repository.ProductRepo;
import com.app.product.fullproduct.services.ProductService;

import ch.qos.logback.core.joran.util.beans.BeanUtil;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductRepo repo;
	
	// show Home Page
	@GetMapping
	public String home(Model model , HttpServletRequest request ,
			            @RequestParam(defaultValue = "0") Integer pageNo, 
                        @RequestParam(defaultValue = "4") Integer pageSize) {
		
		Pageable paging = PageRequest.of(pageNo, pageSize);
        Page<ProductEntity> pagedResult = repo.findAll(paging);
        if(pagedResult.hasContent()) {
               model.addAttribute("products",pagedResult.getContent());
               model.addAttribute("totalNumber",pagedResult.getTotalPages());
               model.addAttribute("pageNo",pageNo);
            return "home";
                       
        } else {
        	model.addAttribute("products" , new ArrayList<ProductEntity>());
        	model.addAttribute("totalNumber",pagedResult.getTotalPages());
            return "home" ;
        }
				 
//		List<ProductEntity> products = productService.findAll(pageNo, pageSize);
//		model.addAttribute("products" , products);
//        model.addAttribute("pageNo",pageNo);
//		return "home";
		
	}
	
	// go to Google Search  //
	@GetMapping(value="/google")
	public String googleSearch() {
		
		return "redirect:http://www.google.com";
		
	}
	
	
	@GetMapping(value = "/productbyname")
	public String searchByName( Model model , HttpServletRequest request,
			@RequestParam(defaultValue = "1") Integer totalNumber)
             {
	
		List<ProductEntity> products =  productService.findByName(request.getParameter("Search").trim());
		if(products.isEmpty())
			return "nofoundpage";
		model.addAttribute("totalNumber",totalNumber);
		model.addAttribute("products" , products);
		return "home";
	}
	
	
	@RequestMapping(value = "/editpage/{id}")
	public String updatePage(@PathVariable Integer id , Model model) {
		
		// get details of product to update this product
		ProductEntity productEntity = productService.getProductbyId(id);
		ProductRequest request      = new ProductRequest();
		BeanUtils.copyProperties(productEntity, request);
		
		model.addAttribute("newproductafterupdate" , request);
		return "editpage";
				
	}
	
	
	
	@RequestMapping(value="/{id}", method = {RequestMethod.DELETE , RequestMethod.GET})
	public String deleteProduct(@PathVariable Integer id) {

		productService.deleteProduct(id);
		return "redirect:http://localhost:8080/product";

	}
	
	
	@GetMapping(value = "/pageofadding")
	public String addProductPage(Model model) {
		
		model.addAttribute("productmodel", new ProductRequest());
		return "addpage";
		
	}
	
	
	
	@PostMapping(value = "/addproduct")
	public String addProductPage(@Valid @ModelAttribute("productmodel") ProductRequest product , BindingResult result) {
		
		if(result.hasErrors())
			return "addpage";
		
		try {
			ProductEntity productEntity = new ProductEntity();
			BeanUtils.copyProperties(product, productEntity);
			productService.saveOrUpdateProduct(productEntity);
			return "redirect:http://localhost:8080/product";
		} catch (Exception e) {
			e.printStackTrace();
			// open anther page and explan the problem but now we will open the home  (:
			// TODO Auto-generated catch block
			return "redirect:http://localhost:8080/product";
			
		}
		
	}
	
	
	@GetMapping(value="/det/{id}")
	public String detailOfProduct(@PathVariable Integer id , Model model) {
		
		ProductEntity productEntity = productService.getProductbyId(id);
		List<ProductEntity>listP    = new ArrayList<ProductEntity>();
		listP.add(productEntity);
		model.addAttribute("myproduct" , listP);
		return "detailsproduct";
		
	}
	
	@RequestMapping(value = "/doneedited" , method = {RequestMethod.PUT , RequestMethod.GET})
	public String updateProduct(@Valid @ModelAttribute("newproductafterupdate") ProductRequest request , BindingResult result) {
		
		// we will save product on Mysql 
		
		if(result.hasErrors())
			return "editpage";
		
		try {
			ProductEntity product = new ProductEntity();
			BeanUtils.copyProperties(request, product);
			productService.saveOrUpdateProduct(product);
			return "redirect:http://localhost:8080/product";
		} catch (Exception e) {
			e.printStackTrace();
			// open anther page and explan the problem but now we will open the home  (:
			// TODO Auto-generated catch block
			return "redirect:http://localhost:8080/product";
			
		}
		
	}
	

	    @InitBinder
	    public void initBinder ( WebDataBinder binder )
	    {
	        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
	        binder.registerCustomEditor(String.class, stringtrimmer);
	    }
	
	
	
}
