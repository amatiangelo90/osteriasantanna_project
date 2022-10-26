package com.acorp.santanna;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WineExport {
    public ArrayList<String> allergens;
    public String available;
    public String category;
    public ArrayList<String> changes;
    public int discountApplied;
    public String id;
    public String image;
    public ArrayList<String> ingredients;
    public String name;
    public int price;

}
