import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_companion/screens/home_page.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  File? imageFile;
  String? imageurl;
  String? currentPic;
  CollectionReference users = FirebaseFirestore.instance.collection('profile');
  Map<String, dynamic> data = {
    'name': 'John Doe',
    'profile': 'New York',
  };

// function for add image from storage
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(pickedFile!.path);

    var ref = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}');
    await ref.putFile(imageFile!);
    imageurl = await ref.getDownloadURL();
    addimage();
    // getProfilePic();

    notifyListeners();
  }

  // finction for adding image from camera
  Future<void> getCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    imageFile = File(pickedFile!.path);
    var ref = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}');
    await ref.putFile(imageFile!);
    imageurl = await ref.getDownloadURL();
    addimage();

    notifyListeners();
  }

// function to add profile pic to server
  Future<void> addimage() async {
    try {
      await users.doc('image').set({'profile': imageurl});
      print('image added');
    } catch (e) {
      print('the error is : $e');
    }

    // return users
    //     .add({'profile': 'image url'}).then((value) => print('image added')).catchError(e);
  }

// function to get profile pic from server

  getProfilePic() async {
    try {
      DocumentSnapshot imagesDocument = await FirebaseFirestore.instance
          .collection('profile')
          .doc('image')
          .get();

      if (imagesDocument.exists) {
        var data = imagesDocument.data()
            as Map<String, dynamic>?; // Explicitly cast to Map<String, dynamic>
        if (data != null && data.containsKey('profile')) {
          var profilePic = data['profile'];
          currentPic = profilePic;
          notifyListeners();
          return profilePic.toString(); // Assuming profile is a String
        } else {
          return null; // Document does not exist
        }
      }
    } catch (e) {
      print('Error getting profile picture: $e');
      return null;
    }
  }

  CreateUser(String email, String password, BuildContext context) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    CollectionReference collectionRef = firestore.collection(email);
    DocumentReference docRef = collectionRef.doc('profile');
    await docRef.set(data);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }
}
