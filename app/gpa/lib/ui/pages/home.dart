import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  Widget wi = BigAvatar();
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);
  }

  onScroll() {
    setState(() {
      if (wi is BigAvatar) if (controller.offset /
              controller.position.maxScrollExtent >=
          0.3) wi = SmallAvatar();
      if (wi is SmallAvatar) if (controller.offset /
              controller.position.maxScrollExtent <=
          0.7) wi = BigAvatar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: controller, slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          expandedHeight: 190,
          floating: true,
          pinned: true,
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 10),
                height: AppBar().preferredSize.height,
                // color: Colors.blueAccent,
                child: Image(
                  image: Image.asset('assets/avatar/logo.png').image,
                ),
              ),
              Expanded(
                child: Container(
                  // color: (wi is BigAvatar) ? Colors.red : Colors.blue,
                  margin: EdgeInsets.only(top: 25),
                  // padding: EdgeInsets.only(top: 15),
                  height: 180,
                  child: AnimatedSwitcher(
                    transitionBuilder: (widget, animation) => ScaleTransition(
                      scale: animation,
                      child: widget,
                    ),
                    child: wi,
                    duration: Duration(milliseconds: 250),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

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
            color: Color(0xffa1eafb),
            boxShape: NeumorphicBoxShape.circle(),
            depth: 20,
            lightSource: LightSource.bottomRight,
            shadowDarkColor: Color(0xffa1eafb)),
        child: Neumorphic(
            style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                depth: 20,
                lightSource: LightSource.topLeft,
                shadowDarkColor: Color(0xffffcef3)),
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
