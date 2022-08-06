//screen to display the booking timings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/screens/add_bookings_screen.dart';
import 'package:reserve_newest1/services/firestore_services.dart';
import 'package:reserve_newest1/widgets/app_drawer.dart';
import 'package:reserve_newest1/widgets/bookings_list.dart';
import 'package:reserve_newest1/widgets/calendar_view.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingsListScreen extends StatefulWidget {
  //route name for the Bookings List Screen
  static String routeName = '/bookings-list';

  @override
  State<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends State<BookingsListScreen> {
  late Map<DateTime, List<Bookings>> selectedBookings;

  // @override
  // Widget build(BuildContext context) {
  //   FireStoreServices fsServices = FireStoreServices();
  //
  //   return StreamBuilder<List<Bookings>>(
  //     stream: fsServices.getBookings(),
  //     builder: (context, snapshot) {
  //       return snapshot.connectionState == ConnectionState.waiting? Center(child: CircularProgressIndicator()):
  //         Scaffold(
  //         appBar: AppBar(
  //           title: Text('My Bookings'),
  //         ),
  //         body: Container(
  //           alignment: Alignment.center,
  //           child: snapshot.data!.length > 0 ? BookingsList() :
  //               Column(
  //                 children: [
  //                   SizedBox(height: 20),
  //                   Text('No bookings yet, add a new one today!',
  //                       style: Theme.of(context).textTheme.subtitle1),
  //                 ],
  //               )
  //         ),
  //           drawer: AppDrawer(),
  //           floatingActionButton: FloatingActionButton(
  //             onPressed: ()
  //             {Navigator.of(context).pushNamed(AddBookingsScreen.routeName); },
  //             child: Icon(Icons.add)
  //         ),
  //       );
  //     }
  //   );
  // }

  CalendarFormat format = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  FireStoreServices fsServices = FireStoreServices();
  late Stream<List<Bookings>> bookingsStream;


  @override
  void initState() {
    selectedBookings = {};
    bookingsStream = fsServices.getBookings();
    super.initState();
  }

  List<Bookings> _getBookingsfromDay(DateTime date) {
    return selectedBookings[date]??[];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Bookings>>(
      stream: bookingsStream,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting ?
        Center(child: CircularProgressIndicator()) :
          Scaffold(
            appBar: AppBar(
            title: Text('My Bookings'),
          ),
          body: Column(
            children: [
              TableCalendar(
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
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(DateFormat('EEEE, dd/MM/yyyy').format(selectedDay));
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
              ),
              SingleChildScrollView(
                child: BookingsList(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {Navigator.of(context).pushNamed(AddBookingsScreen.routeName, arguments: selectedDay);},
            child: Icon(Icons.add)
          ),
          drawer: AppDrawer(),
        );
      }
    );
  }
}
