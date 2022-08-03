import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/services/auth_services.dart';

class FireStoreServices {
  AuthService authService = AuthService();

  //create a new booking in the Firebase bookings' collection
  addBookings(startofbooking, endofbooking, level, seatnumber, dateofbooking) {
    return FirebaseFirestore.instance
        .collection('bookings')
        .add({'email': authService.getCurrentUser()!.email, 'startofbooking': startofbooking, 'endofbooking': endofbooking, 'level': level, 'seatnumber': seatnumber, "dateofbooking": dateofbooking});
  }

  //delete the booking having the specified documentId in the bookings' collection
  removeBookings(id) {
    return FirebaseFirestore.instance
        .collection('bookings')
        .doc(id)
        .delete();
  }

  //retrieves the list of bookings in real time
  Stream<List<Bookings>> getBookings() {
    return FirebaseFirestore.instance
        .collection('bookings')
        .where('email', isEqualTo: authService.getCurrentUser()!.email)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Bookings> ((doc) => Bookings.fromMap(doc.data(), doc.id))
        .toList());
  }

  //updates the document having the specific documentId with new values
  editBookings(id, startofbooking, endofbooking, level, seatnumber, dateofbooking) {
    return FirebaseFirestore.instance
        .collection('bookings')
        .doc(id)
        .set({'email': authService.getCurrentUser()!.email, 'startofbooking': startofbooking, 'endofbooking': endofbooking, 'level': level, 'seatnumber': seatnumber, "dateofbooking": dateofbooking});
  }
}