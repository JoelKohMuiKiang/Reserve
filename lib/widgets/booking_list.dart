import 'package:flutter/material.dart';
import 'package:reserve/screens/edit_booking_page.dart';

import '../models/bookings.dart';

class BookingList extends StatelessWidget {

  List <Bookings> myBookings;
  Function removeItem;

  BookingList (this.myBookings, this.removeItem);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(myBookings[i].startofbooking! + ' - ' + myBookings[i].endofbooking!,
          style: TextStyle(fontFamily: 'ITCKRIST'),),
          subtitle: Text(myBookings[i].level! + ', ' + myBookings[i].seatnumber!,
            style: TextStyle(fontFamily: 'ITCKRIST'),),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeItem(i);
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, EditBookingsPage.routeName,arguments: i);
          },
        );
      },
      itemCount: myBookings.length,
      separatorBuilder: (ctx, i) {
        return Divider( height: 3, color: Colors.blueGrey);
      },
    );
  }
}
