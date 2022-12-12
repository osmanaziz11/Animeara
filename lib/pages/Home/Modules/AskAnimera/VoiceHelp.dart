// ignore: unused_import
import 'dart:typed_data';
// ignore: unused_import
import 'dart:ui' as ui;
import 'dart:convert';

import 'package:alan_voice/alan_voice.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/Heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class VoiceHelp extends StatefulWidget {
  VoiceHelp({Key? key, this.title = "Flutter example"}) : super(key: key);

  final String title;

  @override
  _VoiceHelpState createState() => _VoiceHelpState();
}

class _VoiceHelpState extends State<VoiceHelp> {
  _VoiceHelpState() {
    AlanVoice.addButton(
        "893735960ce2e6d01263bfe736e6fe8d2e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainHeading(
                first: "ASK",
                second: "HELP",
                size: 31,
              ),
              Container(
                height: 500,
                child: Center(
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 81,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
