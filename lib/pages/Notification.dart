import 'package:app/models/NotificationModel.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/PreferedSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPreferredSize(),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notifications')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
                  return Container(
                    height: 470,
                    child: ListView.builder(
                      itemCount: dataSnapshot.docChanges.length,
                      itemBuilder: (context, index) {
                        NotificationModel noti = NotificationModel.fromMap(
                            dataSnapshot.docs[index].data()
                                as Map<String, dynamic>);
                        return ListTile(
                          onTap: () async {},
                          leading: Icon(
                            Icons.notifications_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            noti.text!,
                            style: GoogleFonts.alegreyaSans(
                                color: const Color.fromARGB(255, 211, 208, 208),
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            noti.feedback as String,
                            style: GoogleFonts.alegreyaSans(
                                color: const Color(0xFF5A5A5A), fontSize: 16),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text(
                    "No record found.",
                    style: TextStyle(color: Colors.white),
                  );
                }
              } else {
                return const Text(
                  "An error occured.",
                );
              }
            }),
      ),
    );
  }
}
