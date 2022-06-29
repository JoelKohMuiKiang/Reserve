import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reserve/models/bookings.dart';
import 'package:reserve/screens/my_booking_page.dart';

import '../booking_database.dart';

class BookingPage extends StatefulWidget {
  static String routeName = '/booking';

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var form = GlobalKey<FormState>();

  String? startofbooking;

  String? endofbooking;

  String? level;

  String? seatnumber;

  DateTime? dateofbooking;

  List <Bookings> bookingsData = BookingsData.bookingsData;

  void saveForm () {
    bool isValid = form.currentState!.validate();

    if (isValid) {
      form.currentState!.save();
      if (dateofbooking == null) dateofbooking = DateTime.now();

      print(startofbooking);
      print(endofbooking);
      print(level);
      print(seatnumber);
      print(dateofbooking);

      bookingsData.add(Bookings(startofbooking: startofbooking, endofbooking: endofbooking, level: level, seatnumber: seatnumber, dateofbooking: dateofbooking));
      FocusScope.of(context).unfocus();
      form.currentState!.reset();
      dateofbooking = null;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking Successful!',
      style: TextStyle(fontFamily: 'ITCKRIST'),),));
    }
  }

  void presentDatePicker (BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days:14)),
    ).then((value) {
      if (value == null) return;
      setState(() {
        dateofbooking = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking of Seats',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form
        (
          key: form,
          child: SingleChildScrollView(
            child: Column(children: [
            Row
            (children: [
              Align(
              alignment: Alignment.topLeft,
              child: TextButton
              (child: Text("Date: ",
                style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2),
              ),
                onPressed: () {presentDatePicker(context);},
              )
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(dateofbooking == null ? 'No Date Chosen': DateFormat('dd/MM/yyyy').format(dateofbooking!),
                  style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2),
                ),
            ),
            ]
          ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Start of Booking',
                style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2, decoration: TextDecoration.underline),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                label: Text('Start of Booking')
              ),
              items: [
                DropdownMenuItem(child: Text('9.00'), value:'9.00'),
                DropdownMenuItem(child: Text('9.30'), value:'9.30'),
                DropdownMenuItem(child: Text('10.00'), value:'10.00'),
                DropdownMenuItem(child: Text('10.30'), value:'10.30'),
                DropdownMenuItem(child: Text('11.00'), value:'11.00'),
                DropdownMenuItem(child: Text('11.30'), value:'11.30'),
                DropdownMenuItem(child: Text('12.00'), value:'12.00'),
                DropdownMenuItem(child: Text('12.30'), value:'12.30'),
                DropdownMenuItem(child: Text('13.00'), value:'13.00'),
                DropdownMenuItem(child: Text('13.30'), value:'13.30'),
                DropdownMenuItem(child: Text('14.00'), value:'14.00'),
                DropdownMenuItem(child: Text('14.30'), value:'14.30'),
                DropdownMenuItem(child: Text('15.00'), value:'15.00'),
                DropdownMenuItem(child: Text('15.30'), value:'15.30'),
                DropdownMenuItem(child: Text('16.00'), value:'16.00'),
                DropdownMenuItem(child: Text('16.30'), value:'16.30'),
                DropdownMenuItem(child: Text('17.00'), value:'17.00'),
                DropdownMenuItem(child: Text('17.30'), value:'17.30'),
                DropdownMenuItem(child: Text('18.00'), value:'18.00'),
                DropdownMenuItem(child: Text('18.30'), value:'18.30'),
                DropdownMenuItem(child: Text('19.00'), value:'19.00'),
              ],
              validator: (value) {
                if (value == null)
                  return "Please provide a time slot";
                else
                  return null;
              },
              onChanged: (value) {startofbooking = value as String;},
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'End of Booking',
                style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2, decoration: TextDecoration.underline),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  label: Text('End of Booking')
              ),
              items: [
                DropdownMenuItem(child: Text('9.30'), value:'9.30'),
                DropdownMenuItem(child: Text('10.00'), value:'10.00'),
                DropdownMenuItem(child: Text('10.30'), value:'10.30'),
                DropdownMenuItem(child: Text('11.00'), value:'11.00'),
                DropdownMenuItem(child: Text('11.30'), value:'11.30'),
                DropdownMenuItem(child: Text('12.00'), value:'12.00'),
                DropdownMenuItem(child: Text('12.30'), value:'12.30'),
                DropdownMenuItem(child: Text('13.00'), value:'13.00'),
                DropdownMenuItem(child: Text('13.30'), value:'13.30'),
                DropdownMenuItem(child: Text('14.00'), value:'14.00'),
                DropdownMenuItem(child: Text('14.30'), value:'14.30'),
                DropdownMenuItem(child: Text('15.00'), value:'15.00'),
                DropdownMenuItem(child: Text('15.30'), value:'15.30'),
                DropdownMenuItem(child: Text('16.00'), value:'16.00'),
                DropdownMenuItem(child: Text('16.30'), value:'16.30'),
                DropdownMenuItem(child: Text('17.00'), value:'17.00'),
                DropdownMenuItem(child: Text('17.30'), value:'17.30'),
                DropdownMenuItem(child: Text('18.00'), value:'18.00'),
                DropdownMenuItem(child: Text('18.30'), value:'18.30'),
                DropdownMenuItem(child: Text('19.00'), value:'19.00'),
                DropdownMenuItem(child: Text('19.30'), value:'19.30'),
              ],
              validator: (value) {
                if (value == null)
                  return "Please provide a time slot";
                else
                  return null;
              },
              onChanged: (value) {endofbooking = value as String;},
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Level',
                style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2, decoration: TextDecoration.underline),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  label: Text('Level')
              ),
              items: [
                DropdownMenuItem(child: Text('Level 3'), value:'Level 3'),
                DropdownMenuItem(child: Text('Level 4'), value:'Level 4'),
                DropdownMenuItem(child: Text('Level 5'), value:'Level 5'),
                DropdownMenuItem(child: Text('Level 6'), value:'Level 6'),
                DropdownMenuItem(child: Text('Level 7'), value:'Level 7'),
                DropdownMenuItem(child: Text('Level 8'), value:'Level 8'),
              ],
              validator: (value) {
                if (value == null)
                  return "Please provide a level";
                else
                  return null;
              },
              onChanged: (value) {level = value as String;},
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Seat Number',
                style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 20, height: 2, decoration: TextDecoration.underline),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  label: Text('Seat Number')
              ),
              items: [
                DropdownMenuItem(child: Text('Seat 1'), value:'Seat 1'),
                DropdownMenuItem(child: Text('Seat 2'), value:'Seat 2'),
                DropdownMenuItem(child: Text('Seat 3'), value:'Seat 3'),
                DropdownMenuItem(child: Text('Seat 4'), value:'Seat 4'),
                DropdownMenuItem(child: Text('Seat 5'), value:'Seat 5'),
                DropdownMenuItem(child: Text('Seat 6'), value:'Seat 6'),
                DropdownMenuItem(child: Text('Seat 7'), value:'Seat 7'),
                DropdownMenuItem(child: Text('Seat 8'), value:'Seat 8'),
                DropdownMenuItem(child: Text('Seat 9'), value:'Seat 9'),
                DropdownMenuItem(child: Text('Seat 10'), value:'Seat 10'),
              ],
              validator: (value) {
                if (value == null)
                  return "Please provide a seat number";
                else
                  return null;
              },
              onChanged: (value) {seatnumber = value as String;},
            ),
              Opacity(opacity: 0,
                  child: Divider(
                    height: 40
                  )),
              OutlinedButton(
                  child: Text(
                    'Book',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.black,
                      ))),
                  onPressed: () {
                    saveForm();
                  },
              )
        ]),
          ),
        )
      ),
    );
  }
}
