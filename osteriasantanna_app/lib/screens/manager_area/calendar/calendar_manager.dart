import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarManager extends StatefulWidget {
  const CalendarManager({Key? key}) : super(key: key);

  static String id = 'calendarmanager';

  @override
  State<CalendarManager> createState() => _CalendarManagerState();
}

class _CalendarManagerState extends State<CalendarManager> {

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: TableCalendar(
          firstDay: DateTime.utc(now.year, now.month, now.day),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),

        ),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios, color: Color(0xff121212))),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Configura apertura ristorante', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff121212), fontFamily: 'Dance'),),
        ),
      )
    );
  }
}
