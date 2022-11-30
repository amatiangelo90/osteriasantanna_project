package com.acorp.santanna.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Sushi")
@Table(name = "SUSHI",
        uniqueConstraints=
        @UniqueConstraint(columnNames={"sushi_id", "name"}))
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Sushi implements Serializable {
    @Id
    @SequenceGenerator(
            name = "sushi_id",
            sequenceName = "sushi_id",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "sushi_id"
    )
    @Column(
            name = "sushi_id",
            updatable = false
    )
    private long sushiId;

    private String name = "";
    private String ingredients = "";
    private SushiCategory category = SushiCategory.SUSHIDEFAULT;
    private String subCategory =  "";
    private double price = 0.0;
    private boolean available = true;
    private boolean takeAwayProduct = false;
    private double takeAwayPrice = 0.0;
}
