import 'package:app/models/MessageModel.dart';
import 'package:app/navkeys.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/Heading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class chatWithAnimera extends StatefulWidget {
  @override
  _chatWithAnimeraState createState() => _chatWithAnimeraState();
}

class _chatWithAnimeraState extends State<chatWithAnimera> {
  bool LoadingAvatar = false;

  final userID = 'TvN5lR772ljCIo9mwlTp';
  final chatRoomID = 'Yyzdzs3DdlvLoRwd79rI';

  TextEditingController messageController = TextEditingController();
  void sendMessage() async {
    String msg = messageController.text.trim();
    messageController.clear();
    if (msg != "") {
      MessageModel newMessage =
          MessageModel(sender: userID, text: msg); // Send Message
      FirebaseFirestore.instance
          .collection("chatroom")
          .doc(chatRoomID)
          .collection("messages")
          .doc(const Uuid().v1())
          .set(newMessage.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: double.infinity,
        height: 600,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            MainHeading(
              first: "ASK",
              second: "HELP",
              size: 31,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 430,
              decoration: BoxDecoration(),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chatroom")
                      .doc(chatRoomID)
                      .collection("messages")
                      .orderBy("createdon", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot dataSnapshot =
                            snapshot.data as QuerySnapshot;

                        return ListView.builder(
                          reverse: true,
                          itemCount: dataSnapshot.docs.length,
                          itemBuilder: (context, index) {
                            MessageModel currentMessage = MessageModel.fromMap(
                                dataSnapshot.docs[index].data()
                                    as Map<String, dynamic>);
                            if (currentMessage.text == '123' &&
                                currentMessage.sender != userID) {
                              return Text("Nothig..");
                            } else {
                              return Row(
                                mainAxisAlignment:
                                    (currentMessage.sender == userID)
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                children: [
                                  (currentMessage.sender != userID)
                                      ? Column(
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/avatar2.png"),
                                                    fit: BoxFit.fill),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            )
                                          ],
                                        )
                                      : const SizedBox(
                                          width: 1,
                                        ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: (currentMessage.sender == userID)
                                            ? const Color.fromARGB(
                                                255, 253, 33, 33)
                                            : Color.fromARGB(255, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        currentMessage.text.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  (currentMessage.sender == userID)
                                      ? Column(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/avatar1.png"),
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(
                                          width: 1,
                                        ),
                                ],
                              );
                            }
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                              "An error occured! Please check your internet connection."),
                        );
                      } else {
                        return const Center(
                          child: Text("Say Hi to Animera"),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(83, 12, 11, 11),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: messageController,
                      maxLines: null,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Color.fromARGB(176, 250, 250, 250)),
                          hintText: "Ask Animera to create avatar."),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

//
