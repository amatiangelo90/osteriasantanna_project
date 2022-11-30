import 'dart:collection';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osteriasantannamenu/databundle/databundleprovider.dart';
import 'package:provider/provider.dart';
import '../../../calendar/src/customization/calendar_style.dart';
import '../../../calendar/src/shared/utils.dart';
import '../../../calendar/src/table_calendar.dart';
import '../../../osteriasantanna/swagger.models.swagger.dart';
import '../../../osteriasantanna/swagger.swagger.dart';
import '../../../utils/costants.dart';

class CalendarManager extends StatefulWidget {
  const CalendarManager({Key? key}) : super(key: key);

  static String id = 'calendarmanager';

  @override
  State<CalendarManager> createState() => _CalendarManagerState();
}

class _CalendarManagerState extends State<CalendarManager> {

  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late ValueNotifier<List<CalendarConfiguration>> _selectedCalendarConfig;
  final LinkedHashMap<DateTime, List<CalendarConfiguration>> _kConf = LinkedHashMap();

  List<CalendarConfiguration> _getConfigForDay(DateTime day){
    return _kConf[day] ?? [];
  }

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _selectedCalendarConfig = ValueNotifier(_getConfigForDay(_focusedDay));
    super.initState();
  }

  void _onDaySelected(DateTime selectedDay,
      DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedCalendarConfig.value = _getConfigForDay(selectedDay);
    }
  }

  LinkedHashMap<DateTime, List<CalendarConfiguration>> getKConfiguration(List<CalendarConfiguration> calConfList) {


    var linkedHashMap = LinkedHashMap<DateTime, List<CalendarConfiguration>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(buildListEvent(calConfList));

    return linkedHashMap;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Map<DateTime, List<CalendarConfiguration>> buildListEvent(List<CalendarConfiguration> calConf) {


    Map<DateTime, List<CalendarConfiguration>> map1 = Map();
    calConf.forEach((calendarConf) {
      map1[DateTime.utc(dateFormat.parse(calendarConf.date!).year, dateFormat.parse(calendarConf.date!).month, dateFormat.parse(calendarConf.date!).day, 0 ,0 ,0 ,0, 0)] = [calendarConf];
    });
    return map1;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff121212))),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Configura apertura ristorante', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff121212), fontFamily: 'Dance'),),
      ),
      body: Consumer<DataBundleNotifier>(
        builder: (child, dataBundle, _){
          _kConf.addAll(getKConfiguration(dataBundle.calendarConfList));
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.purple,),
                          Text('  Pranzo - Cena', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff121212), fontFamily: 'Dance'))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.red,),
                          Text('  Solo Cena', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff121212), fontFamily: 'Dance'))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green,),
                          Text('  Solo Pranzo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff121212), fontFamily: 'Dance'))
                        ],
                      ),
                    ],
                  ),
                ),
                TableCalendar<CalendarConfiguration>(
                  eventLoader: _getConfigForDay,
                  rangeSelectionMode: _rangeSelectionMode,
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: const TextStyle(fontSize: 14.0,  fontWeight: FontWeight.bold, color: Colors.red),
                    defaultTextStyle: TextStyle(fontSize: 14.0,  fontWeight: FontWeight.bold, color: Color(0xff121212)),
                    markerSize: 14,
                    selectedDecoration: const BoxDecoration(
                      color: Color(0xff121212),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                    canMarkersOverflow: true,
                    isTodayHighlighted: true,
                  ),
                  firstDay: DateTime.now(),
                  lastDay:DateTime.now().add(Duration(days: 50)),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<List<CalendarConfiguration>>(
                    valueListenable: _selectedCalendarConfig,
                    builder: (context, calList, child) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: calList.length,
                        itemBuilder: (context, cal) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                calList[cal].launch == CalendarConfigurationLaunch.open ? ElevatedButton(
                                  onPressed: () async {

                                    Response apiV1CalendarconfUpdatePut = await dataBundle.getSwaggerClient().apiV1CalendarconfUpdatePut(
                                      calendarConfId: calList[cal].calendarConfId!.toInt(),
                                      launch: calendarConfigurationLaunchToJson(CalendarConfigurationLaunch.close),
                                      dinner: calendarConfigurationDinnerToJson(calList[cal]!.dinner),
                                      date: calList[cal].date);

                                    print('call: ' + apiV1CalendarconfUpdatePut.body.toString());

                                    if(apiV1CalendarconfUpdatePut.isSuccessful){
                                      dataBundle.updateCalendar(apiV1CalendarconfUpdatePut.body);
                                    }
                                  },
                                  child: Text('Chiudi a pranzo'),
                                ) : Text(''),

                                calList[cal].launch == CalendarConfigurationLaunch.close ? ElevatedButton(
                                  onPressed: () async {

                                    Response apiV1CalendarconfUpdatePut = await dataBundle.getSwaggerClient().apiV1CalendarconfUpdatePut(
                                        calendarConfId: calList[cal].calendarConfId!.toInt(),
                                        launch: calendarConfigurationLaunchToJson(CalendarConfigurationLaunch.open),
                                        dinner: calendarConfigurationDinnerToJson(calList[cal]!.dinner),
                                        date: calList[cal].date);

                                    print('call: ' + apiV1CalendarconfUpdatePut.body.toString());

                                    if(apiV1CalendarconfUpdatePut.isSuccessful){
                                      dataBundle.updateCalendar(apiV1CalendarconfUpdatePut.body);
                                    }
                                  },
                                  child: Text('Apri a pranzo'),
                                ) : Text(''),

                                calList[cal].dinner == CalendarConfigurationDinner.open ? ElevatedButton(
                                  onPressed: () async {

                                    Response apiV1CalendarconfUpdatePut = await dataBundle.getSwaggerClient().apiV1CalendarconfUpdatePut(
                                        calendarConfId: calList[cal].calendarConfId!.toInt(),
                                        dinner: calendarConfigurationDinnerToJson(CalendarConfigurationDinner.close),
                                        launch: calendarConfigurationLaunchToJson(calList[cal]!.launch),
                                        date: calList[cal].date);

                                    if(apiV1CalendarconfUpdatePut.isSuccessful){
                                      dataBundle.updateCalendar(apiV1CalendarconfUpdatePut.body);
                                    }
                                  },
                                  child: Text('Chiudi a cena'),
                                ) : Text(''),

                                calList[cal].dinner == CalendarConfigurationDinner.close ? ElevatedButton(
                                  onPressed: () async {

                                    Response apiV1CalendarconfUpdatePut = await dataBundle.getSwaggerClient().apiV1CalendarconfUpdatePut(
                                        calendarConfId: calList[cal].calendarConfId!.toInt(),
                                        dinner: calendarConfigurationDinnerToJson(CalendarConfigurationDinner.open),
                                        launch: calendarConfigurationLaunchToJson(calList[cal]!.launch),
                                        date: calList[cal].date);

                                    if(apiV1CalendarconfUpdatePut.isSuccessful){
                                      dataBundle.updateCalendar(apiV1CalendarconfUpdatePut.body);
                                    }
                                  },
                                  child: Text('Apri a cena'),
                                ) : Text(''),


                              ],
                            ),
                          );
                          },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
