package com.acorp.santanna.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Product")
@Table(name = "PRODUCT",
        uniqueConstraints=
        @UniqueConstraint(columnNames={"product_id", "name"}))
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Product implements Serializable {

    @Id
    @SequenceGenerator(
            name = "product_id",
            sequenceName = "product_id",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "product_id"
    )
    @Column(
            name = "product_id",
            updatable = false
    )
    private long productId;

    private String name = "";
    private String ingredients = "";
    private ProductCategory category;
    private String subCategory = "";
    private double price = 0.0;
    private boolean available = true;

}
