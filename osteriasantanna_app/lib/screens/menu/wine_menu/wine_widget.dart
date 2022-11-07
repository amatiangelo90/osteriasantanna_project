import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../databundle/databundleprovider.dart';
import '../../../osteriasantanna/swagger.enums.swagger.dart';
import '../../../osteriasantanna/swagger.models.swagger.dart';
import '../../../utils/costants.dart';
import '../../../utils/utils.dart';
import '../../components/anchor_tabs.dart';
import '../../manager_area/create_screens/create_wine_screen.dart';
import '../../manager_area/edit_screens/edit_wine_screen.dart';
import '../home_screen.dart';
class WineWidget extends StatefulWidget {
  const WineWidget({Key? key}) : super(key: key);

  @override
  State<WineWidget> createState() => _WineWidgetState();
}

class _WineWidgetState extends State<WineWidget> {


  List<String> categoryWineTabList = [
    WineWineType.bianco.name,
    WineWineType.rosso.name,
    WineWineType.rosato.name,
    WineWineType.bollicine.name,
    WineWineType.champagne.name,
    ];

  TextEditingController searchWine = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Consumer<DataBundleNotifier>(
        builder: (child, dataBundle, _){
          return Column(
            children: [
              dataBundle.manageraccess ? Text('') : Column(
                children: buildRows(dataBundle),
              ),

              Expanded(child: AnchorTabPanel(
                  rebuildBody: true,
                  tabs: tabs,
                  body: buildBody(dataBundle, width, height, tabs, )
              )),
            ],
          );
        },
      ),
    );
  }
  buildRows(DataBundleNotifier dataBundle) {
    List<Widget> list = [
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        onChanged: (value) {
          dataBundle.filterSearchResults(value);
          setState(() {

          });
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: '  Ricerca per nome, uvaggio o cantina',
        ),
      ),
    ),];
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('da €' + dataBundle.minWinePrice.toStringAsFixed(0)
              ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey.shade700, fontFamily: 'Dance') ),
          SizedBox(
            width: 300,
            child: RangeSlider(
              inactiveColor: Colors.blueGrey,
              activeColor: OSTERIA_GOLD,
              min: dataBundle.widgetMin,
              onChangeEnd: (value){
                dataBundle.refreshListWineByRangePrice(value);
              },
              onChangeStart: (value){
                dataBundle.refreshListWineByRangePrice(value);
              },
              labels: RangeLabels(dataBundle.minWinePrice.toStringAsFixed(0) + ' €', dataBundle.maxWinePrice.toStringAsFixed(0) + ' €'),
              max: dataBundle.widgetMax,
              divisions: 1000,
              values: RangeValues(dataBundle.minWinePrice, dataBundle.maxWinePrice),
              onChanged: (RangeValues value) {
                dataBundle.refreshListWineByRangePrice(value);
              },
            ),
          ),
          Text('a € ' + dataBundle.maxWinePrice.toStringAsFixed(0),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey.shade700, fontFamily: 'Dance') ),
        ],
      ),
    );
    list.add(Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildRowInfo('images/winecask.svg', ' Cantina'),
        buildRowInfo('images/grapes.svg', ' Vitigno'),
        buildRowInfo('images/percentage.svg', ' Gradazione'),
        buildRowInfo('images/calendar.svg', ' Anno'),

      ],
    ));
    return list;
  }

  List<Wine>? getCurrentCategoryList(List<Wine> productList,
      String category) {

    List<Wine> resultList = [];


    productList.forEach((currentProd) {
      if(wineWineTypeToJson(currentProd.wineType) == category.toUpperCase()){
        resultList.add(currentProd);
      }
    });
    return resultList;
  }

  buildBody(DataBundleNotifier dataBundle,
      double width,
      double height,
      List<String> tabs) {
    List<Widget> body = [];
    for (String category in categoryWineTabList) {
      tabs.add(category);
      List<Wine>? currentList = getCurrentCategoryList(dataBundle.wineList!, category);

      currentList?.insert(0, Wine(name: category));

      // Create a target item
      body.add(ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: currentList?.length,
          itemBuilder: (BuildContext ctxt, int i) {
            if(i == 0){
              return Container(
                color: Utils.getWineColor(wineWineTypeFromJson(category)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Column(
                    children: [
                      Text(currentList![i].name![0].toUpperCase() + currentList![i].name!.substring(1).toLowerCase(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white, fontFamily: 'Dance')),
                      Text('***', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Dance')),
                      dataBundle.manageraccess ? ElevatedButton(onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateWineScreen(wine: Wine(
                            wineType: wineWineTypeFromJson(currentList![i].name!)
                          ),
                          ),),);
                      },
                        child: Text('Crea ' + currentList![i].name![0].toUpperCase() + currentList![i].name!.substring(1).toLowerCase()),) : SizedBox(height: 0,)
                    ],
                  ),
                ),
              );
            }else{
              return Column(
                children: [
                  Stack(
                    children:[Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30, left: 15, right: 10),
                                child: SvgPicture.asset(Utils.getAssetNamefromTypeWine(currentList![i].wineType!), height: 40),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(currentList![i].name!, maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Utils.getWineColor(currentList![i].wineType!), fontFamily: 'Dance')),
                                width: 300,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset('images/winecask.svg', height: 15),
                                  ),
                                  Text(' ' + currentList![i].producer!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade700, fontFamily: 'Dance')),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset('images/grapes.svg', height: 15),
                                  ),
                                  SizedBox(width: 300,child: Text(' ' + currentList![i].grapes!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade700, fontFamily: 'Dance'))),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset('images/percentage.svg', height: 15),
                                  ),
                                  Text(' ' + currentList![i].gradation!.toString().replaceAll('.0',''), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade700, fontFamily: 'Dance')),
                                ],
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset('images/calendar.svg', height: 15),
                                  ),
                                  Text(' ' + currentList![i].year!.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade700, fontFamily: 'Dance')),
                                ],
                              ),
                              Text('€ ' + currentList![i].price.toString().replaceAll('.0', '')!, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.grey.shade800, fontFamily: 'Dance')),],
                          )
                        ],
                      ),
                    ),
                      dataBundle.manageraccess ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => EditWineScreen(wine: currentList![i]),
                                    ),);
                                }, icon: Icon(Icons.edit, color: Colors.blueAccent,)),
                                IconButton(onPressed: (){
                                  Widget cancelButton = ElevatedButton(
                                    child: Text("Elimina"),
                                    onPressed:  () async {
                                      Response apiV1ProductDeleteDelete
                                      = await dataBundle.getSwaggerClient().apiV1WineDeleteDelete(wineId: currentList![i].wineId!.toInt());
                                      if(apiV1ProductDeleteDelete.isSuccessful){
                                        dataBundle.removeWineById(currentList![i].wineId!.toInt());
                                        sleep(Duration(seconds: 1));
                                        Navigator.pushNamed(context, HomeScreen.id);
                                      }else{
                                        print('Errore: ' + apiV1ProductDeleteDelete.error.toString());
                                      }
                                    },
                                  );
                                  Widget continueButton = ElevatedButton(
                                    child: Text("Indietro"),
                                    onPressed:  () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                  // set up the AlertDialog
                                  AlertDialog alert = AlertDialog(
                                    title: Text("Eliminare " + currentList![i].name! + "?"),

                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );
                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }, icon: Icon(Icons.delete, color: Colors.redAccent,))
                              ],
                            ),
                          ],
                        ),
                      ) : SizedBox(width: 0,)
                    ],
                  ),
                  Divider(color: Colors.grey.shade400),
                ],
              );
            }
          }));
    }

    return body;
  }

  buildRowInfo(String image, String desc) {
    return Row(
      children: [
        SvgPicture.asset(image, height: 15),
        Text(desc,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey.shade700, fontFamily: 'Dance') ),
      ],
    );
  }
}