package com.acorp.santanna.controller;

import com.acorp.santanna.entity.CalendarConfiguration;
import com.acorp.santanna.service.CalendarConfService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api
@RestController
@RequestMapping(path = "api/v1/calendarconf")
@CrossOrigin(origins = "*")
public class CalendarConfController {

    @Autowired
    private CalendarConfService calendarConfService;

    @GetMapping(path = "/findall")
    public List<CalendarConfiguration> retrieveAll(@RequestParam("fromDate") String fromDate){
        return calendarConfService.findAll(fromDate);
    }

    @PostMapping(path = "/save")
    public void save(CalendarConfiguration conf) { calendarConfService.saveConf(conf); }

    @DeleteMapping(path = "/delete")
    public void delete(CalendarConfiguration conf){
        calendarConfService.delete(conf);
    }

    @PutMapping(path = "/update")
    public CalendarConfiguration update(CalendarConfiguration product){
        return calendarConfService.update(product);
    }

}
