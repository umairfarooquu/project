// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exd_flutter_project/views/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationServices {
  static signUp(
      {required BuildContext context,
      required email,
      required password,
      required phone,
      required name}) async {
    print("function running");
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final fireStore = FirebaseFirestore.instance;

    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                fireStore
                    .collection("UserData")
                    .doc(firebaseAuth.currentUser!.uid)
                    .set({
                  "uid": value.user!.uid,
                  "email": value.user!.email,
                  "Name": name,
                  "phoneNumber": phone,
                  "status": "pending",
                })
              });
      // saveUserData();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        print("Some fild miss please double check");
      } else if (e.code == "invalid-email") {
        print("Your email format is not correct please try again");
      } else if (e.code == "weak-password") {
        print("Password should be greater then 6 digit");
      } else if (e.code == "email-already-in-use") {
        print("Your email already exist please try another email");
      }
      print("Firebase e $e");
    } catch (e) {
      print("e $e");
    }
  }

  static login({required context, required email, required password}) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      print("Function login Running");
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));

      print("Login Success!");
    } on FirebaseAuthException catch (e) {
      print("Firebae Auth $e");
      if (e.code == "wrong-password") {
      } else if (e.code == "user-not-found") {}
    } catch (e) {
      print(e);
    }
  }

  // static saveUserData() {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   firestore.collection("users").doc().set({
  //     'name': name,
  //     'email': email,
  //     'phone': phone,

  //   });
  // }

  static logout() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
  }
}
