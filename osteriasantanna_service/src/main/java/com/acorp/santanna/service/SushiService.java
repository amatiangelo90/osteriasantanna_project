package com.acorp.santanna.service;

import com.acorp.santanna.entity.Product;
import com.acorp.santanna.entity.Sushi;
import com.acorp.santanna.repository.SushiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
public class SushiService {

    @Autowired
    private SushiRepository sushiRepository;

    @Transactional
    public void addNewProduct(Sushi sushi) {
        sushiRepository.save(sushi);
    }

    public void delete(Sushi sushi){
        sushiRepository.deleteById(sushi.getSushiId());
    }

    public List<Sushi> findAll() {
        return sushiRepository.findAll();
    }

    @Transactional
    public void update(Sushi sushi) {
        Optional<Sushi> updatingProduct = sushiRepository.findById(sushi.getSushiId());

        if(!updatingProduct.isPresent()){
            throw new IllegalStateException("Errore. Non ho trovato prodotti da aggiornare");

        }else{

            if(updatingProduct.get().getName() != sushi.getName())
                updatingProduct.get().setName(sushi.getName());

            if(updatingProduct.get().getPrice() != sushi.getPrice())
                updatingProduct.get().setPrice(sushi.getPrice());

            if(updatingProduct.get().getIngredients() != sushi.getIngredients())
                updatingProduct.get().setIngredients(sushi.getIngredients());

            if(updatingProduct.get().isAvailable() != sushi.isAvailable())
                updatingProduct.get().setAvailable(sushi.isAvailable());

            updatingProduct.get().setCategory(sushi.getCategory());

        }
    }
}
