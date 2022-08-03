import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reserve_newest1/main.dart';
import 'package:reserve_newest1/models/user_data.dart';
import 'package:reserve_newest1/services/user_services.dart';

class AddUserInfoScreen extends StatefulWidget {
  static String routeName = '/add-user-info';

  @override
  State<AddUserInfoScreen> createState() => _AddUserInfoScreenState();
}

class _AddUserInfoScreenState extends State<AddUserInfoScreen> {
  var form = GlobalKey<FormState>();
  String? name;
  String? matrixNumber;
  int? mobileNumber;

  register() {
    bool isValid = form.currentState!.validate();
    print("hi");
    if (isValid) {
      form.currentState!.save();

      UserServices userServices = UserServices(uid: FirebaseAuth.instance.currentUser!.uid);
      userServices.addUserInfo(name, matrixNumber, mobileNumber);
      // String uid = FirebaseAuth.instance.currentUser!.uid;
      // FirebaseFirestore.instance.doc("user").set({"name": name, "matrixNumber": matrixNumber, "mobileNumber": mobileNumber});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Name?')),
                validator: (value) {
                  if(value == null)
                    return "Please provide your full name.";
                  else
                    return null;
                },
                onSaved: (value) {
                  name = value as String;
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Matrix Number?')),
                validator: (value) {
                  if(value == null)
                    return "Please provide your matrix number.";
                  else
                    return null;
                },
                onSaved: (value) {
                  matrixNumber = value as String;
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Mobile number?')),
                validator: (value) {
                  if(value == null)
                    return "Please provide your matrix number.";
                  else
                    return null;
                },
                onSaved: (value) {
                  mobileNumber = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () { register(); Navigator.of(context).pushNamed(MainScreen.routeName); }, child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
