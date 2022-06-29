import 'package:flutter/material.dart';
import 'package:reserve/booking_database.dart';
import 'package:reserve/models/bookings.dart';
import 'package:reserve/widgets/booking_list.dart';

class MyBooking extends StatefulWidget {
  static String routeName = "/mybooking";

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  var form = GlobalKey<FormState>();

  String? startofbooking;

  String? endofbooking;

  String? level;

  String? seatnumber;

  DateTime? dateofbooking;

  List <Bookings> myBookings = BookingsData.bookingsData;

  void removeItem(i) {
    showDialog<Null>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              TextButton(onPressed: (){
                setState(() {
                  myBookings.removeAt(i);
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

  void saveForm() {
    myBookings.insert(0, Bookings(startofbooking: startofbooking!, endofbooking: endofbooking!, level: level!, seatnumber: seatnumber!, dateofbooking: dateofbooking!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
        title: Text(
        'My Bookings',
        style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
    ),
    ),
    body: ListView(
      children: [
         myBookings.length > 0 ? Container(
           height: 600,
          child: BookingList(myBookings, removeItem),
      ) :
         Column(
           children: [
             SizedBox(height: 20,),
             Text('No Bookings yet, add a new one!',
             style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20))
           ],
         ),
       ]
    )
    );
  }
}
