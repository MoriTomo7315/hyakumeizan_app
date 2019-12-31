import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/mountain_model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class HyakumeizansDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("について"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('一覧に戻る'),
        ),
      ),
    );
  }
}

