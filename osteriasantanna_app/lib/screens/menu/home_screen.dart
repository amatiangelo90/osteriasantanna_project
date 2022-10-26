import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:osteriasantannamenu/screens/menu/sushi_menu/sushi_widget.dart';
import 'package:osteriasantannamenu/screens/menu/wine_menu/wine_widget.dart';
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../../reservation/reservation.dart';
import '../../utils/costants.dart';
import '../../utils/menu_type.dart';
import '../../databundle/databundleprovider.dart';
import '../components/pinput_widget.dart';
import 'a_la_carte_menu/a_la_carte_widget.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'a_la_carte';

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
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/santannapattern.png'),
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
              leading: IconButton(
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
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(dataBundle.currentMenu == Menutype.A_LA_CARTE ?
              'A la carté'
                  : dataBundle.currentMenu == Menutype.SUSHI ?  'Sushi & Suscie' : 'Carta Vini',
                style: TextStyle(fontSize: 24.0,
                    color: Colors.grey.shade700, fontFamily: 'Dance', fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              actions: [
                Padding(
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
                    child: SvgPicture.asset(dataBundle.currentMenu == Menutype.A_LA_CARTE ?
                    'images/sushiicon.svg'
                        : dataBundle.currentMenu == Menutype.SUSHI ? 'images/wine-food-svgrepo-com.svg' : 'images/bookrest.svg'),
                  ),
                ),
              ],
            ),
            body: dataBundle.currentMenu == Menutype.A_LA_CARTE ?
            ALaCarteWidget() : dataBundle.currentMenu == Menutype.SUSHI ? SushiWidget() : WineWidget(),
        );
      },
    );
  }
}




