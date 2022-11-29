import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/slider_theme.dart';
import 'package:translator/translator.dart';
import '../osteriasantanna/swagger.swagger.dart';
import '../utils/menu_type.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DataBundleNotifier extends ChangeNotifier{
  List<Product> prodList = [];
  List<Sushi> sushiList = [];
  List<Wine> wineList = [];
  List<Wine> wineListToSearch = [];

  String currentLanguage = 'it';
  Menutype currentMenu = Menutype.A_LA_CARTE;

  double dataSliderPrice = 0.0;

  double minWinePrice = 100000.0;
  double widgetMin = 100000.0;
  double maxWinePrice = 0.0;
  double widgetMax = 0.0;
  bool manageraccess = false;

  Map<String, Map<String, String>> translationMap = {};
  GoogleTranslator translator = GoogleTranslator();

  bool isRefreshable = true;

  void changemenutype(){
    if(currentMenu == Menutype.A_LA_CARTE){
      currentMenu = Menutype.WINE;
    }else{
      currentMenu = Menutype.A_LA_CARTE;
    }
    notifyListeners();
  }

  String baseUrlHttps = 'https://servicedbacorp741w.com:8444/santannaservice';
  //String baseUrlHttp = 'http://servicedbacorp741w.com:8080/santannaservice';
  String baseUrlHttp = 'http://localhost:16172/santannaservice';

  Swagger getSwaggerClient(){
    if(kIsWeb){
      return Swagger.create(
          baseUrl: baseUrlHttps
      );
    }else{
      return Swagger.create(
          baseUrl: baseUrlHttp
      );
    }
  }

  String retrieveImageFromLanguage() {
    String languageImage = 'images/italy_flag.svg';
    switch(currentLanguage){
      case 'it':
        languageImage = 'images/italy_flag.svg';
        break;
      case 'en':
        languageImage = 'images/england_flag.svg';
        break;
      case 'fr':
        languageImage = 'images/france_flag.svg';
        break;
      case 'es':
        languageImage = 'images/spain_flag.svg';
        break;
      case 'de':
        languageImage = 'images/germanyflag.svg';
        break;
      default:
        languageImage = 'images/italy_flag.svg';
    }
    return languageImage;
  }

  void setCurrentLanguage(String language) {
    print(language);
    if(language != currentLanguage){
      currentLanguage = language;
    }
    notifyListeners();
  }

  void setProdList(List<Product>? prodListIncoming) {

    prodList.clear();
    prodList.addAll(prodListIncoming!);
    notifyListeners();
  }

  void setWineList(List<Wine>? wineListIncoming) {

    wineList.clear();
    wineList.addAll(wineListIncoming!);

    wineListToSearch.clear();
    wineListToSearch.addAll(wineListIncoming!);
    setLowerAndHigerWinePrices();
    notifyListeners();
  }

  void setSushiList(List<Sushi>? sushiIncomingList) {
    sushiList.clear();
    sushiList.addAll(sushiIncomingList!);
    notifyListeners();
  }

  void filterSearchResults(String query) {
    List<Wine> wineDummyProductList = <Wine>[];
    wineDummyProductList.addAll(wineList);

    if(query.isNotEmpty) {
      List<Wine> dummyListData = <Wine>[];
      wineDummyProductList.forEach((wine) {

        if(wine.name!.toLowerCase().contains(query.toLowerCase()) ||
            wine.grapes!.toLowerCase().contains(query.toLowerCase()) ||
            wine.producer!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(wine);
        }
      });
      wineList.clear();
      wineList.addAll(dummyListData);
    } else {
      wineList.clear();
      wineList.addAll(wineListToSearch);
    }
    notifyListeners();
  }

  void refreshListWineByRangePrice(RangeValues range) {
    wineList.clear();
    wineList.addAll(wineListToSearch);
    print(range.toString());
    minWinePrice = range.start;
    maxWinePrice = range.end;
    List<Wine> wineDummyProductList = <Wine>[];

    wineList.forEach((wine) {
      print('price: '  + wine.price!.toStringAsFixed(2));
      if(wine.price! >= range.start && wine.price! <= range.end){
        wineDummyProductList.add(wine);
      }
    });

    wineList.clear();
    wineList.addAll(wineDummyProductList);
    print(wineList.length.toString());

    notifyListeners();
  }

  void setLowerAndHigerWinePrices() {
    widgetMax = 0;
    widgetMin = 0;
    maxWinePrice = 0;
    minWinePrice = 10000000;

    wineList.forEach((element) {

      if(element.price! < minWinePrice){
        minWinePrice = element.price!;
      }
      if(maxWinePrice < element.price!){
        maxWinePrice = element.price!;
      }
    });

    widgetMax = maxWinePrice;
    widgetMin = minWinePrice;

    notifyListeners();
  }

  void turnManagerAccess() {
    if(manageraccess){
      manageraccess = false;
    }else{
      manageraccess = true;
    }

    print('Current manager option: ' + manageraccess.toString());
    notifyListeners();
  }

  void removeProductById(int prodId) {
    List<Product> list = [];
    prodList.forEach((element) {
      if(element.productId != prodId) {
        list.add(element);
      }
    });
    setProdList(list);
    notifyListeners();
  }

  void removeSushiById(int sushiId) {
    List<Sushi> list = [];
    sushiList.forEach((element) {
      if(element.sushiId != sushiId) {
        list.add(element);
      }
    });
    setSushiList(list);
    notifyListeners();
  }

  void removeWineById(int wineId) {

    List<Wine> list = [];
    wineList.forEach((element) {
      if(element.wineId != wineId) {
        list.add(element);
      }
    });
    setWineList(list);
    notifyListeners();
  }

  String getImageFromLanguage() {
    switch(currentLanguage){
      case 'it':
        return 'images/itacerchio.svg';
      case 'en':
        return 'images/ukcerchio.svg';
      case 'fr':
        return 'images/franciacerchio.svg';
      case 'es':
        return 'images/spagnacerchio.svg';
      case 'de':
        return 'images/tedescocerchio.svg';
      default:
        return '';
    }
  }

  Future<String> translateInCurrentLanguage(String s) async {

    if(currentLanguage == 'it'){
      return Future<String>.value(s);
    }else{
      if(!translationMap.containsKey(currentLanguage)){
        translationMap[currentLanguage] = {};
      }
      if(s != ''){
        if(translationMap[currentLanguage]!.containsKey(s)){
          return Future<String>.value(translationMap[currentLanguage]![s]);
        }else{
          translationMap[currentLanguage]![s] = await translator.translate(s, to: currentLanguage, from: 'it').then((value) => value.text);
          return Future<String>.value(translationMap[currentLanguage]![s]);
        }
      }else{
        return Future<String>.value('');
      }
    }
  }

  void updateWine(Wine wine) {
    for(int i = 0; i < wineList.length; i++){
      if(wineList[i].wineId == wine.wineId){
        print('replacing wine in position : ' + i.toString());
        wineList[i] = wine;
        break;
      }
    }
    notifyListeners();

  }


  void updateProduct(Product product) {

    for(int i = 0; i < prodList.length; i++){
      if(prodList[i].productId == product.productId){
        print('replacing product in position : ' + i.toString());
        prodList[i] = product;
        break;
      }
    }
    notifyListeners();

  }

  bool dataRetrieved = false;
  void dataRetrievedMethod(bool bool) {
    dataRetrieved = bool;
    notifyListeners();
  }
}