import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:test_calendar/calendar.dart';
import 'package:test_calendar/header_calendar.dart';
import 'package:test_calendar/weekday_canlendar.dart';

class CalendarMultiSelect extends StatefulWidget {
  CalendarMultiSelect({Key key}) : super(key: key);

  @override
  _CalendarMultiSelectState createState() => _CalendarMultiSelectState();
}

class _CalendarMultiSelectState extends State<CalendarMultiSelect> {
  final EventList<Event> _selectedDates = EventList<Event>();
  final DateTime _now = DateTime.now();
  DateTime _firstDateOfCurrentMonth;

  @override
  void initState() {
    super.initState();
    _firstDateOfCurrentMonth = DateTime(_now.year, _now.month, 1);
  }

  // select all dates week in a month
  void _selectDatesInMonth(int dayInWeek) {
    final DateTime startDate = _firstDateOfCurrentMonth;
    final DateTime endDate = DateTime(startDate.year, startDate.month + 1, 1)
        .subtract(Duration(days: 1));
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      final DateTime currentDate = startDate.add(Duration(days: i));
      if (currentDate.weekday == dayInWeek) {
        setState(() {
          if (_selectedDates.getEvents(currentDate).isNotEmpty) {
            _selectedDates.remove(currentDate, Event(date: currentDate));
          } else {
            _selectedDates.add(currentDate, Event(date: currentDate));
          }
        });
      }
    }
  }

  // select all dates week row in a month
  void _selectDatesRowInMonth(int numberWeek) {
    final int weekDay = _firstDateOfCurrentMonth.weekday;
    final DateTime selectedDate = _firstDateOfCurrentMonth.add(Duration(days: 7*(numberWeek - 1)));
    final DateTime startDayOfWeek = selectedDate.subtract(Duration(days: weekDay - 1));
    final DateTime endDayOfWeek = startDayOfWeek.add(Duration(days: 6));
    for (int i = 0; i <= endDayOfWeek.difference(startDayOfWeek).inDays; i++) {
      final DateTime currentDate = startDayOfWeek.add(Duration(days: i));
      if (currentDate.month == _firstDateOfCurrentMonth.month) {
        setState(() {
          if (_selectedDates.getEvents(currentDate).isNotEmpty) {
            _selectedDates.remove(currentDate, Event(date: currentDate));
          } else {
            _selectedDates.add(currentDate, Event(date: currentDate));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderCalendar(
          currentDate: _firstDateOfCurrentMonth,
          prev1Month: () {
            setState(() {
              _firstDateOfCurrentMonth = DateTime(_firstDateOfCurrentMonth.year,
                  _firstDateOfCurrentMonth.month - 1, 1);
            });
          },
          next1Month: () {
            setState(() {
              _firstDateOfCurrentMonth = DateTime(_firstDateOfCurrentMonth.year,
                  _firstDateOfCurrentMonth.month + 1, 1);
            });
          },
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        child: Text('1'),
                        onTap: () => _selectDatesRowInMonth(1),
                      ),
                      GestureDetector(
                        child: Text('2'),
                        onTap: () => _selectDatesRowInMonth(2),
                      ),
                      GestureDetector(
                        child: Text('3'),
                        onTap: () => _selectDatesRowInMonth(3),
                      ),
                      GestureDetector(
                        child: Text('4'),
                        onTap: () => _selectDatesRowInMonth(4),
                      ),
                      GestureDetector(
                        child: Text('5'),
                        onTap: () => _selectDatesRowInMonth(5),
                      ),
                      GestureDetector(
                        child: Text('6'),
                        onTap: () => _selectDatesRowInMonth(6),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  // color: Colors.yellow,
                  child: Column(
                    children: <Widget>[
                      WeekdayCalendar(selectDatesInMonth: _selectDatesInMonth),
                      Calendar(
                        showHeader: false,
                        showWeekDays: false,
                        selectedDateTime: _firstDateOfCurrentMonth,
                        todayTextStyle: TextStyle(color: Colors.black),
                        todayButtonColor: Colors.white,
                        markedDatesMap: _selectedDates,
                        onDayPressed: (DateTime datetime, _) {
                          setState(() {
                            if (_selectedDates.getEvents(datetime).isNotEmpty) {
                              _selectedDates.remove(
                                  datetime, Event(date: datetime));
                            } else {
                              _selectedDates.add(
                                  datetime, Event(date: datetime));
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
