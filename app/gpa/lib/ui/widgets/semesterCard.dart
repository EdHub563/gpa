import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/result.dart';

class SemesterTile extends StatelessWidget {
  final color;
  final text;
  final cgpa;
  SemesterTile(
      {@required this.color, @required this.text, @required this.cgpa});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context:
                Provider.of<GlobalKey<ScaffoldState>>(context, listen: false)
                    .currentContext,
            builder: (BuildContext bc) {
              return DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  maxChildSize: 0.5,
                  minChildSize: 0.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.book,
                                  color: Colors.purple[200],
                                  size: 30,
                                ),
                                Text(
                                  'Confirm Courses',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // CircleAvatar(
                                //   backgroundColor: Colors.white,
                                //   child: Icon(Icons.edit, color: Colors.red,),
                                // ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ResultsPage.id);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green[400],
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: 7,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ListTile(
                                    dense: true,
                                    leading: CircleAvatar(child: Text('AL')),
                                    title: Text('MA301'),
                                    subtitle: Text('Anirban Laxman'),
                                    trailing: Text('3 Credits'),
                                    onTap: () => {}),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            });
      },
      child: Column(
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
              Container(
                color: color,
                height: h * 0.085,
                width: w * 0.7,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(text,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3)),
                      SizedBox(
                        width: 4,
                      ),
                      Text('$cgpa',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54))
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.046)
        ],
      ),
    );
  }
}
