import 'package:app/data/data.dart';
import 'package:app/navkeys.dart';
import 'package:app/pages/Home/Modules/CreateAvatar/GenerateAvatar.dart';
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
  TextEditingController _inputController = TextEditingController();
  final inputPattern = RegExp(r'^[a-zA-Z ]+$');
  bool error = false;
  int? indexHair;
  int? indexEyes;
  @override
  Widget build(BuildContext context) {
    void _validateInput() {
      var text = _inputController.text;
      if (text.isEmpty) {
        setState(() {
          error = true;
        });
      } else if (inputPattern.hasMatch(text)) {
        List check = text.split(" ");

        check.asMap().forEach((index, value) {
          if (value.toString().toLowerCase() == 'hair') {
            indexHair = index > 0 ? index - 1 : index + 1;
          } else if (value.toString().toLowerCase() == 'eyes' ||
              value.toString().toLowerCase() == 'eye') {
            indexEyes = index > 0 ? index - 1 : index + 1;
          }
        });
        if (HairLabels.contains(
                "${check[indexHair!].toString().toLowerCase()} hair") &&
            EyesLabels.contains(
                "${check[indexEyes!].toString().toLowerCase()} eyes")) {
          setState(() {
            error = false;
          });
          String hair = "${check[indexHair!].toString().toLowerCase()}";
          String eye = "${check[indexEyes!].toString().toLowerCase()}";
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                GeneratedAvatar(hairLabel: hair, eyeLabel: eye),
          ));
        } else {
          setState(() {
            error = true;
          });
        }
        // More Validation
        // if ok navigate to NExt page with extracted labels
      } else {
        setState(() {
          error = true;
        });
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
            MainHeading(
              first: "CREATE",
              second: "ANIME",
              size: 31,
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
                        suggestionsBoxDecoration:
                            const SuggestionsBoxDecoration(
                                color: Color(0xff201E1E),
                                constraints: BoxConstraints.expand(
                                    height: 200, width: 300),
                                elevation: 0,
                                hasScrollbar: true),
                        suggestionsCallback: (pattern) {
                          List<String> matches = <String>[];
                          matches.addAll(suggestons);

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
                },
                child: Text(
                  "Generate",
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
