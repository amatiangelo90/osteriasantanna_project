package com.acorp.santanna.controller;

import com.acorp.santanna.entity.Product;
import com.acorp.santanna.entity.ProductCategory;
import com.acorp.santanna.entity.Sushi;
import com.acorp.santanna.entity.SushiCategory;
import com.acorp.santanna.service.ProductService;
import com.acorp.santanna.service.SushiService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api
@RestController
@RequestMapping(path = "api/v1/sushi")
@CrossOrigin(origins = "*")
public class SushiController {

    private SushiService sushiService;
    private ProductService productService;

    @Autowired
    public SushiController(SushiService sushiService, ProductService productService) {
        this.sushiService = sushiService;
        this.productService = productService;
    }

    @GetMapping(path = "/findall")
    public List<Sushi> retrieveAll(){
        return sushiService.findAll();
    }

    @PostMapping(path = "/save")
    public void save(Sushi sushi) { sushiService.addNewProduct(sushi); }

    @DeleteMapping(path = "/delete")
    public void delete(Sushi sushi){
        sushiService.delete(sushi);
    }

    @PutMapping(path = "/update")
    public void update(Sushi sushi){
        sushiService.update(sushi);
    }

}
