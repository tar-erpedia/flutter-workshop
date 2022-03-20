import 'package:flutter/material.dart';
import 'package:flutter_workshop/globals.dart';
import 'package:flutter_workshop/model/shift.dart';
import 'package:flutter_workshop/widgets/appbar.dart';
import 'package:flutter_workshop/widgets/drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appbar,
      drawer: drawer(context),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: CalendarShiftsDataSource(_getDataSource(shifts)),
      ));
}

List<CalendarShift> _getDataSource(List<Shift> shiftsSource) {
  final List<CalendarShift> shifts = <CalendarShift>[];
  DateTime date;
  DateTime startTime;
  String toran;
  ShiftTime time;
  DateTime endTime;

  for (var shift in shiftsSource) {
    date = shift.date;
    toran = shift.toran;
    time = shift.shift;

    if (time == ShiftTime.morning) {
      startTime = DateTime(date.year, date.month, date.day, 8, 0, 0);
      endTime = startTime.add(const Duration(hours: 9));
    } else {
      startTime = DateTime(date.year, date.month, date.day, 17, 0, 0);
      endTime = startTime.add(const Duration(hours: 15));
    }
    shifts.add(CalendarShift(toran, startTime, endTime));
  }

  return shifts;
}

class CalendarShiftsDataSource extends CalendarDataSource {
  CalendarShiftsDataSource(List<CalendarShift> source) {
    appointments = source;
  }

  @override
  String getSubject(int index) {
    return appointments![index].toran;
  }
}

class CalendarShift {
  CalendarShift(this.toran, this.startTime, this.endTime);

  String toran;
  DateTime startTime;
  DateTime endTime;
}
