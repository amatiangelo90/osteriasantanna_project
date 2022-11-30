package com.acorp.santanna.repository;

import com.acorp.santanna.entity.CalendarConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CalendarConfRepository extends JpaRepository<CalendarConfiguration, Long> {
    @Query("SELECT conf FROM CalendarConfiguration conf WHERE conf.date >= ?1")
    List<CalendarConfiguration> findAllGratherThanToday(String fromDate);

    @Query("SELECT conf FROM CalendarConfiguration conf WHERE conf.date = ?1")
    Optional<CalendarConfiguration> findDate(String date);
}
