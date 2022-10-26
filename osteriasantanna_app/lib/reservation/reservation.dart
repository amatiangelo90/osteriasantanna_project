// ignore_for_file: missing_return

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime _selectedDateTime = DateTime.now();
  final _datePikerController = DatePickerController();

  List<DropdownMenuItem> _listHours = [
    const DropdownMenuItem(
      child: Center(child: Text("12:30")),
      value: 1,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("13:00")),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("13:30")),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("14:00")),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("20:00")),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("20:30")),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("21:00")),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("21:30")),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("22:00")),
      value: 9,
    ),
  ];

  List<DropdownMenuItem> _listHoursLunch = [
    const DropdownMenuItem(
      child: Center(child: Text("12:30")),
      value: 1,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("13:00")),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("13:30")),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Center(child: Text("14:00")),
      value: 4,
    ),
  ];

  List<DropdownMenuItem> _currentList = [];

  @override
  void initState() {
    super.initState();
    _currentList = _listHours;
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

  String getCurrentDateTime() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMd().add_jm();
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _resColor,
        centerTitle: false,
        title: const Text("Prenotazione Osteria Sant\'Anna", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 12, 0),
          child: GestureDetector(
            child: Icon(Icons.home_outlined,
              size: 30,
              color: Colors.white,),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen(),
                ),);
            },
          ),
        ),
      ),
      body: Padding(
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
                        inactiveDates: Utils.getUnavailableData(),
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
                          _setSelectedDate(date);
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
                        _submit();
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
      ),
    );
  }

  void _setSelectedDate(DateTime date) {

    setState(() {
      _selectedDateTime = date;
      time = '';
      if(_selectedDateTime.weekday != 7){
        _currentList = _listHours;
      }else{
        _currentList = _listHoursLunch;
      }

    });
  }
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

}