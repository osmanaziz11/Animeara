import 'package:app/data/data.dart';
import 'package:app/models/NotificationModel.dart';
import 'package:app/navkeys.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/CircularLoader.dart';
import 'package:app/widgets/Heading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarFeedBack extends StatefulWidget {
  String? text;
  AvatarFeedBack({super.key, this.text});

  @override
  State<AvatarFeedBack> createState() => _AvatarFeedBackState();
}

class _AvatarFeedBackState extends State<AvatarFeedBack> {
  TextEditingController _inputController = TextEditingController();
  final inputPattern = RegExp(r'^[a-zA-Z ]+$');
  bool error = false;
  bool isSendLoader = false;
  void sendFeedBack() async {
    NotificationModel noti = NotificationModel(
        text: widget.text,
        feedback: _inputController.text,
        createdon: DateTime.now());
    await FirebaseFirestore.instance
        .collection("notifications")
        .doc()
        .set(noti.toMap());

    setState(() {
      isSendLoader = false;
      Navigation.mainNavigation.currentState!.pushNamed('/');
    });
  }

  void _validateInput() {
    var text = _inputController.text;
    if (text.isEmpty) {
      setState(() {
        error = true;
      });
    } else if (inputPattern.hasMatch(text)) {
      sendFeedBack();
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainHeading(
                  first: "YOUR",
                  second: "FEEDBACK",
                  size: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 320,
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff201E1E),
                      boxShadow: [
                        BoxShadow(
                          color: error
                              ? Colors.red
                              : const Color.fromARGB(255, 85, 85, 85)
                                  .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      child: Column(children: [
                        Container(
                          color: Colors.transparent,
                          child: TypeAheadField(
                            keepSuggestionsOnLoading: false,
                            animationStart: 0,
                            animationDuration: Duration.zero,
                            textFieldConfiguration: TextFieldConfiguration(
                              enableSuggestions: true,
                              enableInteractiveSelection: true,
                              controller: _inputController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                hintStyle: TextStyle(
                                  color: Color(0xFFBEC2C2),
                                ),
                                hintText: "Enter avatar description",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFBEC2C2)),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFBEC2C2)),
                                ),
                              ),
                            ),
                            suggestionsBoxDecoration:
                                const SuggestionsBoxDecoration(
                                    color: Color(0xff201E1E),
                                    constraints: BoxConstraints.expand(
                                        height: 200, width: 300),
                                    elevation: 0,
                                    hasScrollbar: true),
                            suggestionsCallback: (pattern) {
                              List<String> matches = <String>[];
                              matches.addAll(feedback);

                              return matches;
                            },
                            itemBuilder: (context, sone) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  sone.toString(),
                                  style: GoogleFonts.alegreyaSans(
                                      color: Colors.white, fontSize: 13),
                                ),
                              );
                            },
                            onSuggestionSelected: (sug) {
                              setState(() {
                                _inputController.text = sug;
                              });
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1E1E1E)),
                    onPressed: () {
                      if (!error) {
                        setState(() {
                          isSendLoader = true;
                          _validateInput();
                        });
                      }
                    },
                    child: isSendLoader
                        ? CircularLoader()
                        : Text(
                            'Send',
                            style: GoogleFonts.alegreyaSans(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
