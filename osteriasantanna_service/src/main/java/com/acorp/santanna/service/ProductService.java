package com.acorp.santanna.service;

import com.acorp.santanna.entity.Product;
import com.acorp.santanna.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public void addNewProduct(Product product) {
        productRepository.save(product);
    }

    public void delete(Product product){
        productRepository.deleteById(product.getProductId());
    }

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Transactional
    public void update(Product product) {
        Optional<Product> updatingProduct = productRepository.findById(product.getProductId());

        if(!updatingProduct.isPresent()){
            throw new IllegalStateException("Errore. Non ho trovato prodotti da aggiornare");

        }else{

            if(updatingProduct.get().getName() != product.getName())
                updatingProduct.get().setName(product.getName());

            if(updatingProduct.get().getPrice() != product.getPrice())
                updatingProduct.get().setPrice(product.getPrice());

            if(updatingProduct.get().getIngredients() != product.getIngredients())
                updatingProduct.get().setIngredients(product.getIngredients());

            if(updatingProduct.get().isAvailable() != product.isAvailable())
                updatingProduct.get().setAvailable(product.isAvailable());

            updatingProduct.get().setCategory(product.getCategory());
        }
    }
}
