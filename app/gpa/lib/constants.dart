import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

final kHeading1 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, textStyle: TextStyle(fontSize: 25));

final kHeading2 = TextStyle(
    fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey[400]);

final kHeading4 = GoogleFonts.montserrat(
    textStyle:
    TextStyle(color: Colors.blueGrey[400], fontWeight: FontWeight.w400));

final kHeading3 = GoogleFonts.montserrat(
    textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16));

void kShowSnackBar(BuildContext context, String content, bool noError) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: noError ? Colors.green : Colors.redAccent,
        content: Text(
            content,
            style: TextStyle(color: Colors.white, letterSpacing: 0.5),
        ),
    ));
}

final kProcessMessage =
'''1. Fill in the common application form using the EdMissions App and click on apply button.\n
    2. Pay the one time admission charge.\n
    3. When accepted you will be informed about the video interview process.\n
    4. Take a printout of admission form for future reference\n
    5. For any query, reach out to us on the contact listed below.''';

final kAboutMessage =
'''Gyan Niketan, a pioneer in the trendsetting education in the state, provides an environment for al-round development of pupils and their integration with the society based on values of Indian Culture. It tries to inculcate in the pupils values of personal hygiene, cleanliness of surroundings, obedience to their elders and, above all discipline. To achieve all these, along with a high academic standard, a highly motivated and dedicated team of qualified teachers play a very important role to help in the growth of their students (Gyanis) The rapport between the teachers and the students also help the pupils in preparing their lessons and to use new methods of teaching techniques viz. demonstration, experimentation, project work and home assignments to make their lessons interesting which leads to good results. Gyan Niketan has a glorious past. Many eminent educationists are attached to this institution. Their regular visits grow effectively in all direction.''';

final kShowToast = Fluttertoast.showToast(
    msg: "Copied!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.pink,
    textColor: Colors.black,
    fontSize: 12.0);