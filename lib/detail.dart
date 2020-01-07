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
      body: Center(
          child: Column(
            children: <Widget>[ 
              titleSection(mountain),
              Text(mountain.detail),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('一覧に戻る'),
              ),
            ]
        ),
      )
    );
  }

  Widget titleSection(Mountain mountain) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              mountain.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              mountain.area,
              style: TextStyle(color: Colors.grey[500]),
            )
          ),
        ],
      ),
    );
  }
}

