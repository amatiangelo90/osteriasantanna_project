// ignore_for_file: missing_return

import 'package:chopper/chopper.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osteriasantannamenu/databundle/databundleprovider.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';

import '../osteriasantanna/swagger.swagger.dart';
import '../screens/menu/home_screen.dart';
import '../services/http_service.dart';
import '../utils/costants.dart';
import '../utils/utils.dart';

class ReservationScreen extends StatefulWidget {
  static String id = 'reservation';

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  Color _resColor = Colors.green.shade700.withOpacity(0.8);
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now().subtract(Duration(days: 10));
  final _datePikerController = DatePickerController();

  String buildMessageReservation(
      String name,
      String date,
      String slot,
      DateTime selectedDateTime,
      String coperti
      ) {
    String message =
        "RICHIESTA PRENOTAZIONE%0a" +
            "%0aOsteria Sant'Anna%0a"+
            "%0aNome: $name%0a" +
            "%0aIndirizzo: Viale Stazione 12" +
            "%0aCittà: Cisternino(BR) (72014)" +
            "%0a" +
            "%0aData Prenotazione: " + Utils.getWeekDay(selectedDateTime.weekday) +" ${selectedDateTime.day} " + Utils.getMonthDay(selectedDateTime.month) +

            "%0aOre: $slot " +
            "%0aCoperti : $coperti"
    ;

    message = message.replaceAll('&', '%26');
    return message;

  }

  String getCurrentDateTime() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMd().add_jm();
    return formatter.format(now);
  }

  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  String time = '';
  int covers = 0;

  void _submit() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dettagli prenotazione'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Nome:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(_nameController.text + " " + _lastNameController.text),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Coperti",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(covers.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Data",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(_selectedDateTime.day.toString() +'/'+_selectedDateTime.month.toString()+'/'+_selectedDateTime.year.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Ora",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(time),
                ),

              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: _resColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    child: const Text('INVIA'),
                    onPressed: () {
                      HttpService.sendMessage(numberSantAnna,
                          buildMessageReservation(
                              _nameController.value.text + ' ' + _lastNameController.value.text,
                              getCurrentDateTime(),
                              time,
                              _selectedDateTime,
                              covers.toString()),
                          _nameController.value.text,
                          '0',
                          getCurrentDateTime(),
                          'null',
                          '',
                          '',
                          Utils.getWeekDay(_selectedDateTime.weekday) +" ${_selectedDateTime.day} " + Utils.getMonthDay(_selectedDateTime.month),
                          time,
                          EMPTY_STRING
                      );
                    },
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<DataBundleNotifier>(
      builder: (child, dataBundle, _){
        return Scaffold(
          appBar: AppBar(

            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Osteria Sant\'Anna - Prenota un tavolo", style: TextStyle(fontSize: 13, color:  Color(0xff121212), fontWeight: FontWeight.w400),),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                          labelText: 'Nome',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 3) {
                          return 'Inserire il nome';
                        } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                          return 'Inserire il nome senza caratteri speciali';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                          labelText: 'Cognome',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 3) {
                          return 'Inserire il cognome';
                        } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                          return 'Inserire il cognome senza caratteri speciali';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Coperti:'),
                        ],
                      ),
                    ),
                    DropdownButtonFormField(
                      validator: (value) {
                        if (covers == 0) {
                          return 'Inserire il numero di coperti';
                        }
                      },
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      items: [
                        const DropdownMenuItem(
                          child: Center(child: Text("1")),
                          value: 1,
                        ),
                        const DropdownMenuItem(
                          child: Center(child: Text("2")),
                          value: 2,
                        ),
                        const DropdownMenuItem(
                          child: Center(child: Text("3")),
                          value: 3,
                        ),
                        const DropdownMenuItem(
                          child: Center(child: Text("4")),
                          value: 4,
                        ),
                        const DropdownMenuItem(
                          child: Center(child: Text("5")),
                          value: 5,
                        ),
                        const DropdownMenuItem(
                          child: Center(child: Text("6")),
                          value: 6,
                        ),
                      ],
                      hint: const Text("Seleziona numero coperti"),
                      onChanged: (int? value) {
                        setState(() {
                          covers = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Data:'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          DatePicker(
                            DateTime.now(),
                            activeDates: dataBundle.getActiveDates(),
                            dateTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 16.0, fontFamily: 'Dance'),
                            dayTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 14.0, fontFamily: 'Dance'),
                            monthTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 12.0, fontFamily: 'Dance'),
                            selectionColor: _resColor,
                            deactivatedColor: Colors.grey,
                            selectedTextColor: Colors.white,
                            daysCount: 25,
                            locale: 'it',
                            controller: _datePikerController,
                            onDateChange: (date) {
                              setState((){
                                _selectedDateTime = date;
                              });
                              dataBundle.setCurrentHoursList(date);
                              if(date.day == 25 && date.month == 12){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        content: PinchZoom(
                                          child: Image.asset('images/menusantanna.jpeg'),
                                          resetDuration: const Duration(milliseconds: 100),
                                          maxScale: 2.5,
                                        ),
                                      );
                                    }
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Ora:'),
                        ],
                      ),
                    ),
                    DropdownButtonFormField(
                      validator: (value) {
                        if (time == '') {
                          return 'Inserire ora di arrivo';
                        }else if(_selectedDateTime == null){
                          return 'Inserire la data arrivo';
                        }
                      },
                      key: _key,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      items: dataBundle.currentHoursList,
                      hint: const Text("Seleziona Orario"),
                      onChanged: (value) {
                        setState(() {
                          time = getTimeFromIndex(value);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.97,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(_resColor),
                          padding: MaterialStateProperty.all(EdgeInsets.all(30)),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        ),
                        onPressed: () {
                          if(_nameController.text == ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Inserisci il nome"),
                            ));
                          }else if(_lastNameController.text == ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Inserisci il cognome"),
                            ));
                          }else if(covers == 0){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Seleziona il numero di coperti"),
                            ));
                          }else if(_selectedDateTime.isBefore(DateTime.now().subtract(Duration(days: 1)))){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Seleziona il giorno"),
                            ));
                          }else if(time == ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Seleziona l'\orario di arrivo"),
                            ));
                          }else{
                            _submit();
                          }

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("INVIA PRENOTAZIONE", style: TextStyle(fontSize: 17)),
                            Image.asset('images/whatapp_icon_c.png', height: 40,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
                  child:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                labelText: 'Nome',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder()),
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 3) {
                                return 'Inserire il nome';
                              } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                                return 'Inserire il nome senza caratteri speciali';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                labelText: 'Cognome',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder()),
                            controller: _lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 3) {
                                return 'Inserire il cognome';
                              } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                                return 'Inserire il cognome senza caratteri speciali';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Coperti:'),
                              ],
                            ),
                          ),
                          DropdownButtonFormField(
                            validator: (value) {
                              if (covers == 0) {
                                return 'Inserire il numero di coperti';
                              }
                            },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder()),
                            items: [
                              const DropdownMenuItem(
                                child: Center(child: Text("1")),
                                value: 1,
                              ),
                              const DropdownMenuItem(
                                child: Center(child: Text("2")),
                                value: 2,
                              ),
                              const DropdownMenuItem(
                                child: Center(child: Text("3")),
                                value: 3,
                              ),
                              const DropdownMenuItem(
                                child: Center(child: Text("4")),
                                value: 4,
                              ),
                              const DropdownMenuItem(
                                child: Center(child: Text("5")),
                                value: 5,
                              ),
                              const DropdownMenuItem(
                                child: Center(child: Text("6")),
                                value: 6,
                              ),
                            ],
                            hint: const Text("Seleziona numero coperti"),
                            onChanged: (int? value) {
                              setState(() {
                                covers = value!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Data:'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                DatePicker(
                                  DateTime.now(),
                                  activeDates: dataBundle.getActiveDates(),
                                  dateTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 16.0, fontFamily: 'Dance'),
                                  dayTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 14.0, fontFamily: 'Dance'),
                                  monthTextStyle: TextStyle(color: Color(0xFF282828), fontWeight: FontWeight.w700, fontSize: 12.0, fontFamily: 'Dance'),
                                  selectionColor: _resColor,
                                  deactivatedColor: Colors.grey,
                                  selectedTextColor: Colors.white,
                                  daysCount: 25,
                                  locale: 'it',
                                  controller: _datePikerController,
                                  onDateChange: (date) {
                                    setState((){
                                      _selectedDateTime = date;
                                    });
                                    dataBundle.setCurrentHoursList(date);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Ora:'),
                              ],
                            ),
                          ),
                          DropdownButtonFormField(
                            validator: (value) {
                              if (time == '') {
                                return 'Inserire ora di arrivo';
                              }else if(_selectedDateTime == null){
                                return 'Inserire la data arrivo';
                              }
                            },
                            key: _key,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder()),
                            items: dataBundle.currentHoursList,
                            hint: const Text("Seleziona Orario"),
                            onChanged: (value) {
                              setState(() {
                                time = getTimeFromIndex(value);
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.97,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(_resColor),
                                padding: MaterialStateProperty.all(EdgeInsets.all(30)),
                                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                              ),
                              onPressed: () {
                                if(_nameController.text == ''){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Inserisci il nome"),
                                  ));
                                }else if(_lastNameController.text == ''){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Inserisci il cognome"),
                                  ));
                                }else if(covers == 0){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Seleziona il numero di coperti"),
                                  ));
                                }else if(_selectedDateTime.isBefore(DateTime.now().subtract(Duration(days: 1)))){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Seleziona il giorno"),
                                  ));
                                }else if(time == ''){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Seleziona l'\orario di arrivo"),
                                  ));
                                }else{
                                  _submit();
                                }

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("INVIA PRENOTAZIONE", style: TextStyle(fontSize: 17)),
                                  Image.asset('images/whatapp_icon_c.png', height: 40,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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

  String getTimeFromIndex(value) {
    switch(value){
      case 1:
        return '12.30';
      case 2:
        return '13.00';
      case 3:
        return '13.30';
      case 4:
        return '20.00';
      case 5:
        return '20.30';
      case 6:
        return '21.00';
      case 7:
        return '21.30';
      case 8:
        return '22.00';
      default:
        return '';
    }
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
