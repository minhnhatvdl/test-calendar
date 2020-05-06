import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderCalendar extends StatelessWidget {
  const HeaderCalendar({
    this.currentDate,
    this.firstDateNextMonth,
    this.next1Month,
    this.prev1Month,
    Key key,
  }) : super(key: key);
  final DateTime currentDate;
  final DateTime firstDateNextMonth;
  final VoidCallback next1Month;
  final VoidCallback prev1Month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: prev1Month,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                DateFormat.yMMMM().format(currentDate),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.arrow_forward_ios),
            onTap: next1Month,
          )
        ],
      ),
    );
  }
}
