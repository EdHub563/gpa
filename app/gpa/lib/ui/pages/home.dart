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
    print(controller.offset / controller.position.maxScrollExtent);
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
                margin: EdgeInsets.only(top:5),
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
                      Text('CGPA : 8.73',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black38)),
                      SizedBox(height: 40)
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SemesterTile(color: Color(0xffcabbe9),text: 'Semester 1', cgpa: 8.25,),
                  SemesterTile(color: Color(0xffffcef3),text: 'Semester 2', cgpa: 8.33,),
                  SemesterTile(color: Color(0xffecfffb),text: 'Semester 3', cgpa: 7.95,),
                  SemesterTile(color: Color(0xffa1eafb),text: 'Semester 4', cgpa: 9.15,),
                  SemesterTile(color: Color(0xfffff4e3),text: 'Semester 5', cgpa: 8.63,),
                  SemesterTile(color: Color(0xffa6fff2),text: 'Semester 6', cgpa: 8.42,),
                  SemesterTile(color: Color(0xffa1eafb),text: 'Semester 7', cgpa: 8.22,),
                  SemesterTile(color: Color(0xffa1eafb),text: 'Semester 8', cgpa: 8.18,),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class SemesterTile extends StatelessWidget {
  final color;
  final text;
  final cgpa;
  SemesterTile({@required this.color, @required this.text, @required this.cgpa});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: w * 0.09,
            ),
            Icon(
              Icons.adjust,
              size: 18,
              color: Colors.black45,
            ),
            Container(
              height: 1,
              width: w * 0.10,
              color: Colors.black38,
            ),
            Container(color: color, height: h * 0.085, width: w * 0.7, child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 0.3)),
                  SizedBox(width: 4,),
                  Text('$cgpa',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54))
                ],
              ),
            ),),
          ],
        ),
        SizedBox(height: h * 0.046)
      ],
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
