package com.acorp.santanna.service;

import com.acorp.santanna.entity.Wine;
import com.acorp.santanna.repository.WineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class WineService {

    @Autowired
    private WineRepository wineRepository;

    @Transactional
    public void save(Wine wine) {
        wineRepository.save(wine);
    }

    public void delete(Wine wine){
        wineRepository.deleteById(wine.getWineId());
    }

    public List<Wine> findAll() {
        return wineRepository.findAll(Sort.by(Sort.Direction.ASC, "wineType"));
    }

    @Transactional
    public void update(Wine wine) {
        Optional<Wine> updatingWine = wineRepository.findById(wine.getWineId());

        if(!updatingWine.isPresent()){
            throw new IllegalStateException("Errore. Non ho trovato vini da aggiornare");

        }else{

            if(updatingWine.get().getName() != wine.getName())
                updatingWine.get().setName(wine.getName());

            if(updatingWine.get().getPrice() != wine.getPrice())
                updatingWine.get().setPrice(wine.getPrice());

            if(updatingWine.get().getGrapes() != wine.getGrapes())
                updatingWine.get().setGrapes(wine.getGrapes());

            if(updatingWine.get().isAvailable() != wine.isAvailable())
                updatingWine.get().setAvailable(wine.isAvailable());

            if(updatingWine.get().getCountry() != wine.getCountry())
                updatingWine.get().setCountry(wine.getCountry());

            if(updatingWine.get().getYear() != wine.getYear())
                updatingWine.get().setYear(wine.getYear());

            if(updatingWine.get().getRegion() != wine.getRegion())
                updatingWine.get().setRegion(wine.getRegion());

            if(updatingWine.get().getProducer() != wine.getProducer())
                updatingWine.get().setProducer(wine.getProducer());

            if(updatingWine.get().getGradation() != wine.getGradation())
                updatingWine.get().setGradation(wine.getGradation());

            updatingWine.get().setWineType(wine.getWineType());

        }

    }

}
