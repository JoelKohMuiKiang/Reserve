import 'package:flutter/material.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {

  late Map<DateTime, List<Bookings>> selectedBookings;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedBookings = {};
    super.initState();
  }

  List<Bookings> _getBookingsfromDay(DateTime date) {
    return selectedBookings[date]??[];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(2022),
      lastDay: DateTime(2023),
      calendarFormat: format,
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          format = _format;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,onDaySelected: (DateTime selectDay, DateTime focusDay) {
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
        print(focusedDay );
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDay, date);
      },

      eventLoader: _getBookingsfromDay,

      //to style the Calendar
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          // shape: BoxShape.circle,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.purpleAccent,
          // shape: BoxShape.circle,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        defaultDecoration: BoxDecoration(
          // shape: BoxShape.circle,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        weekendDecoration: BoxDecoration(
          // shape: BoxShape.circle,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: true,
        titleCentered: true,
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        formatButtonTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
