import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exd_flutter_project/views/HomeScreen.dart';
import 'package:exd_flutter_project/views/rejectedUser.dart';
import 'package:flutter/material.dart';
import 'package:exd_flutter_project/consts/consts.dart';
import 'package:get/get.dart';

class acceptedUser extends StatefulWidget {
  const acceptedUser({super.key});

  @override
  State<acceptedUser> createState() => _acceptedUserState();
}

class _acceptedUserState extends State<acceptedUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () => Get.to(() => const HomeScreen()),
              child: "Home".text.make()),
          ElevatedButton(
              onPressed: () => Get.to(() => const rejectedUser()),
              child: "Rejected User".text.make())
        ],
      ),
      backgroundColor: whiteColor,
      appBar: AppBar(title: "Accepted User".text.make()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('UserData').snapshots(),
              // initialData: initialData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.data!.docs[index]["status"] == "approve") {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]['Name']),
                          subtitle:
                              Text(snapshot.data!.docs[index]['phoneNumber']),
                          trailing: SizedBox(
                              width: 170,
                              child: Row(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: "Accepted"
                                          .text
                                          .green900
                                          .fontFamily(bold)
                                          .make()),
                                ],
                              )),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return const Text("data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
