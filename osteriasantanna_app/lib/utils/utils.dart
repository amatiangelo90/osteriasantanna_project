
import 'package:flutter/material.dart';
import '../osteriasantanna/swagger.enums.swagger.dart';
import 'costants.dart';

class Utils{



  static String getWeekDay(int weekday) {
    switch(weekday){
      case 1:
        return "Lunedi";
      case 2:
        return "Martedi";
      case 3:
        return "Mercoledi";
      case 4:
        return "Gioverdi";
      case 5:
        return "Venerdi";
      case 6:
        return "Sabato";
      case 7:
        return "Domenica";
    }
    return "";
  }

  static String getMonthDay(int month) {
    switch(month){
      case 1:
        return "Gennaio";
      case 2:
        return "Febbraio";
      case 3:
        return "Marzo";
      case 4:
        return "Aprile";
      case 5:
        return "Maggio";
      case 6:
        return "Giugno";
      case 7:
        return "Luglio";
      case 8:
        return "Agosto";
      case 9:
        return "Settembre";
      case 10:
        return "Ottobre";
      case 11:
        return "Novembre";
      case 12:
        return "Dicembre";
    }
    return "";
  }

  static String getAssetNamefromTypeWine(WineWineType wineType) {
    switch(wineType){
      case WineWineType.rosso:
        return 'images/wine_glass_red.svg';
      case WineWineType.rosato:
        return 'images/wine_glass_rose.svg';
      case WineWineType.bianco:
        return 'images/wine_glass_white.svg';
      case WineWineType.bollicine:
        return 'images/champagne.svg';
      case WineWineType.champagne:
        return 'images/champagne_green.svg';
    }
    return 'images/vino.svg';
  }

  static Color getWineColor(WineWineType wineType) {
    switch(wineType){
      case WineWineType.rosso:
        return Color(0xFF58181F);
      case WineWineType.rosato:
        return Color(0xFFd58282);
      case WineWineType.bianco:
        return OSTERIA_GOLD;
      case WineWineType.bollicine:
        return Color(0xFF253F4B);
      case WineWineType.champagne:
        return Color(0xff58405f);
    }
    return Colors.grey.shade700;
  }

}