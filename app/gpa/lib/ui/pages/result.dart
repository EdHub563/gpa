import 'dart:ui';
import 'package:pimp_my_button/pimp_my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

Map<int, String> gradesList = {};

class ResultsPage extends StatefulWidget {
  static String id = 'resultspage';
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final colors = [
    Color(0xffcabbe9),
    Color(0xffffcef3),
    Color(0xffecfffb),
    Color(0xffa1eafb),
    Color(0xfffff4e3),
    Color(0xffa6fff2),
    Color(0xffcabbe9)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          floating: true,
          pinned: true,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.all(2),
                height: AppBar().preferredSize.height,
                child: Center(
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
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: Container(
                  // color: Colors.blueAccent,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.adjust),
                ),
              ),
              Wrap(
                children: List<Widget>.generate(
                  7,
                  (index) => Provider<int>(
                      create: (context) => index,
                      child: SubjectTile(color: colors[index])),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class SubjectTile extends StatefulWidget {
  final Color color;
  SubjectTile({@required this.color});

  @override
  _SubjectTileState createState() => _SubjectTileState();
}

class _SubjectTileState extends State<SubjectTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 2,
          color: Colors.black38,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: widget.color,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'MA101 - Anirban Laxman',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              GradeBar()
            ],
          ),
        ),
      ],
    );
  }
}

class GradeBar extends StatefulWidget {
  @override
  _GradeBarState createState() => _GradeBarState();
}

class _GradeBarState extends State<GradeBar> {
  int _value = -1;
  final grades = ['Ex', 'A', 'B', 'C', 'D', 'P', 'F'];
  final avatarColors = [
    Color(0xff69f0ae),
    Color(0xffffc400),
    Color(0xffff9100),
    Color(0xffff3d00),
    Color(0xff5e35b1),
    Color(0xff455a64),
    Color(0xffff1744),
  ];
  final emoji = [
    'ex.gif',
    'a.gif',
    'b.gif',
    'c.gif',
    'd.gif',
    'p.gif',
    'f.gif'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: List<Widget>.generate(
          7,
          (int index) {
            return Container(
              padding: index != 6
                  ? EdgeInsets.only(right: 5)
                  : EdgeInsets.only(right: 0),
              child: PimpedButton(
                particle: DemoParticle(),
                pimpedWidgetBuilder: (context, controller) => ChoiceChip(
                  elevation: _value == index ? 8 : 0,
                  shadowColor: Colors.black12,
                  avatar: _value == index
                      ? CircleAvatar(
                          backgroundColor: avatarColors[index],
                          child: Text(
                            '${grades[index]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : null,
                  backgroundColor: Colors.white10,
                  label: _value == index
                      ? Image.asset(
                          'assets/gifs/' + emoji[index],
                          height: 25,
                          width: 25,
                        )
                      : Text(
                          '${grades[index]}',
                          style: TextStyle(),
                        ),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      // print('List index : ${Provider.of<int>(context, listen : false)}    :   grade = $index');
                      gradesList[Provider.of<int>(context, listen: false)] =
                          grades[index];
                      var temp = _value;
                      if (_value != index) _value = selected ? index : null;
                      if (index == 0 && temp != index)
                        controller.forward(from: 0.0);
                      if (gradesList.length == 7)
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.done, color: Colors.white)),
                                        Text('Submit Grades?'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      textColor: Color(0xFF6200EE),
                                      onPressed: () {},
                                      child: Text('CANCEL'),
                                    ),
                                    FlatButton(
                                      textColor: Color(0xFF6200EE),
                                      onPressed: () {},
                                      child: Text('SUBMIT'),
                                    ),
                                  ],
                                ));
                    });
                  },
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
