package com.acorp.santanna.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "CalendarConfiguration")
@Table(name = "CALENDAR_CONFIGURATION",
        uniqueConstraints=
        @UniqueConstraint(columnNames={"calendar_conf_id", "date"}))
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CalendarConfiguration implements Serializable {

    @Id
    @SequenceGenerator(
            name = "calendar_conf_id",
            sequenceName = "calendar_conf_id",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "calendar_conf_id"
    )
    @Column(
            name = "calendar_conf_id",
            updatable = false
    )
    private long calendarConfId;

    @Column(
            name = "date",
            unique = true
    )
    private String date;
    private DayStatus launch;
    private DayStatus dinner;

}
