import 'package:app/models/MessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class GenerateAvatar extends StatefulWidget {
  @override
  _GenerateAvatarState createState() => _GenerateAvatarState();
}

class _GenerateAvatarState extends State<GenerateAvatar> {
  final userID = 'TvN5lR772ljCIo9mwlTp';
  final chatRoomID = 'cg1tNqlapfbEf1ZrewH6';

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
          .doc(Uuid().v1())
          .set(newMessage.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 520,
            color: Colors.transparent,
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
                      int a = dataSnapshot.docs.length;
                      print("aaaaaaaa $a");
                      return ListView.builder(
                        reverse: true,
                        itemCount: dataSnapshot.docs.length,
                        itemBuilder: (context, index) {
                          MessageModel currentMessage = MessageModel.fromMap(
                              dataSnapshot.docs[index].data()
                                  as Map<String, dynamic>);
                          print(currentMessage.sender);
                          return Row(
                            mainAxisAlignment: (currentMessage.sender == userID)
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (currentMessage.sender == userID)
                                        ? Colors.grey
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    currentMessage.text.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            "An error occured! Please check your internet connection."),
                      );
                    } else {
                      return Center(
                        child: Text("Say hi to your new friend"),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Container(
            color: Color.fromARGB(255, 34, 33, 33),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: messageController,
                    maxLines: null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//          
