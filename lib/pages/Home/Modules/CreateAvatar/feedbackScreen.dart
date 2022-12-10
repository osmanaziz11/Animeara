import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarFeedBack extends StatefulWidget {
  const AvatarFeedBack({super.key});

  @override
  State<AvatarFeedBack> createState() => _AvatarFeedBackState();
}

class _AvatarFeedBackState extends State<AvatarFeedBack> {
  List<String> suggestons = [
    "Poor Quality",
    "Poor Quality",
    "Poor Quality",
    "Poor Quality",
    "Poor Quality",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Column(
          children: [
            MainHeading(first: "YOUR", second: "FEEDBACK"),
            SizedBox(
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
                      color: Color.fromARGB(255, 85, 85, 85).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes position of shadow
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
                        getImmediateSuggestions: true,
                        animationStart: 0,
                        animationDuration: Duration.zero,
                        textFieldConfiguration: TextFieldConfiguration(
                          // controller: _inputController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintStyle: TextStyle(
                              color: Color(0xFFBEC2C2),
                            ),
                            hintText: "Enter feedback here",
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
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            color: const Color(0xff201E1E),
                            constraints:
                                BoxConstraints.expand(height: 200, width: 300),
                            elevation: 0,
                            hasScrollbar: true),
                        suggestionsCallback: (pattern) {
                          List<String> matches = <String>[];
                          matches.addAll(suggestons);

                          matches.retainWhere((s) {
                            return s
                                .toLowerCase()
                                .contains(pattern.toLowerCase());
                          });
                          return matches;
                        },
                        itemBuilder: (context, sone) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              sone.toString(),
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.white, fontSize: 13),
                            ),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          setState(() {
                            // _inputController.text = suggestion;
                          });
                          // print(_inputController.text);
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
                onPressed: () {},
                child: Text(
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
        ));
  }
}
