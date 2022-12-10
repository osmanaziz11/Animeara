import 'package:app/navkeys.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({super.key});

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {
  List<String> suggestons = [
    "Aqua Hair with Blue Eyes",
    "Blonde Hair with Black Eyes",
    "Black Hair with Red Eyes",
    "Yellow Hair with Green Eyes",
    "Aqua Hair with Blue Eyes",
    "Blonde Hair with Black Eyes",
    "Black Hair with Red Eyes",
    "Yellow Hair with Green Eyes",
  ];
  // var _inputController = TextEditingController(text: );
  @override
  Widget build(BuildContext context) {
    TextEditingController _inputController = TextEditingController();
    bool error = false;
    void _validateInput() {
      var text = _inputController.text;
      if (text.isEmpty) {
        print("_inputController.text");
        setState(() {
          error = true;
        });
      } else {
        // More Validation
        // if ok navigate to NExt page with extracted labels
      }
    }

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
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            MainHeading(first: "CREATE", second: "ANIME"),
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
                          ? Colors.red.withOpacity(0.5)
                          : Color.fromARGB(255, 85, 85, 85).withOpacity(0.5),
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
                          controller: _inputController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                            _inputController.text = suggestion;
                          });
                          print(_inputController.text);
                        },
                      ),
                    )
                  ]),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color(0xff1E1E1E)),
                onPressed: () {
                  _validateInput();
                  Navigation.mainNavigation.currentState!
                      .pushNamed('/generateAvatar');
                },
                child: Text(
                  'Generate',
                  style: GoogleFonts.alegreyaSans(
                      // fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
