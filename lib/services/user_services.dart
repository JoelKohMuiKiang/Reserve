import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reserve_newest1/models/user.dart';
import 'package:reserve_newest1/models/user_data.dart';

class UserServices {

  final String uid;
  UserServices({required this.uid });

  //collection reference
  final CollectionReference userData = FirebaseFirestore.instance.collection('user');

  //function to create a new record in the 'user' collection for that user to store their data into
  Future updateUserData(String name, String matrixNumber, int? mobileNumber, String profileImageUrl) async {
    return await userData.doc(uid).set({
      'name': name,
      'matrixNumber': matrixNumber,
      'mobileNumber': mobileNumber,
      'profileImage': profileImageUrl
    });
  }

  //user list from snapshot
  Stream<List<Users>> getUsers() {
    return FirebaseFirestore.instance
        .collection('user')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Users> ((doc) => Users.fromMap(doc.data(), doc.id))
        .toList());
  }

  Stream<Users> getUser() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Users? users;
    return FirebaseFirestore.instance.doc('user/' + uid).snapshots().map((value) {
      users = Users(id: uid, name: value.get('name'), matrixNumber: value.get('matrixNumber'), mobileNumber: value.get('mobileNumber'), profileImageUrl: value.get('profileImage'));
      return users!;
    });
  }

  addUserInfo(name, matrixNumber, mobileNumber) {
    return FirebaseFirestore.instance
        .collection('user').doc(uid)
        .set({'name': name, 'matrixNumber': matrixNumber, 'mobileNumber': mobileNumber});
  }

  //get the data stream
  // Stream <QuerySnapshot> get _user {
  //   return userData.snapshots();
  // }
}