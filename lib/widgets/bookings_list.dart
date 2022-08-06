//this is a custom widget for my ListView so that my code in the main.dart looks cleaner

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/screens/edit_bookings_screen.dart';
import 'package:reserve_newest1/services/firestore_services.dart';

class BookingsList extends StatefulWidget {

  @override
  State<BookingsList> createState() => _BookingsListState();
}

class _BookingsListState extends State<BookingsList> {
  FireStoreServices fsServices = FireStoreServices();

  //function to remove bookings from the list
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
  Widget build(BuildContext context) {

    return StreamBuilder<List<Bookings>>(
      stream: fsServices.getBookings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          print(snapshot.data.toString());
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
      }
    );
  }
}
