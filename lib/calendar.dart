import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key key,
    this.onDayPressed,
    this.minSelectedDate,
    this.maxSelectedDate,
    this.selectedDateTime,
    this.markedDatesMap,
    this.todayTextStyle,
    this.todayButtonColor,
    this.onCalendarChanged,
    this.showHeader = true,
    this.showWeekDays = true,
  }) : super(key: key);

  final EventList<Event> markedDatesMap;
  final DateTime minSelectedDate;
  final DateTime maxSelectedDate;
  final DateTime selectedDateTime;
  final Color todayButtonColor;
  final void Function(DateTime, List<Event>) onDayPressed;
  final void Function(DateTime) onCalendarChanged;
  final TextStyle todayTextStyle;
  final bool showHeader;
  final bool showWeekDays;

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      showHeader: showHeader,
      showWeekDays: showWeekDays,
      selectedDateTime: selectedDateTime,
      selectedDayButtonColor: Colors.white,
      selectedDayTextStyle: TextStyle(color: Colors.black),
      showOnlyCurrentMonthDate: true,
      isScrollable: true,
      onDayPressed: onDayPressed,
      childAspectRatio: 1,
      height: 330,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      onCalendarChanged: onCalendarChanged,
      locale: 'fr',
      minSelectedDate: minSelectedDate,
      maxSelectedDate: maxSelectedDate,
      markedDatesMap: markedDatesMap,
      markedDateShowIcon: true,
      markedDateWidget: const Placeholder(),
      todayTextStyle: todayTextStyle,
      todayButtonColor: todayButtonColor,
      dayPadding: 0,
      markedDateIconBuilder: (Event event) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Text(
            DateFormat('d', 'fr').format(event.getDate()),
          ),
        );
      },
      todayBorderColor: Colors.transparent,
    );
  }
}
