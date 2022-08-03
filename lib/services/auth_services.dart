import 'package:firebase_auth/firebase_auth.dart';
import 'package:reserve_newest1/models/user.dart';
import 'package:reserve_newest1/services/user_services.dart';

class AuthService{
  //Creating a new account using the new user's email and password
  // Future<UserCredential> register(email, password) {
  //   return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  // }

  UserData? _userFromFirebaseUser(User user) {
    return user!=null ? UserData(uid: user.uid) : null;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await UserServices(uid: user!.uid).updateUserData('name', 'matrixNumber', 90604154);

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //Signs in using an email and password
  Future<UserCredential> login(email, password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  //Returns the currently signed-in user
  Stream<User?> getAuthUser() {
    return FirebaseAuth.instance.authStateChanges();
  }

  //logout the user
  logout() {
    return FirebaseAuth.instance.signOut();
  }

  //function to get the current user without listening to the update
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}