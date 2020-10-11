import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double isScrolled = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: ScrollController(
          
        ),
        slivers: [
        SliverAppBar(
          backgroundColor: Colors.blueGrey[900],
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          flexibleSpace: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(vertical :15),
                height: 150,
                width: double.infinity,
                child: Neumorphic(
                  padding: EdgeInsets.all(12),
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 20,
                      lightSource: LightSource.bottomRight,
                      shadowDarkColor: Colors.black26),
                  child: Neumorphic(
                      style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 20,
                          lightSource: LightSource.topRight,
                          shadowDarkColor: Colors.pink[50]),
                      child: ClipOval(
                        clipBehavior: Clip.hardEdge,
                        child: CircleAvatar(
                          child: Image.asset(
                            'assets/avatar/img.jpg',
                          ),
                        ),
                      )),
                ),
              ),
              isScrolled? SizedBox(height :  2) : Text('Gaurav Anand', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                  Text('Hi'),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
