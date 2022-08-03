import 'package:cloud_firestore/cloud_firestore.dart';

class Bookings {
  String? email;
  String? id;
  String? startofbooking;
  String? endofbooking;
  String? level;
  String? seatnumber;
  DateTime? dateofbooking;
  Bookings({required this.email, required this.id, required this.startofbooking, required this.endofbooking, required this.level, required this.seatnumber,
    required this.dateofbooking});

  Bookings.fromMap(Map <String, dynamic> snapshot, String id) :
      id = id,
      email = snapshot['email'] ?? '',
      startofbooking = snapshot['startofbooking'] ?? '',
      endofbooking = snapshot['endofbooking'] ?? '',
      level = snapshot['level'] ?? '',
      seatnumber = snapshot['seatnumber'] ?? '',
      dateofbooking = (snapshot['travelDate'] ?? Timestamp.now() as Timestamp).toDate();
}