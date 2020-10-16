import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../widgets/avatar.dart';
import '../widgets/semesterCard.dart';

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

