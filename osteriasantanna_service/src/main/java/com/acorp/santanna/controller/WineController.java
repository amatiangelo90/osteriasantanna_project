package com.acorp.santanna.controller;

import com.acorp.santanna.entity.Wine;
import com.acorp.santanna.entity.WineType;
import com.acorp.santanna.service.WineService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Api
@RestController
@RequestMapping(path = "api/v1/wine")
@CrossOrigin(origins = "*")
public class WineController {

    private WineService wineService;

    @Autowired
    public WineController(WineService wineService) {
        this.wineService = wineService;
    }

    @GetMapping(path = "/findall")
    public List<Wine> retrieveAll(){
        return wineService.findAll();
    }

    @PostMapping(path = "/save")
    public void save(Wine Wine) { wineService.save(Wine); }

    @DeleteMapping(path = "/delete")
    public void delete(Wine Wine){
        wineService.delete(Wine);
    }

    @PutMapping
    public void update(Wine wine){
        wineService.update(wine);
    }

    @PostMapping(path = "export")
    public void export(String wineExports) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        WineExport[] pp1 = mapper.readValue(wineExports, WineExport[].class);

        for(WineExport wineExport : pp1){

            wineService.save(Wine.
                    builder()
                    .available(true)
                    .gradation("")
                    .producer(wineExport.changes.toString())
                    .grapes(wineExport.ingredients.toString())
                    .name(wineExport.name)
                    .price(wineExport.price)
                    .wineType(getWineType(wineExport.category))
                    .build());
        }
    }

    private WineType getWineType(String category) {

        switch(category){
            case "redwine":
                return WineType.ROSSO;
            case "whitewine":
                return WineType.BIANCO;
            case "rosewine":
                return WineType.ROSATO;
            case "bollicine":
                return WineType.BOLLICINE;
            case "champagne":
                return WineType.CHAMPAGNE;
            default:
                return WineType.BIANCO;
        }

    }
}
