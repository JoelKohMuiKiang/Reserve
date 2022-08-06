import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:reserve_newest1/main.dart';
import 'package:reserve_newest1/models/user_data.dart';
import 'package:reserve_newest1/services/firestore_services.dart';
import 'package:reserve_newest1/services/user_services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddUserInfoScreen extends StatefulWidget {
  static String routeName = '/add-user-info';

  @override
  State<AddUserInfoScreen> createState() => _AddUserInfoScreenState();
}

class _AddUserInfoScreenState extends State<AddUserInfoScreen> {
  UserServices userServices = UserServices(uid: 'uid');

  var form = GlobalKey<FormState>();
  String? name;
  String? matrixNumber;
  int? mobileNumber;
  File? profilePicture;

  register(context) {
    if(profilePicture == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('Please include a food image!'),));
      return;
    }

    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(name);
      print(matrixNumber);
      print(mobileNumber);
      UserServices userServices = UserServices(uid: FirebaseAuth.instance.currentUser!.uid);
      userServices.addUserInfo(name, matrixNumber, mobileNumber);
      // String uid = FirebaseAuth.instance.currentUser!.uid;
      // FirebaseFirestore.instance.doc("user").set({"name": name, "matrixNumber": matrixNumber, "mobileNumber": mobileNumber});

      FirebaseStorage.instance.ref().child(DateTime.now().toString()+'_'+ basename(
          profilePicture!.path)).
      putFile(profilePicture!).then((task) {
        task.ref.getDownloadURL().then((imageUrl) {
          userServices.updateUserData(name!, matrixNumber!, mobileNumber, imageUrl);
        });
      });
      Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);

    }
  }

  Future<void> pickImage(mode) async {
    ImageSource chosenSource = mode == 0 ? ImageSource.camera :
    ImageSource.gallery;
    return ImagePicker()
        .pickImage(source: chosenSource, maxWidth: 600, imageQuality: 50,
        maxHeight: 150)
        .then((imageFile) {
      if (imageFile != null) {
        setState(() {
          profilePicture = File(imageFile.path);
        });
      }
    });
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
                  if(value == null || value == "") {
                    return "Please provide your full name.";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  name = value as String;
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Matrix Number?')),
                validator: (value) {
                  if(value == null || value == "") {
                    return "Please provide your matrix number.";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  matrixNumber = value as String;
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Mobile number?')),
                validator: (value) {
                  if(value == null) {
                    return "Please provide your mobile number.";
                  } else if (int.tryParse(value) == null){
                    return "Please provide your mobile number.";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  mobileNumber = int.parse(value!);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: profilePicture != null ? FittedBox(fit: BoxFit.fill,
                          child: Image.file(profilePicture!)) : Center()
                  ),
                  Column(
                    children: [
                      TextButton.icon(icon: Icon(Icons.camera_alt),onPressed:
                          () => pickImage(0), label: Text('Take Photo')),
                      TextButton.icon(icon: Icon(Icons.image),onPressed: () =>
                          pickImage(1), label: Text('Add Image')),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () { register(context); }, child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
