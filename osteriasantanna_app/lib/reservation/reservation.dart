// ignore_for_file: missing_return

import 'package:chopper/chopper.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osteriasantannamenu/databundle/databundleprovider.dart';
import 'package:provider/provider.dart';

import '../osteriasantanna/swagger.swagger.dart';
import '../screens/menu/home_screen.dart';
import '../services/http_service.dart';
import '../utils/costants.dart';
import '../utils/utils.dart';
import 'calendar_body.dart';

class ReservationScreen extends StatefulWidget {
  static String id = 'reservation';

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {







  @override
  Widget build(BuildContext context) {

    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundle, _){
        return Scaffold(
          appBar: AppBar(

            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Osteria Sant\'Anna - Prenota un tavolo", style: TextStyle(fontSize: 20, color:  Color(0xff121212), fontWeight: FontWeight.w400),),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 12, 0),
              child: GestureDetector(
                child: Icon(Icons.home_outlined,
                  size: 30,
                  color: Color(0xff121212),),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen(),
                    ),);
                },
              ),
            ),
          ),
          body: dataBundle.calendarDataRetrieved ? Padding(
            padding: const EdgeInsets.all(18.0),
            child: CalendarBody()
          ) : FutureBuilder(
            future: _getCalendarConfig(dataBundle),
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot){
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
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CalendarBody(),
                );
              }else{
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
              }
            },
          ),
        );
      },
    );
  }

  _getCalendarConfig(DataBundleNotifier dataBundle) async {
    String format = dateFormat.format(DateTime.now());
    try{
      print('Call with this date : ' + format);
      Swagger swagger = dataBundle.getSwaggerClient();
      Response response = await swagger.apiV1CalendarconfFindallGet(fromDate: format);
      print(response.body);
      if(response.isSuccessful){
        List<CalendarConfiguration> list = response.body;
        dataBundle.setCalendarConfList(list);
      }else{
        print('Errore - Riprova');
      }
    }catch(e){
      print(e);
    }
  }

}