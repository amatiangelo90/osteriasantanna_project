import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../databundle/databundleprovider.dart';
import '../../../osteriasantanna/swagger.enums.swagger.dart';
import '../../../osteriasantanna/swagger.models.swagger.dart';
import '../../../utils/costants.dart';
import '../../components/anchor_tabs.dart';

class SushiWidget extends StatefulWidget {
  SushiWidget({Key? key}) : super(key: key);

  @override
  State<SushiWidget> createState() => _SushiWidgetState();
}

class _SushiWidgetState extends State<SushiWidget> {

  Map<String, String> conversionMap = {
    'hosomakitemaki':'Hosomaki / Temaki',
    'nigiri1pz' : 'Nigiri (1 pz)',
    'rolls8pz' : 'Rolls (8 pz)',
    'sushigio2pz' : 'Sushi Gio (2 pz)',
    'sushispecialetonno' : 'Il Tonno',
    'sushispecialericciola' : 'La Ricciola'

  };


  @override
  Widget build(BuildContext context) {

    List<String> categoryTabList = [
      SushiCategory.hosomakitemaki.name,
      SushiCategory.nigiri1pz.name,
      SushiCategory.rolls8pz.name,
      SushiCategory.sushigio2pz.name,
      SushiCategory.sushispecialetonno.name,
      SushiCategory.sushispecialericciola.name];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> tabs = [];



    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundle, _){
        return Container(

          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('images/santannapattern.png'),
              fit: BoxFit.fitHeight,

            ),
          ),
          child: Column(
            children: [
              Expanded(child: AnchorTabPanel(
                  rebuildBody: dataBundle.isRefreshable,
                  tabs: tabs,
                  conversionMap : conversionMap,
                  colorHeader: OSTERIA_GOLD,
                  colorHeaderNotSelected: Colors.grey,
                  body: buildBody(dataBundle, width, height, tabs, categoryTabList))),
            ],
          ),
        );
      },
    );
  }

  List<Sushi>? getCurrentCategoryList(List<Sushi> sushiList,
      String category) {

    List<Sushi> resultList = [];
    sushiList.forEach((currentsushiItem) {
      if(sushiCategoryToJson(currentsushiItem.category) == category.toUpperCase()){
        resultList.add(currentsushiItem);
      }
    });

    return resultList;
  }

  buildBody(DataBundleNotifier dataBundle,
      double width,
      double height,
      List<String> tabs,
      List<String> categoryTabList) {

    List<Widget> body = [];
    for (String category in categoryTabList) {
      tabs.add(category);
      List<Sushi>? currentList = getCurrentCategoryList(dataBundle.sushiList!, category);

      currentList?.insert(0, Sushi(name: category));

      body.add(ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: currentList?.length,
          itemBuilder: (BuildContext ctxt, int i) {
            if(i == 0){
              return Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<String>(
                      future: dataBundle.translateInCurrentLanguage(conversionMap[currentList![i].name!]!),
                      builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                          ) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('Caricamento dati..');
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('Error');
                          } else if (snapshot.hasData) {
                            return Text(conversionMap[currentList![i].name!]!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28, color: Colors.grey.shade700, fontFamily: 'Dance'));
                          } else {
                            return const Text('Empty data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      },
                    ),
                    Text('***', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey.shade700, fontFamily: 'Dance')),
                  ],
                ),
              );
            }else{
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    width: width - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              width: width - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                    child: FutureBuilder<String>(
                                      future: dataBundle.translateInCurrentLanguage(currentList![i].name!),
                                      builder: (
                                          BuildContext context,
                                          AsyncSnapshot<String> snapshot,
                                          ) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Text('Caricamento dati..');
                                        } else if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return const Text('Error');
                                          } else if (snapshot.hasData) {
                                            return Text(snapshot.data![0].toUpperCase() + snapshot.data!.substring(1).toLowerCase(),
                                              textAlign: TextAlign.center, style: TextStyle(color: OSTERIA_GOLD, fontSize: 20.0, fontWeight: FontWeight.w600,  fontFamily: 'Dance'),);
                                          } else {
                                            return const Text('Empty data');
                                          }
                                        } else {
                                          return Text('State: ${snapshot.connectionState}');
                                        }
                                      },
                                    ),
                                  ),
                                  currentList![i].ingredients! == '' ? SizedBox(height: 0,) : Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                    child: FutureBuilder<String>(
                                      future: dataBundle.translateInCurrentLanguage(currentList![i].ingredients!),
                                      builder: (
                                          BuildContext context,
                                          AsyncSnapshot<String> snapshot,
                                          ) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Text('Caricamento dati..');
                                        } else if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return const Text('Error');
                                          } else if (snapshot.hasData) {
                                            return Text(
                                              snapshot.data!, textAlign: TextAlign.center, overflow: TextOverflow.fade , style: TextStyle(fontSize: 13.0, color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontFamily: 'Dance'),
                                            );
                                          } else {
                                            return const Text('Empty data');
                                          }
                                        } else {
                                          return Text('State: ${snapshot.connectionState}');
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 1,),
                                  Text('€ ' + currentList![i].price!.toString().replaceAll('.0', ''), overflow: TextOverflow.ellipsis , style: TextStyle(color:  Colors.grey.shade600, fontSize: 23.0, fontWeight: FontWeight.w600,  fontFamily: 'Dance'),),
                                  Text('',),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }));
    }
    return body;
  }
}