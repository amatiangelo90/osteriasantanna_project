import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:osteriasantannamenu/screens/menu/wine_menu/wine_widget.dart';
import 'package:osteriasantannamenu/utils/costants.dart';
import 'package:translator/translator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../osteriasantanna/swagger.models.swagger.dart';
import '../../osteriasantanna/swagger.swagger.dart';
import '../../reservation/reservation.dart';
import '../../utils/menu_type.dart';
import '../../databundle/databundleprovider.dart';
import '../components/pinput_widget.dart';
import '../manager_area/calendar/calendar_manager.dart';
import 'a_la_carte_menu/a_la_carte_widget.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double width = 0;
  double height = 0;

  GoogleTranslator translator = GoogleTranslator();


  Future<String> translateCustom(String source, String langTo) async {
    String out = '';
    await translator.translate(source, to: langTo, from: 'it').then((value) => out = value.text);
    return out;
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Consumer<DataBundleNotifier>(
      builder: (_, dataBundle, child){
        return Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(dataBundle.manageraccess ? Icons.home_filled : Icons.settings, size: 40, color: Colors.grey.shade400), onPressed: (){
                          if(dataBundle.manageraccess){
                            dataBundle.turnManagerAccess();
                            Navigator.pushNamed(context, HomeScreen.id);
                          }else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;
                                return AlertDialog(
                                  elevation: 20,

                                  content: Container(
                                      width: width - 100,
                                      height: height *1/6,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Text('Area Gesione - Immetti codice', textAlign: TextAlign.center,),
                                          PinputWidget(),
                                        ],
                                      )),
                                );
                              },
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    color: Colors.white,
                    child: Image.asset('images/donna.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Benvenuti in Osteria Sant\'Anna', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: OSTERIA_GOLD, fontFamily: 'Dance'),),
                  ),
                  SizedBox(height: 22,),
                  ListTile(
                    onTap: () async {
                      await launch('https://osteriasantanna.it/');
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Visita il sito', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xff121212), fontFamily: 'Dance'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.web),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, ReservationScreen.id);
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Prenota un tavolo', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xff121212), fontFamily: 'Dance'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_today),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/santannapattern.png'),
                      fit: BoxFit.fitWidth
                  )
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(dataBundle.currentMenu == Menutype.A_LA_CARTE ?
            'A la carté' : 'Vini',
              style: TextStyle(fontSize: 18.0,
                  color: Colors.grey.shade700, fontFamily: 'Dance', fontWeight: FontWeight.w700),
            ),
            centerTitle: false,
            actions: [
              dataBundle.manageraccess ? Text('') : Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 2, right: 4),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () async {
                    Navigator.pushNamed(context, ReservationScreen.id);
                  },
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset('images/calendar.svg', fit: BoxFit.scaleDown),
                ),
              ),
              dataBundle.manageraccess ? Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 2, right: 4),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () async {
                    Navigator.pushNamed(context, CalendarManager.id);
                  },
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset('images/calendar.svg', fit: BoxFit.scaleDown),
                ),
              ) : Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 2, right: 4),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    showModalBottomSheet(context: context,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context){
                          return Container(
                            height: 420.0,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Text('', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
                                ListTile(
                                  onTap: () async {
                                    dataBundle.setCurrentLanguage('it');
                                    Navigator.pushNamed(context, HomeScreen.id);
                                  },
                                  title: Row(
                                    children: [
                                      SvgPicture.asset('images/italy_flag.svg', width: 30),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('Italiano', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () async {
                                    dataBundle.setCurrentLanguage('en');
                                    Navigator.pushNamed(context, HomeScreen.id);

                                  },
                                  title: Row(
                                    children: [
                                      SvgPicture.asset('images/england_flag.svg', width: 30),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('English', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () async {
                                    dataBundle.setCurrentLanguage('fr');
                                    Navigator.pushNamed(context, HomeScreen.id);
                                  },
                                  title: Row(
                                    children: [
                                      SvgPicture.asset('images/france_flag.svg', width: 30),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('Francés', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () async {
                                    dataBundle.setCurrentLanguage('es');
                                    Navigator.pushNamed(context, HomeScreen.id);
                                  },
                                  title: Row(
                                    children: [
                                      SvgPicture.asset('images/spain_flag.svg', width: 30),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('Español', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () async {
                                    dataBundle.setCurrentLanguage('de');
                                    Navigator.pushNamed(context, HomeScreen.id);
                                  },
                                  title: Row(
                                    children: [
                                      SvgPicture.asset('images/germanyflag.svg', width: 30),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text('German', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
                        });
                  },
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(dataBundle.getImageFromLanguage(), fit: BoxFit.scaleDown),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 2, right: 11),
                child: FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    dataBundle.changemenutype();
                  },
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(dataBundle.currentMenu == Menutype.A_LA_CARTE ? 'images/wine-food-svgrepo-com.svg' : 'images/bookrest.svg'),
                ),
              ),
            ],
          ),
          body: dataBundle.dataRetrieved ? dataBundle.currentMenu == Menutype.A_LA_CARTE ?
          ALaCarteWidget() : WineWidget() : FutureBuilder(
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Center(child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xff121212),
                      )),
                    ),
                    Text('Caricamento dati..')
                  ],
                );
              }else if(snapshot.connectionState == ConnectionState.done){
                return dataBundle.currentMenu == Menutype.A_LA_CARTE ?
                ALaCarteWidget() : WineWidget();
              }else{
                return Column(
                  children: [
                    Center(child: CircularProgressIndicator(
                      color: Color(0xff121212),
                    )),
                    Text('Errore..')
                  ],
                );
              }
            },
            future: initData(dataBundle),
          ),
        );
      },
    );
  }

  initData(DataBundleNotifier bundleNotifier) async {

    if(bundleNotifier.prodList.isEmpty){
      Response<List<Product>> apiV1ProductFindallGet = await bundleNotifier.getSwaggerClient().apiV1ProductFindallGet();
      if(apiV1ProductFindallGet.isSuccessful){
        bundleNotifier.setProdList(apiV1ProductFindallGet.body);

      }else{
        print(apiV1ProductFindallGet.error);
      }
    }else{
      print('List already full');
    }

    if(bundleNotifier.wineList.isEmpty){
      Response<List<Wine>> apiV1WineFindallGet = await bundleNotifier.getSwaggerClient().apiV1WineFindallGet();
      if(apiV1WineFindallGet.isSuccessful){
        bundleNotifier.setWineList(apiV1WineFindallGet.body);
      }else{
        print(apiV1WineFindallGet.error);
      }
    }else{
      print('Wine List already full');
    }

    bundleNotifier.dataRetrievedMethod(true);
    return;
  }
}




