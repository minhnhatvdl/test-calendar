import 'package:flutter/material.dart';

class WeekdayCalendar extends StatelessWidget {
  const WeekdayCalendar({
    this.selectDatesInMonth,
    Key key,
  }) : super(key: key);
  final Function(int) selectDatesInMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
            child: Text('Mon'),
            onTap: () => selectDatesInMonth(DateTime.monday)),
        GestureDetector(
            child: Text('Tue'),
            onTap: () => selectDatesInMonth(DateTime.tuesday)),
        GestureDetector(
            child: Text('Wed'),
            onTap: () => selectDatesInMonth(DateTime.wednesday)),
        GestureDetector(
            child: Text('Thu'),
            onTap: () => selectDatesInMonth(DateTime.thursday)),
        GestureDetector(
            child: Text('Fri'),
            onTap: () => selectDatesInMonth(DateTime.friday)),
        GestureDetector(
            child: Text('Sat'),
            onTap: () => selectDatesInMonth(DateTime.saturday)),
        GestureDetector(
            child: Text('Sun'),
            onTap: () => selectDatesInMonth(DateTime.sunday)),
      ],
    );
  }
}
