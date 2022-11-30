package com.acorp.santanna.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Wine")
@Table(name = "WINE",
        uniqueConstraints=
        @UniqueConstraint(columnNames={"wine_id"}))
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Wine implements Serializable {
    @Id
    @SequenceGenerator(
            name = "wine_id",
            sequenceName = "wine_id",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "wine_id"
    )
    @Column(
            name = "wine_id",
            updatable = false
    )
    private long wineId;

    private String name = "";
    private double price = 0.0;
    private String grapes = "";
    private String gradation = "";
    private String country = "";
    private String region = "";
    private String year = "";
    private String producer = "";
    private WineType wineType = WineType.BIANCO;
    private boolean available = true;
}
