import 'package:app/navkeys.dart';
import 'package:app/pages/Home/Modules/CreateAvatar/feedbackScreen.dart';
import 'package:app/widgets/AppBar.dart';
import 'package:app/widgets/CircularLoader.dart';
import 'package:app/widgets/Heading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:image_downloader/image_downloader.dart';

// import 'string_extensions.dart';
class GeneratedAvatar extends StatefulWidget {
  String? hairLabel;
  String? eyeLabel;
  String? text;
  bool isSaved = false;
  bool isSavedLoader = false;
  GeneratedAvatar({super.key, this.hairLabel, this.eyeLabel});

  @override
  State<GeneratedAvatar> createState() => _GeneratedAvatarState();
}

class _GeneratedAvatarState extends State<GeneratedAvatar> {
  downloadImage() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(
          "http://10.97.22.193:5000/${widget.hairLabel}%20hair/${widget.eyeLabel}%20eyes");
      if (imageId == null) {
        return;
      }
      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      String? path = await ImageDownloader.findPath(imageId);
      setState(() {
        widget.isSavedLoader = false;
        widget.isSaved = true;
      });
      return path;
    } on PlatformException catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.hairLabel!);
    print(widget.eyeLabel!);
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          MainHeading(
            first: "YOUR",
            second: "AVATAR",
            size: 31,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
              "${widget.hairLabel![0].toUpperCase()}${widget.hairLabel!.substring(1).toLowerCase()} Hair  with  ${widget.eyeLabel![0].toUpperCase()}${widget.eyeLabel!.substring(1).toLowerCase()} Eyes",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.alegreyaSans(color: Colors.white, fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'http://192.168.43.123:5000/${widget.hairLabel}%20hair/${widget.eyeLabel}%20eyes'),
                fit: BoxFit.fill,
              ),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          ),
          actionBtns()
        ]),
      ),
    );
  }

  Column actionBtns() {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1E1E1E)),
            onPressed: () {
              if (!widget.isSaved) {
                setState(() {
                  widget.isSavedLoader = true;
                });
                downloadImage();
              }
            },
            child: widget.isSavedLoader
                ? CircularLoader()
                : Text(
                    widget.isSaved ? 'Saved' : 'Save',
                    style: GoogleFonts.alegreyaSans(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        color: Colors.white,
                        fontSize: 20),
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
              // Navigation.mainNavigation.currentState!.pushNamed('/chat');
            },
            child: Text(
              'Share',
              style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 20),
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
              widget.text =
                  "${widget.hairLabel![0].toUpperCase()}${widget.hairLabel!.substring(1).toLowerCase()} Hair  with  ${widget.eyeLabel![0].toUpperCase()}${widget.eyeLabel!.substring(1).toLowerCase()} Eyes";
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AvatarFeedBack(text: widget.text!),
              ));
            },
            child: Text(
              'Feedback',
              style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
