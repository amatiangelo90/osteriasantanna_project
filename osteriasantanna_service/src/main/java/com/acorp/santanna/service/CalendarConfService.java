package com.acorp.santanna.service;

import com.acorp.santanna.entity.CalendarConfiguration;
import com.acorp.santanna.entity.Sushi;
import com.acorp.santanna.repository.CalendarConfRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CalendarConfService {

    @Autowired
    private CalendarConfRepository calendarConfRepository;


    public List<CalendarConfiguration> findAll(String fromDate) {
        return calendarConfRepository.findAllGratherThanToday(fromDate);
    }

    public CalendarConfiguration saveConf(CalendarConfiguration conf) {
        return calendarConfRepository.save(conf);
    }

    public void delete(CalendarConfiguration conf) {
        calendarConfRepository.delete(conf);
    }

    @Transactional
    public CalendarConfiguration update(CalendarConfiguration conf) {

        Optional<CalendarConfiguration> updatingCalendarConfiguration = calendarConfRepository.findDate(conf.getDate());

        if(!updatingCalendarConfiguration.isPresent()){
            return saveConf(conf);
        }else{
            updatingCalendarConfiguration.get().setDinner(conf.getDinner());
            updatingCalendarConfiguration.get().setLaunch(conf.getLaunch());

            return updatingCalendarConfiguration.get();
        }

    }
}
