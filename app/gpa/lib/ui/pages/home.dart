import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../widgets/avatar.dart';
import '../widgets/semesterCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    super.dispose();
  }

  onScroll() {
    setState(() {
      if (wi is BigAvatar) if (controller.offset /
              controller.position.maxScrollExtent >=
          0.3) {
        wi = SmallAvatar();
      }
      if (wi is SmallAvatar) if (controller.offset /
              controller.position.maxScrollExtent <=
          0.7) {
        wi = BigAvatar();
      }
    });
  }

  final colors = [
    Color(0xffcabbe9),
    Color(0xffffcef3),
    Color(0xffecfffb),
    Color(0xffa1eafb),
    Color(0xfffff4e3),
    Color(0xffa6fff2),
    Color(0xffa1eafb),
    Color(0xffa1eafb),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: controller, slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          expandedHeight: 190,
          floating: true,
          pinned: true,
          flexibleSpace: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
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
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Gaurav Anand',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Text('CGPA : 8.73',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38)),
                      SizedBox(height: 40)
                    ],
                  ),
                ),
              ),
              Wrap(
                children: List<Widget>.generate(
                    8,
                    (index) => Provider<int>(
                          create: (context) => index,
                          child: Provider<GlobalKey<ScaffoldState>>(
                            create: (context) => _scaffoldKey,
                            child: SemesterTile(
                              color: colors[index],
                              text: 'Semester ${index + 1}',
                              cgpa: '8.28',
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
