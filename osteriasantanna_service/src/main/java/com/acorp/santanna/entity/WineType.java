package com.acorp.santanna.entity;

public enum WineType {
    BIANCO,
    ROSSO,
    ROSATO,
    BOLLICINE,
    CHAMPAGNE;

    public static WineType getType(String category) {
        switch(category){
            case "redwine":
                return ROSSO;
            case "whitewine":
                return BIANCO;
            case "bollicine":
                return BOLLICINE;
            case "rosewine":
                return ROSATO;
            case "champagne":
                return CHAMPAGNE;
            default:
                return ROSSO;
        }
    }
}
