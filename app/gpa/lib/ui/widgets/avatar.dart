import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BigAvatar extends StatelessWidget {
  const BigAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Neumorphic(
        padding: EdgeInsets.all(12),
        style: NeumorphicStyle(
            color: Color(0xffa1eafb).withAlpha(255),
            boxShape: NeumorphicBoxShape.circle(),
            depth: 20,
            lightSource: LightSource.bottomRight,
            shadowDarkColor: Color(0xffa1eafb).withAlpha(255)),
        child: Neumorphic(
            style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                depth: 20,
                lightSource: LightSource.topLeft,
                shadowDarkColor: Color(0xffffcef3).withAlpha(255)),
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: CircleAvatar(
                radius: 60,
                child: Image.asset(
                  'assets/avatar/img.jpg',
                ),
              ),
            )),
      ),
    );
  }
}

class SmallAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(
        4,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Center(
        child: Align(
          alignment: Alignment.topRight,
          child: Neumorphic(
            style: NeumorphicStyle(
                // border: NeumorphicBorder(
                //   width: 5,
                //   color: Color(0xffa1eafb)
                // ),
                boxShape: NeumorphicBoxShape.circle(),
                depth: 20,
                lightSource: LightSource.right,
                shadowDarkColor: Color(0xffffcef3),
                shadowLightColor: Colors.purple[100]),
            child: CircleAvatar(
              radius: AppBar().preferredSize.height / 2,
              backgroundColor: Color(0xffa1eafb),
              child: ClipOval(
                child: Image(
                  image: Image.asset('assets/avatar/img.jpg').image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
