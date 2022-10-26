package com.acorp.santanna.controller;

import com.acorp.santanna.entity.Product;
import com.acorp.santanna.service.ProductService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api
@RestController
@RequestMapping(path = "api/v1/product")
@CrossOrigin(origins = "*")
public class ProductController {

    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping(path = "/findall")
    public List<Product> retrieveAll(){
        return productService.findAll();
    }

    @PostMapping(path = "/save")
    public void save(Product product) { productService.addNewProduct(product); }

    @DeleteMapping(path = "/delete")
    public void delete(Product product){
        productService.delete(product);
    }

    @PutMapping(path = "/update")
    public void update(Product product){
        productService.update(product);
    }


}
