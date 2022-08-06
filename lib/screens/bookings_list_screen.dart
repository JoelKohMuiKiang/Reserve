//screen to display the booking timings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/screens/add_bookings_screen.dart';
import 'package:reserve_newest1/screens/edit_bookings_screen.dart';
import 'package:reserve_newest1/services/auth_services.dart';
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

  AuthService authService = AuthService();

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

  Stream<List<Bookings>> getBookingsbyDate() {
    return FirebaseFirestore.instance
        .collection('bookings')
        .where('email', isEqualTo: authService.getCurrentUser()!.email)
        .where('dateofbooking', isEqualTo: selectedDay)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Bookings> ((doc) => Bookings.fromMap(doc.data(), doc.id))
        .toList());
  }

  removeBooking(String? id) {
    showDialog<Null>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              TextButton(onPressed: (){
                setState(() {
                  fsServices.removeBookings(id);
                });
                Navigator.of(context).pop();
              }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('No')),
            ],
          );
        });
  }


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
              StreamBuilder<List<Bookings>>(
                stream: getBookingsbyDate(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('No booking on this date');
                  } if (snapshot.data!.length == 0) {
                    return Text('No booking on this date');
                  }
                  return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Icon(Icons.access_alarm),
                      title: Text(snapshot.data![i].startofbooking! + ' - ' + snapshot.data![i].endofbooking!),
                      subtitle: Text(snapshot.data![i].level! + ', ' + snapshot.data![i].seatnumber!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          removeBooking(snapshot.data![i].id);
                        },
                      ),
                      onTap: () => Navigator.pushNamed(context, EditBookingsScreen.routeName, arguments: snapshot.data![i]),
                    );
                  },
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (ctx, i) {
                      return Divider(height: 3, color: Colors.blueGrey);
                    },
                  );
                }
              )
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
