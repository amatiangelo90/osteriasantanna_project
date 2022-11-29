
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:osteriasantannamenu/screens/manager_area/edit_screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../../../databundle/databundleprovider.dart';
import '../../../osteriasantanna/swagger.enums.swagger.dart';
import '../../../osteriasantanna/swagger.models.swagger.dart';
import '../../../utils/costants.dart';
import '../../components/anchor_tabs.dart';
import '../../manager_area/create_screens/create_product_screen.dart';

class ALaCarteWidget extends StatefulWidget {
  ALaCarteWidget({Key? key}) : super(key: key);

  @override
  State<ALaCarteWidget> createState() => _ALaCarteWidgetState();
}

class _ALaCarteWidgetState extends State<ALaCarteWidget> {

  List<String> categoryTabList = [
    ProductCategory.antipasti.name,
    ProductCategory.primi.name,
    ProductCategory.secondi.name,
    ProductCategory.contorni.name,
    ProductCategory.dolci.name,
    ProductCategory.bevande.name];

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> tabs = [];

    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundle, _){
        return Container(

          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
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
                  body: buildBody(dataBundle, width, height, tabs, ))),
            ],
          ),
        );
      },
    );
  }

  List<Product>? getCurrentCategoryList(List<Product> productList,
      String category) {

    List<Product> resultList = [];


    productList.forEach((currentProd) {
      if(productCategoryToJson(currentProd.category) == category.toUpperCase()){
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
    for (String category in categoryTabList) {
      tabs.add(category);
      List<Product>? currentList = getCurrentCategoryList(dataBundle.prodList!, category);

      currentList?.insert(0, Product(name: category));

      // Create a target item
      body.add(ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: currentList?.length,
          itemBuilder: (BuildContext ctxt, int i) {
            if(i == 0){
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    FutureBuilder<String>(
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
                            return Text(snapshot.data![0].toUpperCase() + snapshot.data!.substring(1).toLowerCase(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28, color: Colors.grey.shade700, fontFamily: 'Dance'));
                          } else {
                            return const Text('Empty data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      },
                    ),
                    Text('***', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey.shade700, fontFamily: 'Dance')),

                    dataBundle.manageraccess ? ElevatedButton(onPressed: () {

                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateProductScreen(product: Product(
                          category: productCategoryFromJson(currentList![i].name!)
                        ),
                        ),),);
                    },
                    child: Text('Crea ' + currentList![i].name![0].toUpperCase() + currentList![i].name!.substring(1).toLowerCase()),) : SizedBox(height: 0,)
                  ],
                ),
              );
            }else{
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(
                    children: [
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
                                      Text('€ ' + currentList![i].price!.toString().replaceAll('.0', ''), overflow: TextOverflow.ellipsis , style: TextStyle(color:  Colors.grey.shade700, fontSize: 23.0, fontWeight: FontWeight.w600,  fontFamily: 'Dance'),),
                                      Text('',),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      dataBundle.manageraccess ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EditProductScreen(product: currentList![i]),
                              ),);

                          }, icon: Icon(Icons.edit, color: Colors.blue,)),
                          IconButton(onPressed: (){
                            Widget cancelButton = ElevatedButton(
                              child: Text("Elimina"),
                              onPressed:  () async {
                                Response apiV1ProductDeleteDelete
                                = await dataBundle.getSwaggerClient().apiV1ProductDeleteDelete(productId: currentList![i].productId!.toInt());
                                if(apiV1ProductDeleteDelete.isSuccessful){
                                  dataBundle.removeProductById(currentList![i].productId!.toInt());
                                  sleep(Duration(seconds: 1));
                                  Navigator.of(context).pop();
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
                      ) : SizedBox(width: 0,)
                    ],
                  ),
                ],
              );
            }
          }));
    }
    return body;
  }
}