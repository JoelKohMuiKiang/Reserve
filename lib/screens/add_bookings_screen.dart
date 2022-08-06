//screen to display the form to add booking timings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/screens/bookings_list_screen.dart';
import 'package:reserve_newest1/services/firestore_services.dart';

class AddBookingsScreen extends StatefulWidget {
    //route name for the Add Bookings Screen
  static String routeName = '/add-bookings';

  // final DateTime selectedDate;
  // const AddBookingsScreen({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<AddBookingsScreen> createState() => _AddBookingsScreenState();
}

class _AddBookingsScreenState extends State<AddBookingsScreen> {
  var form = GlobalKey<FormState>();

  String? startofbooking;

  String? endofbooking;

  String? level;

  String? seatnumber;

  DateTime? dateofbooking;

  DateTime? selectedDay = DateTime.now();

  void saveForm() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      print(startofbooking);
      print(endofbooking);
      print(level);
      print(seatnumber);

      //create a new Bookings object and add it the front of myBookings whenever the function is triggered
      FireStoreServices fsServices = FireStoreServices();
      fsServices.addBookings(startofbooking, endofbooking, level, seatnumber, dateofbooking);

      //reset the form
      form.currentState!.reset();
      setState(() {
        dateofbooking = null;
      });
      Navigator.of(context).pushNamed(BookingsListScreen.routeName);

      //show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Booking Successful!'),
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

  String getDate() {
    if (dateofbooking == null){
      dateofbooking = selectedDay;
      return 'Picked Date: ' + DateFormat('EEEE, dd/MM/yyyy').format(selectedDay!);
    }
      return "Picked date: " + DateFormat('EEEE, dd/MM/yyyy').format(dateofbooking!);
  }

  @override
  Widget build(BuildContext context) {
    selectedDay = ModalRoute.of(context)!.settings.arguments as DateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bookings'),
        actions: [IconButton(onPressed: () { saveForm(); }, icon: Icon(Icons.save))],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: form,
            child: Column(
              children: [
                DropdownButtonFormField(
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
                      return null;
                  },
                  onChanged: (value) {
                    startofbooking = value as String;
                  },
                ),
                DropdownButtonFormField(
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
                      return null;
                  },
                  onChanged: (value) {
                    endofbooking = value as String;
                  },
                ),
                DropdownButtonFormField(
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
                      return null;
                  },
                  onChanged: (value) {
                    level = value as String;
                  },
                ),
                DropdownButtonFormField(
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
                      return null;
                  },
                  onChanged: (value) {
                    seatnumber = value as String;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(getDate()),
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
