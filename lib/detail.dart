import 'dart:ui';
import 'package:flutter/material.dart';
import 'model/mountain_model.dart';

class HyakumeizansDetail extends StatelessWidget {
  final Mountain mountain;

  HyakumeizansDetail({Key key, @required this.mountain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${mountain.name}について"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ 
            areaSection(mountain),
            titleSection(mountain),
            elevationSection(),
            imageSection(),
            detailSection(),
            buttonSection(context),
          ]
        ),
      )
    );
  }

  Widget areaSection(Mountain mountain) {
    return Container (
      margin: const EdgeInsets.fromLTRB(0,16.0,16.0,0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          child: Text(
            mountain.area,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        )
      ),
    );
  }

  Widget titleSection(Mountain mountain) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32.0,16.0,0,16.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              mountain.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(4.0,10,0,0),
            child: Text(
              mountain.yomi,
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            )
          ),
        ],
      ),
    );
  }

  Widget elevationSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32.0,16.0,0,16.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              "標高",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0,5.0,0,0),
            child: Text(
              "${mountain.elevation} m",
              style: TextStyle(color: Colors.grey[500], fontSize: 22),
            )
          ),
        ],
      )
    );
  }

  Widget imageSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0,0,0,20.0),
      child: Image.asset('images/sample.jpg'),
    );
  }

  Widget detailSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(32.0,16.0,32.0,32.0),
      child: Text(mountain.detail),
    );
  }

  Widget buttonSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0,0,0,32.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('一覧に戻る'),
      ),
    );
  }

}

