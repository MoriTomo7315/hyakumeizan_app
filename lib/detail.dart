import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/mountain_model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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
}

