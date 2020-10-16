import 'package:flutter/material.dart';

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

