//screen to display the form to add booking timings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/screens/bookings_list_screen.dart';
import 'package:reserve_newest1/services/firestore_services.dart';

class EditBookingsScreen extends StatefulWidget {
  //route name for the Add Bookings Screen
  static String routeName = '/edit-bookings';

  @override
  State<EditBookingsScreen> createState() => _EditBookingsScreenState();
}

class _EditBookingsScreenState extends State<EditBookingsScreen> {
  var form = GlobalKey<FormState>();

  String? startofbooking;

  String? endofbooking;

  String? level;

  String? seatnumber;

  DateTime? dateofbooking;

  void saveForm(String? id) {
    bool isValid = form.currentState!.validate();
    print(id);
    if (isValid) {
      if (dateofbooking == null) dateofbooking = DateTime.now();
      print(startofbooking);
      print(endofbooking);
      print(level);
      print(seatnumber);

      //create a new Bookings object and add it the front of myBookings whenever the function is triggered
      FireStoreServices fsServices = FireStoreServices();
      fsServices.editBookings(id, startofbooking, endofbooking, level, seatnumber, dateofbooking);

      //reset the form
      form.currentState!.reset();
      setState(() {
        dateofbooking = null;
      });

      //show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Booking Edited!'),
      ));


    }
  }

  void presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 14)),
    ).then((value) {
      if (value == null) return;
      setState(() {
        dateofbooking = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Bookings selectedBookings = ModalRoute.of(context)?.settings.arguments as Bookings;
    if (dateofbooking == null) dateofbooking = selectedBookings.dateofbooking;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bookings'),
        actions: [IconButton(onPressed: () { saveForm(selectedBookings.id); Navigator.of(context).pushNamed(BookingsListScreen.routeName); }, icon: Icon(Icons.save))],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: form,
            child: Column(
              children: [
                DropdownButtonFormField(
                  value: selectedBookings.startofbooking,
                  decoration: InputDecoration(
                    label: Text('Start of Booking'),
                  ),
                  items: [
                    DropdownMenuItem(child: Text('9.00'), value: '9.00'),
                    DropdownMenuItem(child: Text('9.30'), value: '9.30'),
                    DropdownMenuItem(child: Text('10.00'), value: '10.00'),
                    DropdownMenuItem(child: Text('10.30'), value: '10.30'),
                    DropdownMenuItem(child: Text('11.00'), value: '11.00'),
                    DropdownMenuItem(child: Text('11.30'), value: '11.30'),
                    DropdownMenuItem(child: Text('12.00'), value: '12.00'),
                    DropdownMenuItem(child: Text('12.30'), value: '12.30'),
                    DropdownMenuItem(child: Text('13.00'), value: '13.00'),
                    DropdownMenuItem(child: Text('13.30'), value: '13.30'),
                    DropdownMenuItem(child: Text('14.00'), value: '14.00'),
                    DropdownMenuItem(child: Text('14.30'), value: '14.30'),
                    DropdownMenuItem(child: Text('15.00'), value: '15.00'),
                    DropdownMenuItem(child: Text('15.30'), value: '15.30'),
                    DropdownMenuItem(child: Text('16.00'), value: '16.00'),
                    DropdownMenuItem(child: Text('16.30'), value: '16.30'),
                    DropdownMenuItem(child: Text('17.00'), value: '17.00'),
                    DropdownMenuItem(child: Text('17.30'), value: '17.30'),
                    DropdownMenuItem(child: Text('18.00'), value: '18.00'),
                    DropdownMenuItem(child: Text('18.30'), value: '18.30'),
                    DropdownMenuItem(child: Text('19.00'), value: '19.00'),
                  ],
                  validator: (value) {
                    if (value == null)
                      return "Please provide a time slot";
                    else
                      startofbooking = value as String;
                      return null;
                  },
                  onChanged: (value) {
                    startofbooking = value as String;
                    print(startofbooking);
                  },
                ),
                DropdownButtonFormField(
                  value: selectedBookings.endofbooking,
                  decoration: InputDecoration(
                    label: Text('End of Booking'),
                  ),
                  items: [
                    DropdownMenuItem(child: Text('9.30'), value: '9.30'),
                    DropdownMenuItem(child: Text('10.00'), value: '10.00'),
                    DropdownMenuItem(child: Text('10.30'), value: '10.30'),
                    DropdownMenuItem(child: Text('11.00'), value: '11.00'),
                    DropdownMenuItem(child: Text('11.30'), value: '11.30'),
                    DropdownMenuItem(child: Text('12.00'), value: '12.00'),
                    DropdownMenuItem(child: Text('12.30'), value: '12.30'),
                    DropdownMenuItem(child: Text('13.00'), value: '13.00'),
                    DropdownMenuItem(child: Text('13.30'), value: '13.30'),
                    DropdownMenuItem(child: Text('14.00'), value: '14.00'),
                    DropdownMenuItem(child: Text('14.30'), value: '14.30'),
                    DropdownMenuItem(child: Text('15.00'), value: '15.00'),
                    DropdownMenuItem(child: Text('15.30'), value: '15.30'),
                    DropdownMenuItem(child: Text('16.00'), value: '16.00'),
                    DropdownMenuItem(child: Text('16.30'), value: '16.30'),
                    DropdownMenuItem(child: Text('17.00'), value: '17.00'),
                    DropdownMenuItem(child: Text('17.30'), value: '17.30'),
                    DropdownMenuItem(child: Text('18.00'), value: '18.00'),
                    DropdownMenuItem(child: Text('18.30'), value: '18.30'),
                    DropdownMenuItem(child: Text('19.00'), value: '19.00'),
                    DropdownMenuItem(child: Text('19.30'), value: '19.30'),
                  ],
                  validator: (value) {
                    if (value == null)
                      return "Please provide a time slot";
                    else
                      endofbooking = value as String;
                      return null;
                  },
                  onChanged: (value) {
                    endofbooking = value as String;
                  },
                ),
                DropdownButtonFormField(
                  value: selectedBookings.level,
                  decoration: InputDecoration(
                    label: Text('Level'),
                  ),
                  items: [
                    DropdownMenuItem(
                        child: Text('Level 3'), value: 'Level 3'),
                    DropdownMenuItem(
                        child: Text('Level 4'), value: 'Level 4'),
                    DropdownMenuItem(
                        child: Text('Level 5'), value: 'Level 5'),
                    DropdownMenuItem(
                        child: Text('Level 6'), value: 'Level 6'),
                    DropdownMenuItem(
                        child: Text('Level 7'), value: 'Level 7'),
                    DropdownMenuItem(
                        child: Text('Level 8'), value: 'Level 8'),
                  ],
                  validator: (value) {
                    if (value == null)
                      return "Please provide a level";
                    else
                      level = value as String;
                      return null;
                  },
                  onChanged: (value) {
                    level = value as String;
                  },
                ),
                DropdownButtonFormField(
                  value: selectedBookings.seatnumber,
                  decoration: InputDecoration(
                    label: Text('Seat Number'),
                  ),
                  items: [
                    DropdownMenuItem(child: Text('Seat 1'), value: 'Seat 1'),
                    DropdownMenuItem(child: Text('Seat 2'), value: 'Seat 2'),
                    DropdownMenuItem(child: Text('Seat 3'), value: 'Seat 3'),
                    DropdownMenuItem(child: Text('Seat 4'), value: 'Seat 4'),
                    DropdownMenuItem(child: Text('Seat 5'), value: 'Seat 5'),
                    DropdownMenuItem(child: Text('Seat 6'), value: 'Seat 6'),
                    DropdownMenuItem(child: Text('Seat 7'), value: 'Seat 7'),
                    DropdownMenuItem(child: Text('Seat 8'), value: 'Seat 8'),
                    DropdownMenuItem(child: Text('Seat 9'), value: 'Seat 9'),
                    DropdownMenuItem(
                        child: Text('Seat 10'), value: 'Seat 10'),
                  ],
                  validator: (value) {
                    if (value == null)
                      return "Please provide a seat number";
                    else
                      seatnumber = value as String;
                      return null;
                  },
                  onChanged: (value) {
                    seatnumber = value as String;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dateofbooking == null
                        ? 'Date: '
                        : "Picked date: " +
                        DateFormat('EEEE, dd/MM/yyyy').format(dateofbooking!)),
                    TextButton(
                        child: Text('Choose Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          presentDatePicker(context);
                        })
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
