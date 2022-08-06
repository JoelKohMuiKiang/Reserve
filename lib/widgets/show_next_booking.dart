import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/services/firestore_services.dart';

class ShowNextBookingWidget extends StatefulWidget {

  @override
  State<ShowNextBookingWidget> createState() => _ShowNextBookingWidgetState();
}

class _ShowNextBookingWidgetState extends State<ShowNextBookingWidget> {
  FireStoreServices fsServices = FireStoreServices();

  String? startofbooking;

  String? endofbooking;

  String? level;

  String? seatnumber;

  DateTime? dateofbooking;

  // showNextBooking() {
  //   if (startofbooking == null || endofbooking == null || level == null || seatnumber == null) {
  //     return Text (snapshot.data![0].startofbooking! + ' - ' + snapshot.data![0].endofbooking!, style: TextStyle(
  //         fontSize: 20
  //     ))
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Bookings>>(
      stream: fsServices.getBookings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else {
          return Container(
            width: 330,
              child: Text(snapshot.data![0].startofbooking == null || snapshot.data![0].endofbooking == null || snapshot.data![0].level == null || snapshot.data![0].seatnumber == null || snapshot.data![0].dateofbooking == null
                  ? 'Next Booking Slot: -':
              "Next Booking Slot: " + snapshot.data![0].startofbooking! + ' - ' + snapshot.data![0].endofbooking! + ', '
              + snapshot.data![0].level! + ', ' + snapshot.data![0].seatnumber! + ', ' + DateFormat('EEEE, dd/MM/yyyy').format(snapshot.data![0].dateofbooking!),
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)
          );
        }
      }
    );
  }
}
