import 'package:app/models/MessageModel.dart';
import 'package:app/navkeys.dart';
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
  final chatRoomID = 'tz4GNB7G9uEeOf8aX4L4';

  TextEditingController messageController = TextEditingController();
  void sendMessage() async {
    String msg = messageController.text.trim();
    messageController.clear();
    if (msg != "") {
      MessageModel newMessage = MessageModel(
        sender: userID,
        text: msg,
        createdon: DateTime.now(),
      ); // Send Message
      FirebaseFirestore.instance
          .collection("chatroom")
          .doc(chatRoomID)
          .collection("messages")
          .doc(const Uuid().v1())
          .set(newMessage.toMap());
    }
  }

  // Center AvatarModule() {
  //   String path = 'assets/images/Aqua/0.jpg';
  //   return Center(
  //     child: Column(children: [
  //       StreamBuilder(
  //           stream:
  //               FirebaseFirestore.instance.collection("chatroom").snapshots(),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.active) {
  //               if (snapshot.hasData) {
  //                 QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
  //                 Map<String, dynamic> a =
  //                     dataSnapshot.docs[0].data() as Map<String, dynamic>;
  //                 if (a['Eyes'] == 'aqua' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua/0.jpg';
  //                 } else if (a['Eyes'] == 'black' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua Black/0.jpg';
  //                 } else if (a['Eyes'] == 'blue' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua Blue/0.jpg';
  //                 } else if (a['Eyes'] == 'brown' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua Brown/0.jpg';
  //                 } else if (a['Eyes'] == 'green' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua Green/0.jpg';
  //                 } else if (a['Eyes'] == 'orange' && a['Hair'] == 'aqua') {
  //                   path = 'assets/images/Aqua Orange/0.jpg';
  //                 }
  //                 print("sdsds $a");
  //                 return Column(
  //                   children: [
  //                     Container(
  //                       width: 120,
  //                       height: 120,
  //                       decoration: BoxDecoration(
  //                         image: DecorationImage(
  //                             image: AssetImage(path), fit: BoxFit.fill),
  //                         color: Colors.white,
  //                         shape: BoxShape.circle,
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 40,
  //                       width: double.infinity,
  //                       margin: const EdgeInsets.symmetric(vertical: 20),
  //                       padding: const EdgeInsets.symmetric(horizontal: 80),
  //                       child: ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                             backgroundColor: const Color(0xff1E1E1E)),
  //                         onPressed: () {},
  //                         child: Text(
  //                           'Save',
  //                           style: GoogleFonts.alegreyaSans(
  //                               fontWeight: FontWeight.w900,
  //                               letterSpacing: 3,
  //                               color: Colors.white,
  //                               fontSize: 20),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 );
  //               } else {
  //                 return const CircularProgressIndicator();
  //               }
  //             } else {
  //               return const CircularProgressIndicator();
  //             }
  //           }),
  //     ]),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigation.mainNavigation.currentState!.pop(),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const Iconify(
                MaterialSymbols.arrow_back_ios_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
          backgroundColor: const Color(0xff181818),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Iconify(
                Ci.menu_alt_02,
                color: Colors.white,
                size: 44,
              ),
            )
          ]),
      body: Container(
        width: double.infinity,
        height: 600,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 500,
              color: Color.fromARGB(252, 17, 17, 17),
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
                                                        "assets/images/c4.png"),
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
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
                                            : const Color.fromARGB(
                                                255, 42, 145, 241),
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
              color: const Color.fromARGB(255, 14, 13, 13),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
